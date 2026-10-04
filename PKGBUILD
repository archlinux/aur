# Contributor: taotieren <admin@taotieren.com>

pkgname=fantascene-dynamic-wallpaper
pkgver=2.1.5
pkgrel=1
pkgdesc="dynamic wallpaper. A very nice animated wallpaper on X11 systems.Support Movie and Web animated wallpaper."
arch=($CARCH)
url="https://github.com/dependon/fantascene-dynamic-wallpaper"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname}-git)
_qt=qt6
depends=(
    glib2
    libgcc_s.so
    libstdc++.so
    libglvnd
    libx11
    libxcb
    libxext
    xcb-util-wm
    mpv
    ${_qt}-charts
    ${_qt}-base
    ${_qt}-multimedia
)
makedepends=(
    git
    ${_qt}-tools
    ${_qt}-webengine
    pkgconfig
    make
)
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('d80b0dca3b8efd3f414fa44fb671a861d51d42efc34b15446c963969ce0e5a17')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CXXFLAGS="${CXXFLAGS} -fpermissive"
    qmake6 ./${pkgname}.pro -spec linux-g++ CONFIG+=qtquickcompiler -o build/
    make -C ./build
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="$pkgdir" -C ./build install
}
