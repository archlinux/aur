# Maintainer: Meow-2 <orzkey@outlook.com>

pkgname=rofi-imdkit
pkgver=1.7.5.r178.g9cea843b
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement(build with imdkit to support fcitx input)'
arch=('x86_64')
url='https://github.com/DaveDavenport/rofi/'
license=('MIT')
depends=(
    'cairo'
    'flex'
    'freetype2'
    'libjpeg'
    'librsvg'
    'libx11'
    'libxcb'
    'libxdg-basedir'
    'libxft'
    'libxkbcommon'
    'libxkbcommon-x11'
    'pango'
    'startup-notification'
    'xcb-util'
    'xcb-util-cursor'
    'xcb-util-wm'
    'xcb-util-xrm'
    'xcb-imdkit'
)
makedepends=('git' 'meson' 'ninja')
checkdepends=('check')
provides=("${pkgname/-imdkit/}")
conflicts=("${pkgname/-imdkit/}")
source=(
    'git+https://github.com/DaveDavenport/rofi#branch=next'
    'git+https://github.com/sardemff7/libgwater'
    'git+https://github.com/sardemff7/libnkutils'
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${pkgname/-imdkit/}"

    git describe --long --tags \
        | sed 's/-/.r/;s/-/./'
}

prepare() {
    cd "${pkgname/-imdkit/}"
    for module in libgwater libnkutils; do
        local submodule="subprojects/${module}"
        git submodule init "${submodule}"
        git config "submodule.${submodule}.url" "${srcdir}/${module}"
        git submodule update "${submodule}"
    done
    cd "${srcdir}"

    meson setup "${pkgname/-imdkit/}" build \
        --reconfigure -Dimdkit=true \
        --buildtype release \
        --prefix /usr
}

build() {
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install

    cd "${pkgname/-imdkit/}"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/rofi/COPYING"
    install -Dm755 Examples/*.sh -t "${pkgdir}/usr/share/doc/rofi/examples"
}
