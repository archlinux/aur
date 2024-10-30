pkgname=vesc-tool
pkgver=6.05
_pkgver=6_05
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-location' 'qt5-gamepad' 'qt5-serialbus' 'qt5-svg')
makedepends=('git' 'mold')
conflicts=('vesc_tool-git')
source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git#branch=release_$_pkgver"
        'vesc-tool.patch'
        'vesc-tool.desktop')
sha256sums=('SKIP'
            'c2f39c4ae80a0dc1a376727c36052d1df30ef117ab29bb64a1ef56a78755bc6a'
            'a0d31826279e900ab614744afad1a26b849440c298d8a5e6e318df554beebdde')
options=(!debug)

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -i "${srcdir}"/vesc-tool.patch || exit 1
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5 PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir/${pkgname}"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 ../vesc-tool.desktop \
    "$pkgdir/usr/share/applications/vesc-tool.desktop"

  install -Dm644 'res/+theme_light/icons/v_icon-256.png' \
    "$pkgdir/usr/share/icons/vesc-tool.png"
}

