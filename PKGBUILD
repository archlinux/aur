# Maintainer: taotieren <admin@taotieren.com>

pkgname=chinesechess-git
_pkgname=ChineseChess
pkgver=6.2.r0.gbd96aca
pkgrel=0
pkgdesc="Cross-platform and online battle platform game based on Qt: Chinese Chess. Also known as:『Xiangqi』『中国象棋』"
arch=(aarch64
	riscv64
	x86_64)
license=('GPL3')
_qt=qt5
depends=(
  hicolor-icon-theme
  $_qt-charts
  $_qt-x11extras
  $_qt-svg
  $_qt-multimedia
  $_qt-tools
  $_qt-xmlpatterns)
makedepends=(git
	cmake
	gendesk
	ninja)
url="https://github.com/XMuli/ChineseChess"
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}


prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build(){
	cd "$srcdir/$pkgname"
# see：https://wiki.archlinux.org/title/CMake_package_guidelines
# gcc build
#     cmake -DCMAKE_BUILD_TYPE=Release \
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -B build \
        -G Ninja
}


package() {
	cd "$srcdir/$pkgname"
	# ninja install
    DESTDIR="${pkgdir}" ninja -C build install
	gendesk -q -f -n --pkgname="${pkgname%-git}" --name="${pkgname%-git}" --comment="${pkgdesc}" --categories="Game"  --exec="${_pkgname}" --icon="${pkgname%-git}.svg"
	install -Dm0644 "$srcdir/$pkgname/resources/logo/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	install -Dm0644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
