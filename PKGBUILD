# Maintainer: Markus Maiwald <markus@maiwald.work>

pkgname=minimax-bin-hardened
_name="minimax"
pkgver=1.0.1
pkgrel=1
pkgdesc='MiniMax AI Agent - Desktop wrapper for Linux (Hardened for High-Security Environments)'
arch=('x86_64')
url='https://agent.minimax.io/'
license=('MIT')
install=$pkgname.install
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
provides=("$_name")
# Conflicts with bare name (prevents other providers) and unhardened variant
conflicts=("$_name" "${_name}-bin")
optdepends=(
    'apparmor: Mandatory Access Control (MAC) security framework'
    'appmenu-gtk-module: Global menu support for KDE/GNOME'
)
options=('!debug' '!strip')
_baseurl=https://git.maiwald.work/markus/AUR/releases/download/${_name}-v${pkgver}
source=(
    "$_name-$pkgver.tar.gz::$_baseurl/${_name}-${pkgver}-linux-x64.tar.gz"
    "$_name.desktop"
    "$_name.apparmor"
    "$_name-launcher.sh"
    "$_name.png::$_baseurl/${_name}.png"
    "SECURITY.md"
)
b2sums=('1e0cb4c3f7ff1d43c152016205c62d44f3ddc3a0f598bb7a818f91ad4c7de768377f90449cfe1ff163979bcec82fe4d1516bfb6c3e97de846319440c2b00109a'
        '876ce74a3f11d6d830d70d42a0a71c54e1493c61f1477ccd4d65c7f91965ba8863ad660f0724c574c60c02b99ba186236e5916e0c644a6e662f9a655d8fa92e0'
        'c69beb235d71f4e6b8282b8e76756808d8226c2f03e43fcf9f35d9eb6f1ce83d7b2eb6611fad430b51186075ddd5faccb48f76d7a1ed73e67a58cf61a3f17e6f'
        '025d3b51f45158c17ab0586f1e2a8379b194903f488b8b035943685079121b793eadbf47bd9ed08209b9e83887278cb24a56c2a1166f0c2a7c041a6c1af25c98'
        'e7fbbd8b4693158c35591e1c35a95253833883ccf62e17aeb313c74b82188602828260520c01d9c58c12e1bef65fe55baded848c3f9ba0cd37b96b1cdb6e494b'
        '14554b48f90f5de775d2ee8a8c28c9e405066274233af859abdaa1a0c9008c021796ec72c7f0a78a672c4870422fae948a85cbb389467c15db5efde7aea6181c')

package() {
    # Extract electron app to /opt/minimax
    # electron-builder produces "${_name}-${pkgver}-linux-x64/" as top-level dir
    mkdir -p "$pkgdir/opt/$_name"
    cp -r ${_name}-${pkgver}-linux-x64/* "$pkgdir/opt/$_name/"

    # CRITICAL: chrome-sandbox must be SUID root (4755)
    chmod 4755 "$pkgdir/opt/$_name/chrome-sandbox"

    # Install launcher wrapper script (auto-detects Wayland/X11)
    install -Dm755 $_name-launcher.sh "$pkgdir/usr/bin/$_name"

    # Install icon (downloaded separately since it's packed in app.asar)
    install -Dm644 $_name.png "$pkgdir/usr/share/pixmaps/$_name.png"

    # Desktop entry
    install -Dm644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"

    # AppArmor profile
    install -Dm644 $_name.apparmor "$pkgdir/usr/share/apparmor/$_name.apparmor"

    # Security documentation
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
}
