# Maintainer: Yahya Zekry <yahyazekry@gmail.com>

pkgname=internet-usage-monitor-git
_pkgname_src=internet-usage-monitor
pkgver=r54.b473243
pkgrel=5
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
  
  # Copy the original install script first
  cp install.sh "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  # Patch it to create symlinks for AUR installation instead of skipping file setup
  sed -i 's|if \[ "\$is_aur_install" = false \]; then|# Always set up files for both manual and AUR installations\n    if [ "$is_aur_install" = false ]; then|' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  sed -i 's|cp "\$source_dir"/src/\*.sh "\$bin_dir/"|cp "\$source_dir"/src/*.sh "\$bin_dir/"|' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  sed -i 's|cp "\$source_dir"/fix_conky_kde.sh "\$bin_dir/"|cp "\$source_dir"/fix_conky_kde.sh "\$bin_dir/"|' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  # Add AUR-specific symlink creation in the else clause
  sed -i '/chmod +x "\$bin_dir"\/\*.sh/a\    else\n        # AUR installation: create symlinks to system files\n        print_status "$BLUE" "$INFO" "Creating symlinks to system-installed files..."\n        ln -sf "/usr/share/internet-usage-monitor-git/src/internet_monitor.sh" "$bin_dir/internet_monitor.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/src/internet_monitor_daemon.sh" "$bin_dir/internet_monitor_daemon.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/src/conky_usage_helper.sh" "$bin_dir/conky_usage_helper.sh"\n        ln -sf "/usr/share/internet-usage-monitor-git/fix_conky_kde.sh" "$bin_dir/fix_conky_kde.sh"\n        # No need to chmod symlinks - they inherit permissions from target' "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  chmod +x "$pkgdir/usr/share/$pkgname/install_aur.sh"
  
  # Create a wrapper script that uses the patched version
  cat > "$pkgdir/usr/bin/internet-monitor-setup" << 'EOF'
#!/bin/bash
cd /usr/share/internet-usage-monitor-git
exec ./install_aur.sh --aur
EOF
  chmod +x "$pkgdir/usr/bin/internet-monitor-setup"
}
