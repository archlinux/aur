# Maintainer: Yahya Zekry <yahyazekry@gmail.com>

pkgname=internet-usage-monitor-git
_pkgname_src=internet-usage-monitor
pkgver=r49.17451d8
pkgrel=1
pkgdesc="Monitors internet usage in real-time via Conky with desktop notifications (git version)"
arch=('any')
provides=("internet-usage-monitor=${pkgver}")
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

prepare() {
  cd "$_pkgname_src"
  
  # Patch scripts to use XDG directories and system paths
  # This ensures scripts work directly from system locations
  
  # Create modified versions of scripts that work from system locations
  mkdir -p "${srcdir}/patched"
  
  # Patch internet_monitor.sh to use XDG paths
  sed -e 's|$HOME/config.sh|${XDG_CONFIG_HOME:-$HOME/.config}/internet-usage-monitor/config.sh|g' \
      -e 's|$HOME/.internet_usage_data|${XDG_DATA_HOME:-$HOME/.local/share}/internet-usage-monitor/usage_data|g' \
      -e 's|$HOME/.internet_usage.log|${XDG_DATA_HOME:-$HOME/.local/share}/internet-usage-monitor/usage.log|g' \
      "src/internet_monitor.sh" > "${srcdir}/patched/internet_monitor.sh"
  
  # Patch conky_usage_helper.sh
  sed -e 's|$HOME/.internet_usage_data|${XDG_DATA_HOME:-$HOME/.local/share}/internet-usage-monitor/usage_data|g' \
      "src/conky_usage_helper.sh" > "${srcdir}/patched/conky_usage_helper.sh"
  
  # Patch internet_monitor_daemon.sh
  sed -e 's|$HOME/internet_monitor.sh|/usr/bin/internet-monitor|g' \
      "src/internet_monitor_daemon.sh" > "${srcdir}/patched/internet_monitor_daemon.sh"
}

package() {
  cd "$_pkgname_src"

  # Install patched scripts to /usr/bin
  install -Dm755 "${srcdir}/patched/internet_monitor.sh" "$pkgdir/usr/bin/internet-monitor"
  install -Dm755 "${srcdir}/patched/conky_usage_helper.sh" "$pkgdir/usr/bin/internet-monitor-conky-helper"
  install -Dm755 "${srcdir}/patched/internet_monitor_daemon.sh" "$pkgdir/usr/bin/internet-monitor-daemon"
  
  # Create wrapper script for setup
  cat > "${srcdir}/internet-monitor-setup" << 'EOF'
#!/bin/bash
# Internet Usage Monitor Setup Script

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
CONFIG_DIR="$XDG_CONFIG_HOME/internet-usage-monitor"
DATA_DIR="$XDG_DATA_HOME/internet-usage-monitor"

echo "Setting up Internet Usage Monitor..."

# Create directories
mkdir -p "$CONFIG_DIR" "$DATA_DIR"

# Copy default configs if they don't exist
if [ ! -f "$CONFIG_DIR/config.sh" ]; then
    cp /usr/share/internet-usage-monitor-git/config.sh "$CONFIG_DIR/"
    echo "Created config file: $CONFIG_DIR/config.sh"
fi

if [ ! -f "$CONFIG_DIR/conkyrc_internet" ]; then
    cp /usr/share/internet-usage-monitor-git/conkyrc_internet "$CONFIG_DIR/"
    # Update conkyrc to use correct helper path
    sed -i 's|conky_usage_helper.sh|internet-monitor-conky-helper|g' "$CONFIG_DIR/conkyrc_internet"
    echo "Created Conky config: $CONFIG_DIR/conkyrc_internet"
fi

# Create systemd user service
mkdir -p "$HOME/.config/systemd/user"
cat > "$HOME/.config/systemd/user/internet-monitor.service" << 'SERVICEEOF'
[Unit]
Description=Internet Usage Monitor Daemon
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/internet-monitor-daemon start
Restart=always
RestartSec=30

[Install]
WantedBy=default.target
SERVICEEOF

echo "Created systemd service: $HOME/.config/systemd/user/internet-monitor.service"

# Create desktop autostart for Conky
mkdir -p "$XDG_CONFIG_HOME/autostart"
cat > "$XDG_CONFIG_HOME/autostart/internet-monitor-conky.desktop" << DESKTOPEOF
[Desktop Entry]
Type=Application
Name=Internet Usage Monitor Conky
Exec=conky -c $CONFIG_DIR/conkyrc_internet
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Comment=Display internet usage on desktop
DESKTOPEOF

echo "Created autostart entry: $XDG_CONFIG_HOME/autostart/internet-monitor-conky.desktop"

# Enable and start the service
systemctl --user daemon-reload
systemctl --user enable internet-monitor.service
systemctl --user start internet-monitor.service

echo ""
echo "Setup complete! Internet Usage Monitor is now running."
echo "The daemon has been started and will monitor your usage."
echo "The Conky widget will start on your next login."
echo ""
echo "To start Conky now: conky -c $CONFIG_DIR/conkyrc_internet &"
echo "To check status: systemctl --user status internet-monitor.service"
EOF
  
  install -Dm755 "${srcdir}/internet-monitor-setup" "$pkgdir/usr/bin/internet-monitor-setup"

  # Install default configs to /usr/share
  install -Dm644 "config/config.sh" "$pkgdir/usr/share/$pkgname/config.sh"
  install -Dm644 "config/conkyrc_internet" "$pkgdir/usr/share/$pkgname/conkyrc_internet"
  
  # Install license and documentation
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
