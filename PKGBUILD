pkgname=vesc_tool-git
epoch=1
pkgver=r1412.7c02f7f
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-location' 'qt5-gamepad' 'qt5-serialbus' 'qt5-svg')
makedepends=('git' 'mold')
conflicts=('vesc-tool')
source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git"
        'aur-build-qmake.patch'
        'vesc-tool.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
options=(!debug)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -i "${srcdir}"/aur-build-qmake.patch || exit 1
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

