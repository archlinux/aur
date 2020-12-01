pkgname=nedit-ng-git
pkgver=r2782.b72ec0cc
pkgrel=2
pkgdesc="a Qt port of the Nirvana Editor (NEdit) version 5.6"
arch=("x86_64")
url="https://github.com/eteran/nedit-ng"
license=('GPL2')
groups=()
depends=('qt5-base' 'qt5-x11extras')
makedepends=('git' 'cmake' 'boost' 'imagemagick')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('nedit-ng::git+https://github.com/eteran/nedit-ng.git'
'nedit-ng.desktop')
noextract=()
md5sums=('SKIP'
'4f2ec08c0ece5d29e1f08db4d0ef8f80')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    mkdir -p build
}

build() {
    cd "${srcdir}/${pkgname%-git}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
    convert ../src/res/nedit-ng.png -crop 48x48+1+1 nedit-ng.png
}

package() {
    cd "${srcdir}/${pkgname%-git}/build"
    make DESTDIR="$pkgdir" install
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
    install -m 644 "${srcdir}/${pkgname%-git}/build/nedit-ng.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -m 644 "${srcdir}/nedit-ng.desktop" "${pkgdir}/usr/share/applications"
}
