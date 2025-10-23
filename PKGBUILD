# Maintainer: Augustas Vaivada <https://github.com/aujezus>
pkgname=hypr-mon-switch-git
pkgver=r31.51b8af3
pkgrel=1
pkgdesc="Configuration-based monitor switching system for Hyprland with YAML configuration support"
arch=('any')
url="https://github.com/aujezus/hypr-mon-switch"
license=('MIT')
depends=('hyprland' 'yq' 'bash' 'systemd' 'procps-ng' 'util-linux')
optdepends=('libnotify: for desktop notifications' 'sudo: for user switching')
makedepends=('git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    
    # Create system directories
    install -d "$pkgdir/etc/hypr-mon-switch"
    install -d "$pkgdir/usr/share/hypr-mon-switch/scripts"
    install -d "$pkgdir/usr/share/hypr-mon-switch/udev"
    install -d "$pkgdir/usr/share/doc/hypr-mon-switch"
    install -d "$pkgdir/usr/share/licenses/hypr-mon-switch-git"
    
    # Install ACPI scripts to system location
    install -Dm755 acpi/hypr-utils.sh "$pkgdir/etc/acpi/hypr-utils.sh"
    install -Dm755 acpi/monitor-hotplug.sh "$pkgdir/etc/acpi/monitor-hotplug.sh"
    install -Dm755 acpi/lid-open.sh "$pkgdir/etc/acpi/lid-open.sh"
    install -Dm755 acpi/lid-close.sh "$pkgdir/etc/acpi/lid-close.sh"
    install -Dm755 acpi/check-lid-on-startup.sh "$pkgdir/etc/acpi/check-lid-on-startup.sh"
    
    # Install config parser to both locations for compatibility
    install -Dm755 scripts/config-parser.sh "$pkgdir/etc/acpi/config-parser.sh"
    install -Dm755 scripts/config-parser.sh "$pkgdir/etc/hypr-mon-switch/config-parser.sh"
    
    # Install utility scripts to /usr/share for user access
    install -Dm755 scripts/install.sh "$pkgdir/usr/share/hypr-mon-switch/scripts/install.sh"
    install -Dm755 scripts/uninstall.sh "$pkgdir/usr/share/hypr-mon-switch/scripts/uninstall.sh"
    install -Dm755 scripts/generate-config.sh "$pkgdir/usr/share/hypr-mon-switch/scripts/generate-config.sh"
    install -Dm755 scripts/test-config.sh "$pkgdir/usr/share/hypr-mon-switch/scripts/test-config.sh"
    
    # Install configuration files to system location
    install -Dm644 configs/example-config.yaml "$pkgdir/etc/hypr-mon-switch/config.yaml"
    install -Dm644 configs/example-config.yaml "$pkgdir/etc/hypr-mon-switch/example-config.yaml"
    install -Dm644 configs/default-config.yaml "$pkgdir/etc/hypr-mon-switch/default-config.yaml"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/hypr-mon-switch/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hypr-mon-switch-git/LICENSE"
    
    # Install udev rules template
    install -Dm644 udev/99-monitor-hotplug.rules "$pkgdir/usr/share/hypr-mon-switch/udev/99-monitor-hotplug.rules"
}

post_install() {
    echo ""
    echo "hypr-mon-switch-git has been installed!"
    echo ""
    echo "Configuration: /etc/hypr-mon-switch/config.yaml"
    echo "Example config: /etc/hypr-mon-switch/example-config.yaml"
    echo "Documentation: /usr/share/doc/hypr-mon-switch/INSTALLATION.md"
    echo ""
    echo "To complete setup, run:"
    echo "  sudo /usr/share/hypr-mon-switch/scripts/install.sh"
    echo ""
    echo "To uninstall completely:"
    echo "  sudo /usr/share/hypr-mon-switch/scripts/uninstall.sh"
    echo ""
    echo "The system will automatically detect monitor changes and apply the best matching configuration."
}

post_remove() {
    echo ""
    echo "Removing hypr-mon-switch-git system integration..."
    
    # Remove files that were created by the install script (not package files)
    rm -f /etc/udev/rules.d/99-monitor-hotplug.rules
    rm -f /etc/acpi/events/lid-open
    rm -f /etc/acpi/events/lid-close
    rm -f /var/log/hypr-mon-switch.log
    
    # Remove symlinks that were created by the install script
    rm -f /etc/acpi/monitor-hotplug-config.sh
    
    # Reload udev rules
    if command -v udevadm >/dev/null 2>&1; then
        udevadm control --reload-rules 2>/dev/null || true
    fi
    
    echo "System integration removed."
    echo ""
    echo "Note: Package files will be removed by pacman."
    echo "Note: Hyprland hooks in user config files were not automatically removed."
    echo "You may need to manually remove these lines from your Hyprland config:"
    echo "  exec-once = /etc/acpi/check-lid-on-startup.sh"
    echo "  exec = /etc/acpi/check-lid-on-startup.sh"
}
