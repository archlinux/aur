# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=hiddify-next
pkgname=$_pkgname-git
pkgver=1.1.1
pkgrel=1
pkgdesc="Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It’s an open-source, secure and ad-free"
arch=(x86_64)
url='https://github.com/hiddify/hiddify-next'
license=('CC-BY-NC-SA-4.0')
depends=('hicolor-icon-theme' 'glibc' 'gcc-libs' 'glib2' 'libayatana-appindicator' 'libdbusmenu-glib' 'libayatana-indicator' 'ayatana-ido')
makedepends=('git' 'mesa' 'cmake' 'clang' 'locate' 'ninja' 'pkg-config' 'gtk3' 'libayatana-common' 'libappindicator-gtk3' 'libappindicator-gtk2' 'fuse3' 'fuse2' 'appstream' 'zsync' 'file' 'patchelf')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
options=(!strip)
provides=('hiddify')
conflicts=(${_pkgname} ${_pkgname}-bin)
source=(
    "git+https://github.com/hiddify/hiddify-next.git"
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.19.4-stable.tar.xz"
    "hiddify.desktop"
)
sha256sums=(
    "SKIP"
    "SKIP"
    "SKIP"
)
_install_path="/opt/$_pkgname"

pkgver() {
    cd "$srcdir/hiddify-next"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    export PATH="$PATH:${srcdir}/flutter/bin"
    cd "${srcdir}/hiddify-next"
    flutter precache
    dart pub global activate --source git https://github.com/hiddify/flutter_distributor --git-path packages/flutter_distributor
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    export CHANNEL=dev
    flutter config --no-analytics
    flutter config --enable-linux-desktop
    make linux-prepare
}

build() {
    cd "${srcdir}/hiddify-next"
    flutter build linux --release
}

package() {
    cd "${srcdir}/hiddify-next/build/linux/x64/release/bundle"
    find . -type f -exec install -Dm 755 {} "$pkgdir/$_install_path"/{} \;
    install -Dm644 data/flutter_assets/assets/images/logo.svg "${pkgdir}/usr/share/pixmaps/hiddify.svg"
    install -Dm644 "${srcdir}/hiddify.desktop" "${pkgdir}/usr/share/applications/hiddify.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/hiddify" "${pkgdir}/usr/bin/hiddify"
}
