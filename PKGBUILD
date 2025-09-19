# Maintainer: Yahya Zekry <yahyazekry@gmail.com>

pkgname=internet-usage-monitor-git
_pkgname_src=internet-usage-monitor
pkgver=r54.b473243
pkgrel=7
pkgdesc="Monitors internet usage in real-time via Conky with desktop notifications (git version)"
arch=('any')
provides=("internet-usage-monitor=1.0.0")
conflicts=('internet-usage-monitor')
url="https://github.com/YahyaZekry/internet-usage-monitor"
license=('MIT')
depends=('bash' 'conky' 'bc' 'procps-ng' 'libnotify' 'zenity')
makedepends=('git')
install=${pkgname}.install
source=("${_pkgname_src}::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname_src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname_src"

  install -Dm755 "uninstall.sh" "$pkgdir/usr/bin/internet-monitor-uninstall"
  
  # Install the install script to the share directory
  install -Dm755 "install.sh" "$pkgdir/usr/share/$pkgname/install.sh"
  
  # Install all the source files
  install -Dm755 "src/internet_monitor.sh" "$pkgdir/usr/share/$pkgname/src/internet_monitor.sh"
  install -Dm755 "src/internet_monitor_daemon.sh" "$pkgdir/usr/share/$pkgname/src/internet_monitor_daemon.sh"
  install -Dm755 "src/conky_usage_helper.sh" "$pkgdir/usr/share/$pkgname/src/conky_usage_helper.sh"
  install -Dm755 "fix_conky_kde.sh" "$pkgdir/usr/share/$pkgname/fix_conky_kde.sh"
  
  install -Dm644 "config/config.sh" "$pkgdir/usr/share/$pkgname/config/config.sh"
  install -Dm644 "config/conkyrc_internet" "$pkgdir/usr/share/$pkgname/config/conkyrc_internet"
  
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Create the common.sh file that the daemon scripts expect
  # Using the proper upstream version with XDG compliance and better functionality
  cat > "$pkgdir/usr/share/$pkgname/src/common.sh" << 'EOF'
#!/bin/bash

# Internet Usage Monitor - Common Functions and Configuration
# This script is sourced by other scripts to provide shared functionality.

# --- XDG and Application Path Configuration ---

# The application name, used for directory structures.
APP_NAME="internet-usage-monitor-git"

# Determine effective XDG directories with fallbacks for non-standard environments.
XDG_CONFIG_HOME_EFFECTIVE="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME_EFFECTIVE="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_RUNTIME_DIR_EFFECTIVE="${XDG_RUNTIME_DIR:-/run/user/$UID}"

# Define application-specific directories.
CONFIG_DIR="$XDG_CONFIG_HOME_EFFECTIVE/$APP_NAME"
DATA_DIR="$XDG_DATA_HOME_EFFECTIVE/$APP_NAME"
RUNTIME_DIR="$XDG_RUNTIME_DIR_EFFECTIVE/$APP_NAME"

# Define primary configuration file paths.
USER_CONFIG_FILE="$CONFIG_DIR/config.sh"
DEFAULT_CONFIG_FILE="/usr/share/$APP_NAME/config.sh"
PROJECT_CONFIG_FILE="$(dirname "${BASH_SOURCE[0]}")/../config/config.sh"

# --- Configuration Loading ---

# Load the configuration file, prioritizing user, then system, then project.
if [ -f "$USER_CONFIG_FILE" ]; then
    source "$USER_CONFIG_FILE"
elif [ -f "$DEFAULT_CONFIG_FILE" ]; then
    source "$DEFAULT_CONFIG_FILE"
elif [ -f "$PROJECT_CONFIG_FILE" ]; then
    source "$PROJECT_CONFIG_FILE"
else
    echo "Error: Configuration file could not be found." >&2
    exit 1
fi

# --- Directory Initialization ---

# Ensure all necessary application directories exist.
mkdir -p "$CONFIG_DIR" "$DATA_DIR" "$RUNTIME_DIR"

# --- Dependency Checks ---

# Function to check for required command-line tools.
check_dependencies() {
    local missing_deps=()
    for dep in "$@"; do
        if ! command -v "$dep" &> /dev/null; then
            missing_deps+=("$dep")
        fi
    done

    if [ ${#missing_deps[@]} -gt 0 ]; then
        echo "Error: Missing required dependencies: ${missing_deps[*]}" >&2
        echo "Please install them using your system's package manager." >&2
        exit 1
    fi
}

# --- Common Utility Functions ---

# Function to log messages to the application's log file.
log_message() {
    # LOG_FILE is defined in config.sh
    echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >> "$LOG_FILE"
}

# Function to convert bytes to a human-readable format.
bytes_to_human() {
    local bytes=${1:-0}
    if ! [[ "$bytes" =~ ^[0-9]+$ ]]; then
        bytes=0
    fi

    if [ "$bytes" -ge 1073741824 ]; then
        awk -v b="$bytes" 'BEGIN {printf "%.2f GB", b/1073741824}'
    elif [ "$bytes" -ge 1048576 ]; then
        awk -v b="$bytes" 'BEGIN {printf "%.2f MB", b/1048576}'
    elif [ "$bytes" -ge 1024 ]; then
        awk -v b="$bytes" 'BEGIN {printf "%.2f KB", b/1024}'
    else
        echo "$bytes B"
    fi
}
EOF
  chmod +x "$pkgdir/usr/share/$pkgname/src/common.sh"
  
  # Copy the original install script first
  cp install.sh "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  # Patch it to create symlinks for AUR installation instead of skipping file setup
  sed -i 's|if \[ "\$is_aur_install" = false \]; then|# Always set up files for both manual and AUR installations\n    if [ "$is_aur_install" = false ]; then|' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  sed -i 's|cp "\$source_dir"/src/\*.sh "\$bin_dir/"|cp "\$source_dir"/src/*.sh "\$bin_dir/"|' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  sed -i 's|cp "\$source_dir"/fix_conky_kde.sh "\$bin_dir/"|cp "\$source_dir"/fix_conky_kde.sh "\$bin_dir/"|' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  # Note: common.sh is already included in src/*.sh wildcard above
  
  # Add AUR-specific symlink creation in the else clause
  sed -i '/chmod +x "\$bin_dir"\/\*.sh/a\    else\n        # AUR installation: create symlinks to system files\n        print_status "$BLUE" "$INFO" "Creating symlinks to system-installed files..."\n        ln -sf "/usr/share/internet-usage-monitor-git/src/internet_monitor.sh" "$bin_dir/internet_monitor.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/src/internet_monitor_daemon.sh" "$bin_dir/internet_monitor_daemon.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/src/conky_usage_helper.sh" "$bin_dir/conky_usage_helper.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/src/common.sh" "$bin_dir/common.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/fix_conky_kde.sh" "$bin_dir/fix_conky_kde.sh"\n        # No need to chmod symlinks - they inherit permissions from target' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  chmod +x "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  # Create a wrapper script that uses the patched version
  cat > "$pkgdir/usr/bin/internet-monitor-setup" << 'EOF'
#!/bin/bash
cd /usr/share/internet-usage-monitor-git
exec ./install_aur.sh --aur
EOF
  chmod +x "$pkgdir/usr/bin/internet-monitor-setup"
}
