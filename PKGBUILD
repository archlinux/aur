# Maintainer: taotieren <admin@taotieren.com>

pkgname=ter-music
pkgver=1.11.0
pkgrel=1
pkgdesc="This is a music player that can be used in the terminal~"
arch=($CARCH)
url="https://github.com/YXZL985/ter-music"
license=('GPL-3.0-or-later')
provides=(${pkgname} ${pkgname}-cn)
conflicts=(${pkgname} ${pkgname}-cn)
#replaces=(${pkgname})
_pydeps=(
    cheroot
    paramiko
    pyftpdlib
    # AUR
    wsgidav
)
depends=(
    curl
    dbus
    glibc
    ffmpeg
    hicolor-icon-theme
    ncurses
    libpng
    libjpeg
# ter-music-server
    impacket
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    cmake
    ninja
    pkgconf
)
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('aa020f620fe608578c3c0f8808f5b55124db686992057861679ddc48c49414fb')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    find . -name "*.c" -o -name "*.h" | xargs sed -i 's|#include <ncursesw/ncurses.h>|#include <ncurses.h>|g' 2>/dev/null || true
}

build() {
    cd "${srcdir}/${pkgname}/"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -G Ninja
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install

    cd "${srcdir}"/${pkgname}
    install -vDm755 tools/start-server.py "${pkgdir}/usr/bin/${pkgname}-server"
    install -vdm644 "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -rv docs/* "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
