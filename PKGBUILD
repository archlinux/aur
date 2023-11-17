# Maintainer: irmluity <45vw4yz8g@mozmail.com>

_pkgname=hiddify.next
pkgname=$_pkgname-git
pkgver=0.10.9.dev
pkgrel=1
pkgdesc="A multi-platform proxy app. Auto, SSH, VLESS, Vmess, Trojan, Reality, Sing-Box, Clash, Xray, Shadowsocks"
arch=(x86_64)
url='https://github.com/hiddify/hiddify-next'
license=('CCPL')
depends=('hicolor-icon-theme' 'zlib' 'glibc' 'fuse2')
makedepends=('git' 'mesa' 'cmake' 'clang' 'locate' 'ninja' 'pkg-config' 'gtk3' 'glib2' 'libayatana-appindicator' 'libayatana-indicator' 'libayatana-common' 'libappindicator-gtk3' 'libappindicator-gtk2' 'fuse3' 'appstream' 'appstream-glib' 'appstream-generator' 'archlinux-appstream-data' 'zsync' 'appimagetool' 'jdk-openjdk')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
)
provides=('hiddify')
conflicts=(${_pkgname} ${_pkgname}-bin)
options=(!strip)
source=(
    "git+https://github.com/hiddify/hiddify-next.git"
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.13.9-stable.tar.xz"
)
sha256sums=(
    "SKIP"
    "b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739"
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
    export CHANNEL=prod
    flutter config --no-analytics
    flutter config --enable-linux-desktop
    flutter pub get
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
    make linux-release
    ls -R dist/
    mkdir tmp_out
    EXT="AppImage"
    mv dist/*/*.$EXT tmp_out/hiddify-linux-x64.$EXT
    chmod a+x tmp_out/hiddify-linux-x64.$EXT
    cd tmp_out
    ./hiddify-linux-x64.AppImage --appimage-extract > /dev/null
    sed -i 's/Exec=/Exec=env /' "./squashfs-root/hiddify.desktop"
}


package() {
    install -Dm755 "${srcdir}/hiddify-next/tmp_out/hiddify-linux-x64.AppImage" "${pkgdir}/${_install_path}/hiddify.AppImage"
    install -Dm644 "${srcdir}/hiddify-next/tmp_out/squashfs-root/hiddify.desktop" "$pkgdir/usr/share/applications/hiddify.desktop"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/hiddify-next/tmp_out/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/hiddify.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/hiddify.png"
    done
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/hiddify"
}
