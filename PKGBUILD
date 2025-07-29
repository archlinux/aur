# Maintainer: DonutsDelivery <megusta52@proton.me>
pkgname=monitor-remote-control
pkgver=2.0.1
pkgrel=1
pkgdesc="Remote monitor control via DDC/CI with GUI interface for brightness, color, input switching and auto-brightness"
arch=('any')
url="https://github.com/DonutsDelivery/Auto-Brightness"
license=('MIT')
depends=('python' 'python-requests' 'ddcutil' 'python-pyqt6' 'kirigami' 'python-monitor-control')
makedepends=('git')
source=("git+https://github.com/DonutsDelivery/Auto-Brightness.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/Auto-Brightness"
    
    # Install main applications as executables
    install -Dm755 auto_brightness.py "$pkgdir/usr/bin/auto-brightness"
    install -Dm755 brightness_kirigami_qt6.py "$pkgdir/usr/bin/monitor-remote-control"
    
    # Install additional Python modules
    install -Dm755 brightness_control.py "$pkgdir/usr/share/monitor-remote-control/brightness_control.py"
    install -Dm755 monitor_control.py "$pkgdir/usr/share/monitor-remote-control/monitor_control.py"
    install -Dm755 update_config.py "$pkgdir/usr/share/monitor-remote-control/update_config.py"
    
    # Install QML UI files
    install -Dm644 brightness_kirigami_qt6.qml "$pkgdir/usr/share/monitor-remote-control/brightness_kirigami_qt6.qml"
    
    # Install default config file
    install -Dm644 config.json "$pkgdir/etc/monitor-remote-control/config.json"
    
    # Install systemd user service
    sed 's/auto-brightness/monitor-remote-control/g' auto-brightness.service > monitor-remote-control.service
    install -Dm644 monitor-remote-control.service "$pkgdir/usr/lib/systemd/user/monitor-remote-control.service"
    
    # Create desktop entry
    cat > monitor-remote-control.desktop << EOF
[Desktop Entry]
Type=Application
Name=Monitor Remote Control
Comment=Remote monitor control via DDC/CI with auto-brightness
Exec=monitor-remote-control
Icon=preferences-desktop-display
Categories=Settings;HardwareSettings;
Keywords=monitor;brightness;ddc;display;control;
EOF
    
    install -Dm644 monitor-remote-control.desktop "$pkgdir/usr/share/applications/monitor-remote-control.desktop"
}