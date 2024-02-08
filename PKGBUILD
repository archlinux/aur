# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=hiddify-next
pkgname=$_pkgname-git
pkgver=0.15.4
pkgrel=2
pkgdesc="A multi-platform proxy app. Auto, SSH, VLESS, Vmess, Trojan, Reality, Sing-Box, Clash, Xray, Shadowsocks"
arch=(x86_64)
url='https://github.com/hiddify/hiddify-next'
license=('CC-BY-NC-SA-4.0')
depends=('hicolor-icon-theme' 'zlib' 'glibc' 'fuse2' 'gcc-libs' 'glib2')
makedepends=('git' 'mesa' 'cmake' 'clang' 'locate' 'ninja' 'pkg-config' 'gtk3' 'libayatana-appindicator' 'libayatana-indicator' 'libayatana-common' 'libappindicator-gtk3' 'libappindicator-gtk2' 'fuse3' 'appstream' 'appstream-glib' 'appstream-generator' 'archlinux-appstream-data' 'zsync' 'jdk-openjdk' 'dpkg')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=('hiddify')
conflicts=(${_pkgname} ${_pkgname}-bin)
source=(
    "git+https://github.com/hiddify/hiddify-next.git"
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.9-stable.tar.xz"
)
sha256sums=(
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
    dart pub global activate flutter_distributor
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    export CHANNEL=dev
    flutter config --no-analytics
    flutter config --enable-linux-desktop
    sed -i 's/-Werror/-Wno-error -Wno-deprecated-declarations/g' linux/CMakeLists.txt
}

build() {
    cd "${srcdir}/hiddify-next"
    make get-geo-assets
    make get
    make translate
    make gen
    make linux-libs
    unset SOURCE_DATE_EPOCH
    make linux-deb-release
    ls -R dist/
    EXT="deb"
    mv dist/*/*.$EXT ${srcdir}/hiddify-debian-x64.$EXT
    cd "${srcdir}"
    ar x hiddify-debian-x64.deb
    tar -xf data.tar.xz
    sed -i '/Version/d' "${srcdir}/usr/share/applications/hiddify.desktop"
}

package() {
    cd ${srcdir}/usr/share/hiddify
    find . -type f -exec install -Dm 755 {} "$pkgdir/$_install_path"/{} \;
    cd ${srcdir}/usr/share/icons
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/icons"/{} \;
    cd ${srcdir}/usr/share/applications
    find . -type f -exec install -Dm 644 {} "$pkgdir/usr/share/applications"/{} \;
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/hiddify" "${pkgdir}/usr/bin/hiddify"
}
