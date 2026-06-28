#!/usr/bin/env bash
# ==============================================================================
# ArchPerf Pro - Premium Installer & System Setup Utility
# ==============================================================================

set -uo pipefail

# --- Configuration & Paths ---
readonly APP_NAME="ArchPerf Pro"
readonly VERSION="7.1.0"
readonly APPIMAGE_NAME="ArchPerf Pro-${VERSION}.AppImage"
readonly INSTALL_DIR="${HOME}/.local/share/archperf-pro"
readonly BIN_DIR="${HOME}/.local/bin"
readonly MAIN_BINARY="ArchPerf Pro-${VERSION}"
readonly BIN="${BIN_DIR}/${MAIN_BINARY}"
readonly DESKTOP_FILE="${HOME}/.local/share/applications/${APP_NAME}.desktop"
readonly DESKTOP_FILE_ALT="${HOME}/.local/share/applications/pkgdrop-${APP_NAME}-${VERSION}.desktop"
readonly ICON_SOURCE="${HOME}/.local/share/icons/hicolor/scalable/apps/archperf.png"

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
  readonly C_CYAN=''
  readonly C_MAGENTA=''
  readonly C_GREEN=''
  readonly C_YELLOW=''
  readonly C_RED=''
  readonly C_BLUE=''
  readonly C_BOLD=''
  readonly C_DIM=''
  readonly C_RESET=''
fi

# --- Helper Functions ---
log_info()    { echo -e "${C_BLUE}[i]${C_RESET} $*"; }
log_success() { echo -e "${C_GREEN}[✓]${C_RESET} $*"; }
log_warn()    { echo -e "${C_YELLOW}[!]${C_RESET} $*"; }
log_error()   { echo -e "${C_RED}[✗]${C_RESET} $*" >&2; }

# --- Cleanup handlers ---
cleanup() {
  if [[ -t 0 && -n "${old_stty:-}" ]]; then
    stty "$old_stty" 2>/dev/null || true
  fi
  echo -e "\n${C_DIM}Setup session terminated.${C_RESET}"
  exit 0
}
trap cleanup INT TERM

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

wait_for_keypress() {
  if [[ -t 0 ]]; then
    echo -e "\n${C_DIM}Press Enter to return to menu...${C_RESET}"
    read -r _ || true
  fi
}

# --- Find actual ArchPerf processes (be specific to avoid killing unrelated apps) ---
find_archperf_pids() {
  local pids=()
  
  # Get processes containing "ArchPerf Pro" or the actual AppImage
  for pid in $(pgrep -f "ArchPerf Pro" 2>/dev/null || true); do
    # Skip if pid is ourself or parent shell
    [[ "$pid" == "$$" || "$pid" == "$PPID" ]] && continue
    
    # Get the actual command
    local cmd
    cmd=$(ps -p "$pid" -o comm= 2>/dev/null || true)
    local cmdline
    cmdline=$(ps -p "$pid" -o args= 2>/dev/null || true)
    
    # Only target actual ArchPerf binaries/AppImages
    # Match "ArchPerf Pro" binary or .AppImage containing ArchPerf
    if [[ "$cmd" == *"ArchPerf Pro"* ]] || [[ "$cmd" == *"archperf"* && "$cmdline" == *".AppImage"* ]]; then
      # Double check it's not a terminal or chat app
      if [[ ! "$cmd" =~ ^(konsole|gnome-terminal|xterm|tilix|kitty|alacritty|terminology|opencode)$ ]]; then
        pids+=("$pid")
      fi
    fi
  done
  
  printf '%s\n' "${pids[@]}" 2>/dev/null || true
}

# --- Detect all installations ---
detect_installations() {
  local installations=()
  
  # Check pkgdrop installation
  if [[ -f "${BIN_DIR}/${MAIN_BINARY}" ]]; then
    installations+=("pkgdrop:${BIN_DIR}/${MAIN_BINARY}")
  fi
  
  # Check old manual installation
  if [[ -f "${BIN_DIR}/archperf" ]]; then
    installations+=("old-manual:${BIN_DIR}/archperf")
  fi
  
  # Check old installation directory
  if [[ -d "${INSTALL_DIR}" ]]; then
    installations+=("old-dir:${INSTALL_DIR}")
  fi
  
  # Check desktop files
  if [[ -f "${DESKTOP_FILE}" ]]; then
    installations+=("desktop-main:${DESKTOP_FILE}")
  fi
  if [[ -f "${DESKTOP_FILE_ALT}" ]]; then
    installations+=("desktop-pkgdrop:${DESKTOP_FILE_ALT}")
  fi
  
  # Only output if we have actual installations (no empty lines)
  if [[ ${#installations[@]} -gt 0 ]]; then
    printf '%s\n' "${installations[@]}"
  fi
  # Don't output anything if empty - this prevents mapfile from getting an empty element
}

show_status() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}📁 Installation Status:${C_RESET}"
  echo -e "  • Version:      ${C_CYAN}${VERSION}${C_RESET}"
  echo ""
  
  local installations
  mapfile -t installations < <(detect_installations)
  
  if [[ ${#installations[@]} -eq 0 ]]; then
    echo -e "  • Status:       ${C_RED}Not Installed${C_RESET}"
    echo -e "  • Binary:       ${C_RED}Not Found${C_RESET}"
    echo -e "  • Desktop:      ${C_RED}Not Found${C_RESET}"
  else
    echo -e "  • Status:       ${C_YELLOW}Found ${#installations[@]} installation(s)${C_RESET}"
    echo ""
    echo "  Installed components:"
    for inst in "${installations[@]}"; do
      # Skip empty entries
      [[ -z "$inst" ]] && continue
      local type="${inst%%:*}"
      local path="${inst##*:}"
      case "$type" in
        pkgdrop)   echo -e "    ${C_GREEN}✓${C_RESET} pkgdrop binary:   ${path}" ;;
        old-manual) echo -e "    ${C_YELLOW}⚠${C_RESET} old symlink:      ${path}" ;;
        old-dir)    echo -e "    ${C_YELLOW}⚠${C_RESET} old install dir:  ${path}" ;;
        desktop-*)  echo -e "    ${C_CYAN}✓${C_RESET} desktop file:    ${path}" ;;
      esac
    done
  fi
  
  wait_for_keypress
}

do_install() {
  clear_screen
  print_banner
  log_info "Installing ${APP_NAME} v${VERSION}..."
  
  # Find AppImage
  local img=""
  for candidate in \
    "${PWD}/release/${APPIMAGE_NAME}" \
    "${PWD}/dist/linux-unpacked/${APPIMAGE_NAME}" \
    "$(find "${PWD}" -maxdepth 2 -name "*.AppImage" -type f 2>/dev/null | head -1)"; do
    if [[ -n "$candidate" && -f "$candidate" ]]; then
      img="$candidate"
      break
    fi
  done
  
  if [[ -z "$img" ]]; then
    log_error "AppImage not found. Run './setup build' first or build with 'npm run electron:build'"
    wait_for_keypress
    return 1
  fi
  
  log_info "Using AppImage: ${img}"
  
  # Stop any running instances
  log_info "Stopping running instances..."
  for pid in $(find_archperf_pids); do
    log_info "  Stopping PID $pid"
    kill -9 "$pid" 2>/dev/null || true
  done
  sleep 0.5
  
  # Clean up ALL old installations first
  do_uninstall silent
  
  # Create directories
  log_info "Creating directories..."
  mkdir -p "${BIN_DIR}" "$(dirname "${DESKTOP_FILE}")" "${HOME}/.local/share/archperf-pro"
  
  # Copy AppImage
  log_info "Installing AppImage..."
  cp "$img" "${INSTALL_DIR}/${APPIMAGE_NAME}"
  chmod +x "${INSTALL_DIR}/${APPIMAGE_NAME}"
  
  # Create launcher wrapper
  log_info "Creating launcher..."
  cat > "${INSTALL_DIR}/launcher.sh" << LAUNCHER
#!/bin/bash
export ELECTRON_DISABLE_GPU=1
export ARCHPERF_DIR="\$(dirname "\$(readlink -f "\${BASH_SOURCE[0]}")")"
exec "\${ARCHPERF_DIR}/ArchPerf Pro-${VERSION}.AppImage" --disable-gpu --no-sandbox "\$@"
LAUNCHER
  chmod +x "${INSTALL_DIR}/launcher.sh"
  
  # Create symlink
  log_info "Creating symlink..."
  ln -sf "${INSTALL_DIR}/launcher.sh" "${BIN}"
  
  # Create convenience symlink "ArchPerf" for easy CLI access
  local CONVENIENCE_BIN="${BIN_DIR}/ArchPerf"
  if [[ ! -f "${CONVENIENCE_BIN}" ]]; then
    ln -sf "${BIN}" "${CONVENIENCE_BIN}"
    log_info "  Created convenience symlink: ${CONVENIENCE_BIN}"
  fi
  
  # Install icons for both app and tray (multiple sizes for compatibility)
  log_info "Installing icons..."
  
  # Install scalable app icon
  local icon_scalable="${HOME}/.local/share/icons/hicolor/scalable/apps/archperf.png"
  mkdir -p "$(dirname "${icon_scalable}")"
  # Copy if source exists (always update to get new version)
  if [[ -f "${PWD}/icon.png" ]]; then
    cp "${PWD}/icon.png" "${icon_scalable}"
    log_info "  Installed scalable icon"
  fi
  
  # Install tray icons (small PNGs for KDE tray compatibility)
  for size in 16 22 32; do
    local tray_icon_src="${PWD}/public/icon-${size}.png"
    local tray_icon_dest="${HOME}/.local/share/icons/hicolor/${size}x${size}/apps/archperf.png"
    if [[ -f "${tray_icon_src}" ]]; then
      mkdir -p "$(dirname "${tray_icon_dest}")"
      cp "${tray_icon_src}" "${tray_icon_dest}"
      log_info "  Installed ${size}x${size} tray icon"
    fi
  done
  
  # Also install to archperf-pro directory for tray access
  if [[ -f "${PWD}/public/icon-22.png" ]]; then
    cp "${PWD}/public/icon-22.png" "${INSTALL_DIR}/icon-22.png"
  fi
  
  # Set icon path for desktop file (use scalable icon if available)
  local icon_dest="${HOME}/.local/share/icons/hicolor/scalable/apps/archperf.png"
  
# Create desktop file
  log_info "Creating desktop entry..."
  cat > "${DESKTOP_FILE}" << DESKTOP
[Desktop Entry]
Name=${APP_NAME}
Comment=Pro-Grade Arch Linux System Optimization Suite
Exec="${BIN}"
Icon=${icon_dest}
Type=Application
Categories=Settings;System;
Terminal=false
StartupNotify=true
DESKTOP
  chmod +x "${DESKTOP_FILE}"
  
  # Update desktop database
  if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$(dirname "${DESKTOP_FILE}")" 2>/dev/null || true
  fi
  
  # Rebuild icon cache if available
  if command -v gtk-update-icon-cache >/dev/null 2>&1; then
    gtk-update-icon-cache -f -t "${HOME}/.local/share/icons/hicolor" 2>/dev/null || true
  fi
  
  # Rebuild KDE menu cache if available (helps app appear in launcher)
  if command -v kbuildsycoca6 >/dev/null 2>&1; then
    kbuildsycoca6 2>/dev/null || true
  fi
  
  echo ""
  log_success "${APP_NAME} v${VERSION} installed successfully!"
  echo ""
  echo -e "  ${C_BOLD}Executable:${C_RESET} ${C_CYAN}${BIN}${C_RESET}"
  echo -e "  ${C_BOLD}Desktop Entry:${C_RESET} ${C_CYAN}${DESKTOP_FILE}${C_RESET}"
  echo ""
  
  wait_for_keypress
}

do_uninstall() {
  local silent="${1:-interactive}"
  
  if [[ "$silent" != "silent" ]]; then
    clear_screen
    print_banner
    log_info "Uninstalling ${APP_NAME}..."
  fi
  
  # Stop any running instances
  if [[ "$silent" != "silent" ]]; then
    log_info "Stopping running instances..."
  fi
  for pid in $(find_archperf_pids); do
    kill -9 "$pid" 2>/dev/null || true
  done
  sleep 0.5
  
  # Remove all installation artifacts
  if [[ "$silent" != "silent" ]]; then
    log_info "Removing installation files..."
  fi
  
  # Main binary
  rm -f "${BIN}"
  
  # Convenience symlink
  rm -f "${BIN_DIR}/ArchPerf"
  
  # Old symlink
  rm -f "${BIN_DIR}/archperf"
  
  # Installation directory
  rm -rf "${INSTALL_DIR}"
  
  # Desktop files
  rm -f "${DESKTOP_FILE}"
  rm -f "${DESKTOP_FILE_ALT}"
  
  # Legacy desktop files
  rm -f "${HOME}/.local/share/applications/ArchPerf.desktop"
  rm -f "${HOME}/.local/share/applications/archperf.desktop"
  
  # Update desktop database
  if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$(dirname "${DESKTOP_FILE}")" 2>/dev/null || true
  fi
  
  if [[ "$silent" != "silent" ]]; then
    log_success "${APP_NAME} has been completely uninstalled."
    wait_for_keypress
  fi
}

do_build() {
  clear_screen
  print_banner
  log_info "Building ${APP_NAME}..."
  
  if [[ ! -d "node_modules" ]]; then
    log_info "Installing dependencies..."
    npm install --no-audit --no-fund || npm ci --no-audit --no-fund
  fi
  
  log_info "Building Electron application..."
  npm run build || {
    log_error "Build failed"
    wait_for_keypress
    return 1
  }
  
  log_info "Packaging as AppImage..."
  npm run electron:build || {
    log_error "Packaging failed"
    wait_for_keypress
    return 1
  }
  
  log_success "Build complete!"
  ls -lh release/*.AppImage 2>/dev/null || ls -lh *.AppImage 2>/dev/null || true
  wait_for_keypress
}

do_update() {
  clear_screen
  print_banner
  log_info "Updating ${APP_NAME}..."
  
  # Stop running instances
  log_info "Stopping running instances..."
  for pid in $(find_archperf_pids); do
    log_info "  Stopping PID $pid"
    kill -9 "$pid" 2>/dev/null || true
  done
  sleep 0.5
  
  # Find and run new AppImage
  local img=""
  for candidate in \
    "${PWD}/release/${APPIMAGE_NAME}" \
    "$(find "${PWD}" -maxdepth 2 -name "*.AppImage" -type f 2>/dev/null | head -1)"; do
    if [[ -n "$candidate" && -f "$candidate" ]]; then
      img="$candidate"
      break
    fi
  done
  
  if [[ -z "$img" ]]; then
    log_error "AppImage not found. Run './setup build' first."
    wait_for_keypress
    return 1
  fi
  
  log_info "Updating AppImage..."
  cp "$img" "${INSTALL_DIR}/${APPIMAGE_NAME}"
  chmod +x "${INSTALL_DIR}/${APPIMAGE_NAME}"
  
  log_success "Update complete!"
  wait_for_keypress
}

do_kill() {
  clear_screen
  print_banner
  log_info "Scanning for active processes..."
  
  local count=0
  for pid in $(find_archperf_pids); do
    local comm
    comm=$(ps -p "$pid" -o comm= 2>/dev/null || echo "")
    log_warn "Terminating PID $pid ($comm)"
    kill -9 "$pid" 2>/dev/null || true
    ((count++))
  done
  
  if [[ $count -gt 0 ]]; then
    log_success "$count process(es) terminated."
  else
    log_info "No active processes found."
  fi
  wait_for_keypress
}

do_clean() {
  clear_screen
  print_banner
  log_warn "Purging build artifacts..."
  rm -rf dist/ release/ node_modules/.vite/ coverage/ 2>/dev/null || true
  log_success "Clean complete."
  wait_for_keypress
}

show_help() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}📖 Usage Instructions:${C_RESET}"
  echo ""
  echo -e "  ${C_CYAN}./setup install${C_RESET}   - Build (if needed) and install ${APP_NAME}"
  echo -e "  ${C_CYAN}./setup build${C_RESET}     - Build and package the AppImage only"
  echo -e "  ${C_CYAN}./setup update${C_RESET}    - Update existing installation"
  echo -e "  ${C_CYAN}./setup uninstall${C_RESET} - Remove all installation files"
  echo -e "  ${C_CYAN}./setup kill${C_RESET}      - Terminate running instances"
  echo -e "  ${C_CYAN}./setup clean${C_RESET}     - Remove build artifacts"
  echo -e "  ${C_CYAN}./setup status${C_RESET}    - Show installation status"
  echo ""
  wait_for_keypress
}

# --- Main Entry Point ---

if [[ "${EUID:-$(id -u)}" -eq 0 ]]; then
  echo -e "${C_RED}[✗]${C_RESET} Please run as regular user, not root." >&2
  exit 1
fi

if [[ $# -gt 0 ]]; then
  case "$1" in
    status)     show_status; exit 0 ;;
    install)    do_install; exit 0 ;;
    build)      do_build; exit 0 ;;
    update)     do_update; exit 0 ;;
    uninstall)  do_uninstall; exit 0 ;;
    kill)       do_kill; exit 0 ;;
    clean)      do_clean; exit 0 ;;
    help|--help|-h) show_help; exit 0 ;;
    *)          log_error "Unknown argument '$1'"; exit 1 ;;
  esac
fi

# Interactive menu
SELECTED=0
readonly OPTIONS=(
  "1. Install ${APP_NAME}"
  "2. Build AppImage"
  "3. Update Installation"
  "4. Installation Status"
  "5. Kill Running Processes"
  "6. Clean Build Cache"
  "7. Uninstall"
  "8. Help & Usage"
  "9. Quit"
)

print_menu() {
  clear_screen
  print_banner
  echo -e "${C_BOLD}Select an action:${C_RESET}\n"
  for i in "${!OPTIONS[@]}"; do
    if [[ $i -eq $SELECTED ]]; then
      echo -e "  ${C_CYAN}▶  ${C_BOLD}${OPTIONS[$i]}${C_RESET}"
    else
      echo -e "     ${C_DIM}${OPTIONS[$i]}${C_RESET}"
    fi
  done
  echo -e "\n${C_DIM}──────────────────────────────────────────────────────────"
  echo -e "Use [↑/↓] or [j/k] or numbers to navigate, [Enter] to run${C_RESET}"
}

readonly old_stty=$(stty -g 2>/dev/null || true)
if [[ -n "$old_stty" ]]; then
  stty -echo -icanon 2>/dev/null || true
fi

while true; do
  print_menu
  if ! read -rsn1 key 2>/dev/null; then
    break
  fi
  
  case "$key" in
    $'\e')
      if read -rsn2 -t 0.05 rest 2>/dev/null; then
        case "$rest" in
          "[A") [[ $SELECTED -gt 0 ]] && ((SELECTED--)) ;;
          "[B") [[ $SELECTED -lt 8 ]] && ((SELECTED++)) ;;
        esac
      fi
      ;;
    k|K) [[ $SELECTED -gt 0 ]] && ((SELECTED--)) ;;
    j|J) [[ $SELECTED -lt 8 ]] && ((SELECTED++)) ;;
    1) SELECTED=0 ;;
    2) SELECTED=1 ;;
    3) SELECTED=2 ;;
    4) SELECTED=3 ;;
    5) SELECTED=4 ;;
    6) SELECTED=5 ;;
    7) SELECTED=6 ;;
    8) SELECTED=7 ;;
    9) SELECTED=8 ;;
    ""|$'\n'|$'\r')
      if [[ -n "$old_stty" ]]; then stty "$old_stty" 2>/dev/null || true; fi
      case $SELECTED in
        0) do_install ;;
        1) do_build ;;
        2) do_update ;;
        3) do_uninstall ;;
        4) do_kill ;;
        5) do_clean ;;
        6) show_status ;;
        7) show_help ;;
        8) echo ""; echo -e "${C_BOLD}Goodbye!${C_RESET}"; exit 0 ;;
      esac
      if [[ -n "$old_stty" ]]; then stty -echo -icanon 2>/dev/null || true; fi
      ;;
  esac
done