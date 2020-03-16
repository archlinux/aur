# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=pdfslicer
pkgver=1.8.2
pkgrel=1
pkgdesc="Simple application to extract, merge, rotate and reorder pages of PDF documents"
arch=(x86_64)
url="https://junrrein.github.io/pdfslicer/"
license=(GPL3)
depends=(gtkmm3 poppler qpdf)
makedepends=(cmake git intltool)
source=("git+https://github.com/junrrein/pdfslicer#tag=v${pkgver}"
        "git+https://github.com/ericniebler/range-v3"
        "git+https://github.com/Microsoft/GSL"
        "git+https://github.com/fmtlib/fmt")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  [[ -d build ]] || mkdir build

  cd $pkgname
  git submodule init
  git config --local submodule.third-party/range-v3.url "$srcdir/range-v3"
  git config --local submodule.third-party/GSL.url "$srcdir/GSL"
  git config --local submodule.third-party/fmtlib.url "$srcdir/fmt"
  git submodule update
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../$pkgname/ \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/{include,lib}
}
