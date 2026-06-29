#!/usr/bin/env bash
# ==============================================================================
# ArchPerf Pro - Premium Installer & System Setup Utility
# Swiss Army Knife: install, build, update, kill, restart, clean, doctor, verify
# ==============================================================================

set -uo pipefail

# --- Configuration ---
readonly APP_NAME="ArchPerf Pro"
readonly VERSION="7.1.0"
readonly APPIMAGE_NAME="ArchPerf Pro-${VERSION}.AppImage"
readonly INSTALL_DIR="${HOME}/.local/share/archperf-pro"
readonly BIN_DIR="${HOME}/.local/bin"
readonly MAIN_BINARY="ArchPerf Pro-${VERSION}"
readonly BIN="${BIN_DIR}/${MAIN_BINARY}"
readonly CONVENIENCE_BIN="${BIN_DIR}/ArchPerf"
readonly DESKTOP_FILE="${HOME}/.local/share/applications/${APP_NAME}.desktop"
readonly DESKTOP_FILE_ALT="${HOME}/.local/share/applications/pkgdrop-${APP_NAME}-${VERSION}.desktop"
readonly LAUNCHER="${INSTALL_DIR}/launcher.sh"
readonly PID_FILE="${INSTALL_DIR}/.pid"

# Legacy paths
readonly LEGACY_BINS=(
  "${BIN_DIR}/archperf"
  "${BIN_DIR}/ArchPerf-Pro"
)
readonly LEGACY_DESKTOPS=(
  "${HOME}/.local/share/applications/ArchPerf.desktop"
  "${HOME}/.local/share/applications/archperf.desktop"
  "${HOME}/.local/share/applications/archperf-pro.desktop"
)

# --- Typography & Colors ---
if [[ -t 1 ]]; then
  readonly C_CYAN='\e[38;5;51m'
  readonly C_MAGENTA='\e[38;5;141m'
  readonly C_GREEN='\e[38;5;82m'
  readonly C_YELLOW='\e[38;5;226m'
  readonly C_RED='\e[38;5;196m'
  readonly C_BLUE='\e[38;5;33m'
  readonly C_BOLD='\e[1m'
  readonly C_DIM='\e[2m'
  readonly C_RESET='\e[0m'
else
  readonly C_CYAN='' C_MAGENTA='' C_GREEN='' C_YELLOW='' C_RED='' C_BLUE=''
  readonly C_BOLD='' C_DIM='' C_RESET=''
fi

# --- Globals ---
VERBOSE=0
DRY_RUN=0

# ============================================================================
# LOGGING
# ============================================================================
log_info()    { echo -e "${C_BLUE}[i]${C_RESET} $*"; }
log_success() { echo -e "${C_GREEN}[✓]${C_RESET} $*"; }
log_warn()    { echo -e "${C_YELLOW}[!]${C_RESET} $*"; }
log_error()   { echo -e "${C_RED}[✗]${C_RESET} $*" >&2; }
log_verbose() { [[ "$VERBOSE" == "1" ]] && echo -e "${C_DIM}[...]${C_RESET} $*" || true; }

# ============================================================================
# HELPERS
# ============================================================================
print_banner() {
  echo -e "${C_CYAN}${C_BOLD}"
  echo -e "  ┌────────────────────────────────────────────────────────┐"
  echo -e "  │                 A R C H P E R F   P R O                │"
  echo -e "  │              System Optimization Installer             │"
  echo -e "  └────────────────────────────────────────────────────────┘"
  echo -e "${C_RESET}"
}

clear_screen() {
  if [[ -t 1 ]]; then
    clear || printf '\033[2J\033[H'
  fi
}

wait_key() {
  if [[ -t 0 ]]; then
    echo -e "\n${C_DIM}Press Enter to continue...${C_RESET}"
    read -r _ || true
  fi
}

die() { log_error "$*"; exit 1; }

need_root() {
  if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
    die "Please run as regular user, not root."
  fi
}

# ============================================================================
# PROCESS DETECTION & KILLING
# ============================================================================

# Validate that a PID is a real, valid ArchPerf process
# Returns 0 if valid ArchPerf process, 1 otherwise
is_valid_archperf_pid() {
  local pid="$1"

  # Must be a positive integer
  [[ "$pid" =~ ^[0-9]+$ ]] || return 1

  # Process must actually exist
  kill -0 "$pid" 2>/dev/null || return 1

  # Read command info
  local cmdline
  cmdline=$(tr '\0' ' ' < "/proc/$pid/cmdline" 2>/dev/null || echo "")

  # Get executable path
  local exe
  exe=$(readlink "/proc/$pid/exe" 2>/dev/null || echo "")

  # Exclude terminal emulators and shells entirely
  [[ "$exe" =~ (konsole|gnome-terminal|xterm|tilix|kitty|alacritty|terminology|bash|zsh)$ ]] && return 1

  # Exclude this setup script itself
  [[ "$cmdline" == *"./setup"* || "$cmdline" == *"/setup install"* || "$cmdline" == *"/setup kill"* ]] && return 1

  # Must be a process whose executable is the ArchPerf AppImage or electron
  local is_archperf_exe=0
  if [[ "$exe" == *".AppImage"* ]]; then
    is_archperf_exe=1
  elif [[ "$exe" == *"archperf"* ]]; then
    is_archperf_exe=1
  elif [[ "$exe" == *"electron"* ]]; then
    # Electron could be ArchPerf - check cmdline for app-specific indicators
    [[ "$cmdline" == *"archperf"* || "$cmdline" == *"ArchPerf"* ]] && is_archperf_exe=1
  fi

  # Also check if cmdline references the ArchPerf AppImage directly
  [[ "$cmdline" == *"/.local/share/archperf-pro/"* ]] && is_archperf_exe=1
  [[ "$cmdline" == *".mount_ArchPe"* ]] && is_archperf_exe=1  # AppImage mount dirs

  [[ "$is_archperf_exe" == "1" ]] || return 1

  return 0
}

# Find all ArchPerf-related processes. Searches specifically to catch orphans.
find_archperf_pids() {
  local pids=()
  local self="$$"
  local parent

  # Get parent pid reliably
  if [[ -f /proc/$$/status ]]; then
    parent=$(awk '/^PPid:/ {print $2}' /proc/$$/status 2>/dev/null || echo "$PPID")
  else
    parent="$PPID"
  fi

  # Collect candidates from pgrep, but be careful not to match workdir paths
  # Match actual ArchPerf binaries/AppImages by their executable name
  local candidates
  mapfile -t candidates < <(pgrep -f "\.AppImage.*ArchPerf" 2>/dev/null || true)

  for pid in "${candidates[@]}"; do
    [[ "$pid" == "$self" || "$pid" == "$parent" ]] && continue
    if is_valid_archperf_pid "$pid"; then
      pids+=("$pid")
    fi
  done

  # Also look for electron processes that are clearly ArchPerf
  for pid in $(pgrep -f "electron.*archperf|electron.*ArchPerf" 2>/dev/null || true); do
    [[ "$pid" == "$self" || "$pid" == "$parent" ]] && continue
    if is_valid_archperf_pid "$pid"; then
      pids+=("$pid")
    fi
  done

  # Also check for our specific AppImage mount directory patterns
  for pid in $(pgrep -f "\.mount_ArchP" 2>/dev/null || true); do
    [[ "$pid" == "$self" || "$pid" == "$parent" ]] && continue
    if is_valid_archperf_pid "$pid"; then
      pids+=("$pid")
    fi
  done

  # Deduplicate and return
  if ((${#pids[@]} > 0)); then
    printf '%s\n' "${pids[@]}" | sort -nu
  fi
}

# Find any orphaned tray icon processes for ArchPerf
find_tray_pids() {
  local pids=()
  local self="$$"
  local parent="$PPID"

  # Only match tray/indicator processes that are specifically ArchPerf related
  for pid in $(pgrep -f "archperf.*tray|archperf.*indicator|indicator.*archperf" 2>/dev/null || true); do
    [[ "$pid" == "$self" || "$pid" == "$parent" ]] && continue
    pids+=("$pid")
  done

  printf '%s\n' "${pids[@]}" 2>/dev/null | sort -u || true
}

# Gracefully kill a process: SIGTERM -> wait 2s -> SIGKILL
kill_process() {
  local pid="$1"
  local name="${2:-pid ${pid}}"
  local timeout="${3:-3}"

  if ! kill -0 "$pid" 2>/dev/null; then
    log_verbose "  $name already dead"
    return 0
  fi

  log_info "  Sending SIGTERM to $name (PID $pid)..."
  kill -TERM "$pid" 2>/dev/null || true

  # Wait up to $timeout seconds for graceful exit
  local count=0
  while kill -0 "$pid" 2>/dev/null && ((count < timeout)); do
    sleep 1
    ((count++))
  done

  if kill -0 "$pid" 2>/dev/null; then
    log_warn "  Force-killing $name (PID $pid)..."
    kill -KILL "$pid" 2>/dev/null || true
    sleep 0.5
  fi

  if kill -0 "$pid" 2>/dev/null; then
    log_error "  Failed to kill $name (PID $pid)"
    return 1
  fi

  log_verbose "  $name terminated"
  return 0
}

# Kill all ArchPerf processes and orphaned tray icons
do_kill() {
  clear_screen
  print_banner
  log_info "Scanning for ArchPerf processes..."

  local total=0

  # Kill main app processes
  for pid in $(find_archperf_pids); do
    local comm
    comm=$(ps -p "$pid" -o comm= 2>/dev/null || echo "unknown")
    kill_process "$pid" "$comm"
    ((total++)) || true
  done

  # Kill orphaned tray icons
  for pid in $(find_tray_pids); do
    local comm
    comm=$(ps -p "$pid" -o comm= 2>/dev/null || echo "unknown")
    kill_process "$pid" "tray: $comm"
    ((total++)) || true
  done

  # Also kill any electron crashing processes that might be orphaned
  for pid in $(pgrep -f "electron.*archperf|archperf.*electron" 2>/dev/null || true); do
    kill_process "$pid" "electron orphan"
    ((total++)) || true
  done

  echo ""
  if ((total > 0)); then
    log_success "Terminated $total process(es)."
  else
    log_info "No running processes found."
  fi
  wait_key
}

# ============================================================================
# INSTALLATION DETECTION
# ============================================================================

detect_installation() {
  local components=()

  # Installed binary
  if [[ -L "${BIN}" || -f "${BIN}" ]]; then
    components+=("binary:${BIN}")
  fi
  if [[ -L "${CONVENIENCE_BIN}" || -f "${CONVENIENCE_BIN}" ]]; then
    components+=("symlink:${CONVENIENCE_BIN}")
  fi

  # AppImage
  if [[ -f "${INSTALL_DIR}/${APPIMAGE_NAME}" ]]; then
    components+=("appimage:${INSTALL_DIR}/${APPIMAGE_NAME}")
  fi

  # Launcher
  if [[ -f "${LAUNCHER}" ]]; then
    components+=("launcher:${LAUNCHER}")
  fi

  # Desktop files
  for df in "${DESKTOP_FILE}" "${DESKTOP_FILE_ALT}"; do
    [[ -f "$df" ]] && components+=("desktop:${df}")
  done
  for df in "${LEGACY_DESKTOPS[@]}"; do
    [[ -f "$df" ]] && components+=("legacy:${df}")
  done

  # Icons
  for sz in scalable 16x16 22x22 32x32; do
    local icon="${HOME}/.local/share/icons/hicolor/${sz}/apps/archperf.png"
    [[ -f "$icon" ]] && components+=("icon:${sz}")
  done

  printf '%s\n' "${components[@]}" 2>/dev/null || true
}

is_installed() {
  [[ -f "${INSTALL_DIR}/${APPIMAGE_NAME}" ]]
}

# ============================================================================
# INSTALL
# ============================================================================
do_install() {
  clear_screen
  print_banner

  need_root

  if is_installed; then
    log_info "Previous installation detected. Running update..."
  else
    log_info "Installing ${APP_NAME} v${VERSION}..."
  fi

  # Kill any running instances first (THIS IS CRITICAL)
  log_info "Stopping running instances..."
  local running=0
  for pid in $(find_archperf_pids); do
    local comm
    comm=$(ps -p "$pid" -o comm= 2>/dev/null || echo "unknown")
    log_info "  Stopping PID $pid ($comm)"
    kill_process "$pid" "$comm" 5
    ((running++)) || true
  done

  for pid in $(find_tray_pids); do
    local comm
    comm=$(ps -p "$pid" -o comm= 2>/dev/null || echo "unknown")
    log_info "  Stopping tray PID $pid ($comm)"
    kill_process "$pid" "$comm" 3
    ((running++)) || true
  done

  if ((running > 0)); then
    log_success "Stopped $running running instance(s)."
  fi

  # Find AppImage
  local img=""
  local search_paths=(
    "${PWD}/release/${APPIMAGE_NAME}"
    "${PWD}/dist/linux-unpacked/${APPIMAGE_NAME}"
    "${PWD}/dist/${APPIMAGE_NAME}"
  )

  for candidate in "${search_paths[@]}"; do
    if [[ -n "$candidate" && -f "$candidate" ]]; then
      img="$candidate"
      break
    fi
  done

  # Fallback: find any AppImage
  if [[ -z "$img" ]]; then
    img=$(find "${PWD}" -maxdepth 3 -name "*.AppImage" -type f 2>/dev/null | head -1)
  fi

  if [[ -z "$img" || ! -f "$img" ]]; then
    log_error "AppImage not found."
    log_info "Run './setup build' first to build the AppImage."
    wait_key
    return 1
  fi

  log_info "Using AppImage: ${img}"

  # Clean up old installations
  log_info "Cleaning up old installation files..."
  rm -f "${BIN}"
  rm -f "${CONVENIENCE_BIN}"
  rm -f "${DESKTOP_FILE}"
  rm -f "${DESKTOP_FILE_ALT}"
  rm -f "${LAUNCHER}"
  for lb in "${LEGACY_BINS[@]}"; do rm -f "$lb"; done
  for ld in "${LEGACY_DESKTOPS[@]}"; do rm -f "$ld"; done

  # Create directories
  log_info "Creating directories..."
  mkdir -p "${BIN_DIR}" "$(dirname "${DESKTOP_FILE}")" "${INSTALL_DIR}"

  # Install AppImage
  log_info "Installing AppImage..."
  cp "$img" "${INSTALL_DIR}/${APPIMAGE_NAME}"
  chmod +x "${INSTALL_DIR}/${APPIMAGE_NAME}"

  # Create launcher wrapper (supports ELECTRON_* env vars and args)
  log_info "Creating launcher..."
  cat > "${LAUNCHER}" << 'LAUNCHER'
#!/bin/bash
# ArchPerf Pro launcher
ELECTRON_DISABLE_GPU=1
ARCHPERF_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
ARCHPERF_APP="${ARCHPERF_DIR}/ArchPerf Pro-'"${VERSION}"'.AppImage"
exec "${ARCHPERF_APP}" --disable-gpu --no-sandbox "$@"
LAUNCHER
  chmod +x "${LAUNCHER}"

  # Create symlinks
  log_info "Creating symlinks..."
  ln -sf "${LAUNCHER}" "${BIN}"
  ln -sf "${BIN}" "${CONVENIENCE_BIN}"

  # Install icons
  log_info "Installing icons..."
  for sz in scalable 16 22 32; do
    if [[ "$sz" == "scalable" ]]; then
      local src="${PWD}/icon.png"
      local dest="${HOME}/.local/share/icons/hicolor/scalable/apps/archperf.png"
    else
      local src="${PWD}/public/icon-${sz}.png"
      local dest="${HOME}/.local/share/icons/hicolor/${sz}x${sz}/apps/archperf.png"
    fi
    if [[ -f "$src" ]]; then
      mkdir -p "$(dirname "$dest")"
      cp "$src" "$dest"
      log_verbose "  Installed icon: $dest"
    fi
  done

  # Install tray icon in install dir too
  if [[ -f "${PWD}/public/icon-22.png" ]]; then
    cp "${PWD}/public/icon-22.png" "${INSTALL_DIR}/icon-22.png"
  fi

  # Create desktop file
  local icon_path="${HOME}/.local/share/icons/hicolor/scalable/apps/archperf.png"
  log_info "Creating desktop entry..."
  cat > "${DESKTOP_FILE}" << DESKTOP
[Desktop Entry]
Name=${APP_NAME}
Comment=Pro-Grade Arch Linux System Optimization Suite
Exec=${BIN}
Icon=${icon_path}
Type=Application
Categories=Settings;System;
Terminal=false
StartupNotify=true
DESKTOP
  chmod +x "${DESKTOP_FILE}"

  # Refresh caches
  log_info "Refreshing system caches..."
  update-desktop-database "$(dirname "${DESKTOP_FILE}")" 2>/dev/null || true
  gtk-update-icon-cache -f -t "${HOME}/.local/share/icons/hicolor" 2>/dev/null || true
  kbuildsycoca6 2>/dev/null || true

  echo ""
  log_success "${APP_NAME} v${VERSION} installed successfully!"
  echo ""
  echo -e "  ${C_BOLD}Executable:${C_RESET}  ${C_CYAN}${BIN}${C_RESET}"
  echo -e "  ${C_BOLD}Shortcmd:${C_RESET}    ${C_CYAN}${CONVENIENCE_BIN}${C_RESET}"
  echo -e "  ${C_BOLD}Desktop:${C_RESET}     ${C_CYAN}${DESKTOP_FILE}${C_RESET}"
  echo ""
  wait_key
}

# ============================================================================
# UNINSTALL
# ============================================================================
do_uninstall() {
  local silent="${1:-interactive}"
  need_root

  [[ "$silent" != "silent" ]] && clear_screen
  [[ "$silent" != "silent" ]] && print_banner
  [[ "$silent" != "silent" ]] && log_info "Uninstalling ${APP_NAME}..."

  # Kill all processes
  if [[ "$silent" != "silent" ]]; then
    log_info "Stopping running instances..."
  fi
  for pid in $(find_archperf_pids); do
    kill_process "$pid" "PID $pid" 5
  done
  for pid in $(find_tray_pids); do
    kill_process "$pid" "tray PID $pid" 3
  done

  # Remove files
  if [[ "$silent" != "silent" ]]; then
    log_info "Removing installation files..."
  fi
  rm -f "${BIN}" "${CONVENIENCE_BIN}" "${LAUNCHER}"
  rm -f "${DESKTOP_FILE}" "${DESKTOP_FILE_ALT}"
  rm -rf "${INSTALL_DIR}"
  for lb in "${LEGACY_BINS[@]}"; do rm -f "$lb"; done
  for ld in "${LEGACY_DESKTOPS[@]}"; do rm -f "$ld"; done

  # Refresh caches
  update-desktop-database "$(dirname "${DESKTOP_FILE}")" 2>/dev/null || true
  kbuildsycoca6 2>/dev/null || true

  [[ "$silent" != "silent" ]] && log_success "${APP_NAME} uninstalled." && wait_key
}

# ============================================================================
# BUILD
# ============================================================================
do_build() {
  clear_screen
  print_banner
  log_info "Building ${APP_NAME}..."

  if [[ ! -d "node_modules" ]]; then
    log_info "Installing dependencies..."
    npm install --legacy-peer-deps --no-audit --no-fund || npm ci --legacy-peer-deps --no-audit --no-fund || die "npm install failed"
  fi

  log_info "Building web assets..."
  npm run build || die "Build failed"

  log_info "Packaging as AppImage..."
  npm run electron:build || die "Packaging failed"

  log_success "Build complete!"
  local img
  img=$(find "${PWD}" -name "*.AppImage" -path "*/release/*" -type f 2>/dev/null | head -1)
  if [[ -n "$img" ]]; then
    echo -e "  ${C_BOLD}AppImage:${C_RESET} ${C_CYAN}${img}${C_RESET}"
    ls -lh "$img"
  fi
  wait_key
}

# Alias: rebuild = build
do_rebuild() { do_build; }

# ============================================================================
# UPDATE (copy new AppImage over existing install)
# ============================================================================
do_update() {
  clear_screen
  print_banner

  if ! is_installed; then
    log_error "No installation found. Run './setup install' first."
    wait_key
    return 1
  fi

  log_info "Updating ${APP_NAME}..."

  # Kill running instances
  log_info "Stopping running instances..."
  for pid in $(find_archperf_pids); do
    kill_process "$pid" "PID $pid" 5
  done
  for pid in $(find_tray_pids); do
    kill_process "$pid" "tray PID $pid" 3
  done

  # Find new AppImage
  local img=""
  for candidate in \
    "${PWD}/release/${APPIMAGE_NAME}" \
    "${PWD}/dist/linux-unpacked/${APPIMAGE_NAME}" \
    "$(find "${PWD}" -maxdepth 2 -name "*.AppImage" -type f 2>/dev/null | head -1)"; do
    [[ -n "$candidate" && -f "$candidate" ]] && img="$candidate" && break
  done

  if [[ -z "$img" ]]; then
    log_error "AppImage not found. Run './setup build' first."
    wait_key
    return 1
  fi

  log_info "Updating AppImage from: ${img}"
  cp "$img" "${INSTALL_DIR}/${APPIMAGE_NAME}"
  chmod +x "${INSTALL_DIR}/${APPIMAGE_NAME}"

  # Update launcher version if needed
  if [[ -f "${LAUNCHER}" ]]; then
    sed -i "s/ArchPerf Pro-[0-9.]*\.AppImage/ArchPerf Pro-${VERSION}.AppImage/" "${LAUNCHER}" 2>/dev/null || true
  fi

  log_success "Update complete!"
  wait_key
}

# ============================================================================
# RESTART
# ============================================================================
do_restart() {
  clear_screen
  print_banner

  if ! is_installed; then
    log_error "Not installed. Run './setup install' first."
    wait_key
    return 1
  fi

  log_info "Restarting ${APP_NAME}..."

  # Kill
  for pid in $(find_archperf_pids); do
    kill_process "$pid" "PID $pid" 5
  done
  for pid in $(find_tray_pids); do
    kill_process "$pid" "tray PID $pid" 3
  done

  sleep 1

  # Launch
  log_info "Launching..."
  nohup "${BIN}" >/dev/null 2>&1 &
  sleep 1

  local launched_pid=$!
  if kill -0 "$launched_pid" 2>/dev/null; then
    log_success "Launched as PID $launched_pid"
  else
    log_warn "Process may have exited quickly (check GUI)"
  fi
  wait_key
}

# ============================================================================
# RUN (direct launch with optional args)
# ============================================================================
do_run() {
  if ! is_installed && [[ ! -f "${INSTALL_DIR}/${APPIMAGE_NAME}" ]]; then
    log_error "Not installed. Run './setup install' first."
    return 1
  fi

  local img="${INSTALL_DIR}/${APPIMAGE_NAME}"
  if [[ ! -f "$img" ]]; then
    # Try to find it
    img=$(find "${PWD}" -name "*.AppImage" -path "*/release/*" -type f 2>/dev/null | head -1)
    [[ -z "$img" ]] && die "No AppImage found"
  fi

  shift  # remove 'run' arg
  exec "$img" --disable-gpu --no-sandbox "$@"
}

# ============================================================================
# CLEAN
# ============================================================================
do_clean() {
  clear_screen
  print_banner
  log_warn "Purging build artifacts..."

  rm -rf dist/ release/ node_modules/.vite/ coverage/ 2>/dev/null || true
  rm -f "*.log" app.log electron.log dev.log build.log 2>/dev/null || true

  log_success "Clean complete."
  wait_key
}

# ============================================================================
# STATUS
# ============================================================================
do_status() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}Installation Status:${C_RESET}"
  echo -e "  Version: ${C_CYAN}${VERSION}${C_RESET}"
  echo ""

  local components
  mapfile -t components < <(detect_installation)

  if [[ ${#components[@]} -eq 0 ]]; then
    echo -e "  Status:  ${C_RED}Not Installed${C_RESET}"
  else
    echo -e "  Status:  ${C_GREEN}Installed${C_RESET} (${#components[@]} component(s))"
    echo ""
    for comp in "${components[@]}"; do
      [[ -z "$comp" ]] && continue
      local type="${comp%%:*}"
      local path="${comp##*:}"
      case "$type" in
        binary|symlink)  echo -e "    ${C_GREEN}✓${C_RESET} $type:    $path" ;;
        appimage)        echo -e "    ${C_GREEN}✓${C_RESET} AppImage: $path" ;;
        launcher)        echo -e "    ${C_GREEN}✓${C_RESET} launcher: $path" ;;
        desktop|legacy)  echo -e "    ${C_CYAN}✓${C_RESET} desktop:  $path" ;;
        icon)            echo -e "    ${C_CYAN}✓${C_RESET} icon:     $path" ;;
        *)               echo -e "    ? $comp" ;;
      esac
    done
  fi

  echo ""
  local pids
  mapfile -t pids < <(find_archperf_pids)
  if [[ ${#pids[@]} -gt 0 ]]; then
    echo -e "  ${C_YELLOW}Running processes:${C_RESET}"
    for pid in "${pids[@]}"; do
      local comm cmdline
      comm=$(ps -p "$pid" -o comm= 2>/dev/null || echo "unknown")
      cmdline=$(ps -p "$pid" -o args= 2>/dev/null | head -c 60 || echo "")
      echo -e "    ${C_YELLOW}→${C_RESET} PID $pid: $comm $cmdline"
    done
  else
    echo -e "  Running: ${C_DIM}none${C_RESET}"
  fi

  wait_key
}

# ============================================================================
# VERIFY (check installed version matches source)
# ============================================================================
do_verify() {
  clear_screen
  print_banner
  log_info "Verifying installation..."

  local ok=0 fail=0

  # Check binary
  if [[ -L "${BIN}" || -f "${BIN}" ]]; then
    log_success "Binary: ${BIN}"
    ((ok++)) || true
  else
    log_error "Binary missing: ${BIN}"
    ((fail++)) || true
  fi

  # Check AppImage
  if [[ -f "${INSTALL_DIR}/${APPIMAGE_NAME}" ]]; then
    log_success "AppImage: ${INSTALL_DIR}/${APPIMAGE_NAME}"
    ((ok++)) || true
  else
    log_error "AppImage missing"
    ((fail++)) || true
  fi

  # Check desktop
  if [[ -f "${DESKTOP_FILE}" ]]; then
    log_success "Desktop: ${DESKTOP_FILE}"
    ((ok++)) || true
  else
    log_warn "Desktop file not found"
  fi

  # Check icons
  for sz in scalable 16 22 32; do
    if [[ "$sz" == "scalable" ]]; then
      local path="${HOME}/.local/share/icons/hicolor/scalable/apps/archperf.png"
    else
      local path="${HOME}/.local/share/icons/hicolor/${sz}x${sz}/apps/archperf.png"
    fi
    if [[ -f "$path" ]]; then
      log_success "Icon $sz: present"
    else
      log_warn "Icon $sz: missing"
    fi
  done

  # Check version match
  local installed_version
  installed_version=$(grep -oP 'VERSION="[^"]*"' "${LAUNCHER}" 2>/dev/null | cut -d'"' -f2 || echo "unknown")
  if [[ "$installed_version" == "${VERSION}" ]]; then
    log_success "Version match: ${VERSION}"
  else
    log_warn "Version mismatch - installed: $installed_version, source: ${VERSION}"
  fi

  echo ""
  log_info "Summary: $ok OK, $fail issues"
  wait_key
}

# ============================================================================
# DOCTOR (diagnostics)
# ============================================================================
do_doctor() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}Doctor - System Diagnostics:${C_RESET}\n"

  local issues=0

  # Node/npm
  echo -e "${C_BOLD}Node.js:${C_RESET}"
  if command -v node >/dev/null 2>&1; then
    log_success "node: $(node --version)"
  else
    log_error "node: not found"
    ((issues++)) || true
  fi
  if command -v npm >/dev/null 2>&1; then
    log_success "npm: $(npm --version)"
  else
    log_error "npm: not found"
    ((issues++)) || true
  fi

  echo ""

  # Required commands
  echo -e "${C_BOLD}Required commands:${C_RESET}"
  for cmd in pgrep kill stty; do
    if command -v "$cmd" >/dev/null 2>&1; then
      log_success "$cmd: found"
    else
      log_error "$cmd: missing"
      ((issues++)) || true
    fi
  done

  echo ""

  # Optional commands
  echo -e "${C_BOLD}Optional commands:${C_RESET}"
  for cmd in kbuildsycoca6 gtk-update-icon-cache update-desktop-database; do
    if command -v "$cmd" >/dev/null 2>&1; then
      log_success "$cmd: found"
    else
      log_warn "$cmd: not found (optional)"
    fi
  done

  echo ""

  # Permissions
  echo -e "${C_BOLD}Permissions:${C_RESET}"
  if [[ -w "${HOME}/.local/bin" ]]; then
    log_success "~/.local/bin: writable"
  else
    log_error "~/.local/bin: not writable"
    ((issues++)) || true
  fi
  if [[ -w "${HOME}/.local/share" ]]; then
    log_success "~/.local/share: writable"
  else
    log_error "~/.local/share: not writable"
    ((issues++)) || true
  fi

  echo ""

  # AppImage check
  echo -e "${C_BOLD}AppImage:${C_RESET}"
  local img
  for candidate in \
    "${PWD}/release/${APPIMAGE_NAME}" \
    "${PWD}/dist/linux-unpacked/${APPIMAGE_NAME}" \
    "${INSTALL_DIR}/${APPIMAGE_NAME}"; do
    if [[ -f "$candidate" ]]; then
      log_success "Found: $candidate"
      if [[ -x "$candidate" ]]; then
        log_success "Executable: yes"
      else
        log_warn "$candidate not executable - run: chmod +x \"$candidate\""
      fi
      break
    fi
  done

  echo ""
  if ((issues > 0)); then
    log_warn "Found $issues issue(s) - installation may fail"
  else
    log_success "All checks passed!"
  fi
  wait_key
}

# ============================================================================
# HELP
# ============================================================================
show_help() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}Usage:${C_RESET}  ./setup <command>

${C_BOLD}Commands:${C_RESET}
  ${C_CYAN}install${C_RESET}    - Build (if needed) and install ${APP_NAME}
  ${C_CYAN}build${C_RESET}      - Build web assets and package AppImage
  ${C_CYAN}rebuild${C_RESET}    - Alias for build
  ${C_CYAN}update${C_RESET}     - Update existing installation with new AppImage
  ${C_CYAN}uninstall${C_RESET}  - Remove all installation files
  ${C_CYAN}kill${C_RESET}       - Terminate all running ArchPerf processes
  ${C_CYAN}restart${C_RESET}     - Stop and relaunch the application
  ${C_CYAN}run${C_RESET}        - Launch directly (use -- to pass args)
  ${C_CYAN}status${C_RESET}     - Show installation status
  ${C_CYAN}verify${C_RESET}     - Verify installation integrity
  ${C_CYAN}clean${C_RESET}      - Remove build artifacts (dist/, release/)
  ${C_CYAN}doctor${C_RESET}      - Run diagnostics
  ${C_CYAN}help${C_RESET}       - Show this help

${C_BOLD}Examples:${C_RESET}
  ./setup install          # Full install
  ./setup build            # Just build
  ./setup update           # Update already-installed app
  ./setup kill             # Force stop all instances
  ./setup restart          # Restart the app
  ./setup run -- --help    # Launch with args
  ./setup clean            # Remove build files
  ./setup doctor           # Check for issues
"
  wait_key
}

# ============================================================================
# INTERACTIVE MENU
# ============================================================================
show_menu() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}Select an action:${C_RESET}\n"

  local items=(
    "Install / Update ${APP_NAME}"
    "Build AppImage"
    "Kill Running Processes"
    "Restart Application"
    "Installation Status"
    "Verify Installation"
    "Run Diagnostics (Doctor)"
    "Clean Build Cache"
    "Uninstall"
    "Help"
    "Quit"
  )

  for i in "${!items[@]}"; do
    if [[ $i -eq $SELECTED ]]; then
      echo -e "  ${C_CYAN}▶${C_RESET}  ${C_BOLD}${items[$i]}${C_RESET}"
    else
      echo -e "     ${C_DIM}${items[$i]}${C_RESET}"
    fi
  done

  echo -e "\n${C_DIM}──────────────────────────────────────────────────────────"
  echo -e " [↑/↓ or j/k] navigate  [Enter] select  [q] quit ${C_RESET}"
}

# ============================================================================
# MAIN
# ============================================================================
main() {
  if [[ ${EUID:-$(id -u)} -eq 0 ]]; then
    echo -e "${C_RED}[✗]${C_RESET} Please run as regular user, not root." >&2
    exit 1
  fi

  if [[ $# -gt 0 ]]; then
    case "$1" in
      install)       do_install ;;
      build|rebuild) do_build ;;
      update)        do_update ;;
      uninstall)     do_uninstall ;;
      kill)          do_kill ;;
      restart)       do_restart ;;
      run)           shift; do_run "$@" ;;
      status)        do_status ;;
      verify)         do_verify ;;
      clean)          do_clean ;;
      doctor)         do_doctor ;;
      help|--help|-h) show_help ;;
      restart)        do_restart ;;
      *)              log_error "Unknown command: '$1'"; echo "Run './setup help' for usage."; exit 1 ;;
    esac
    return
  fi

  # Interactive menu
  SELECTED=0
  readonly old_stty=$(stty -g 2>/dev/null || true)
  [[ -n "$old_stty" ]] && stty -echo -icanon 2>/dev/null || true

  while true; do
    show_menu
    if ! read -rsn1 key 2>/dev/null; then
      break
    fi

    case "$key" in
      $'\e')
        if read -rsn2 -t 0.05 rest 2>/dev/null; then
          case "$rest" in
            "[A") ((SELECTED > 0)) && ((SELECTED--)) ;;
            "[B") ((SELECTED < 10)) && ((SELECTED++)) ;;
          esac
        fi
        ;;
      k|K) ((SELECTED > 0)) && ((SELECTED--)) ;;
      j|J) ((SELECTED < 10)) && ((SELECTED++)) ;;
      q|Q|3) echo ""; echo -e "${C_BOLD}Goodbye!${C_RESET}"; break ;;
      1) SELECTED=0 ;;
      2) SELECTED=1 ;;
      3) SELECTED=2 ;;
      4) SELECTED=3 ;;
      5) SELECTED=4 ;;
      6) SELECTED=5 ;;
      7) SELECTED=6 ;;
      8) SELECTED=7 ;;
      9) SELECTED=8 ;;
      0) SELECTED=9 ;;
      ""|$'\n'|$'\r')
        [[ -n "$old_stty" ]] && stty "$old_stty" 2>/dev/null || true
        case $SELECTED in
          0) do_install ;;
          1) do_build ;;
          2) do_kill ;;
          3) do_restart ;;
          4) do_status ;;
          5) do_verify ;;
          6) do_doctor ;;
          7) do_clean ;;
          8) do_uninstall ;;
          9) show_help ;;
          10) echo ""; echo -e "${C_BOLD}Goodbye!${C_RESET}"; break ;;
        esac
        [[ -n "$old_stty" ]] && stty -echo -icanon 2>/dev/null || true
        ;;
    esac
  done
  [[ -n "$old_stty" ]] && stty "$old_stty" 2>/dev/null || true
}

main "$@"