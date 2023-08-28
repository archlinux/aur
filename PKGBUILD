pkgname=vesc_tool-git
epoch=1
pkgver=r1291.853bb4e
pkgrel=1
pkgdesc="VESC ESC graphical configuration tool"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url="https://vesc-project.com/vesc_tool"
license=('GPL3')
depends=('qt5-base' 'qt5-connectivity' 'qt5-quickcontrols2' 'qt5-serialport' 'qt5-location' 'qt5-gamepad' 'qt5-serialbus')
makedepends=('git')
conflicts=('vesc-tool')

source=("$pkgname"::"git+https://github.com/vedderb/vesc_tool.git"
        "lzokay-explicit-include.patch"::"https://github.com/bionade24/lzokay/commit/5cb18da508cc4d3ec41bc04dccdeef9c5ffedfb2.diff"
        'aur-build-qmake.patch'
        'vesc-tool.desktop'
        'vesc-tool.png')

sha256sums=('SKIP'
            '651ec5822dd2f1197ad76e9e13f5e51bae19058f6ca5573d4ce1976123b55054'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -i "${srcdir}"/aur-build-qmake.patch
    patch -d lzokay -i "${srcdir}"/lzokay-explicit-include.patch
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

  install -Dm644 ../vesc-tool.png \
    "$pkgdir/usr/share/icons/vesc-tool.png"
}

