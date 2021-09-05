# Maintainer:  Dominik Kummer <admin@arkades.org>

pkgname=kraft-git
pkgver=0.80beta8.r347.g33edf37
pkgrel=1
pkgdesc="A program suitable for all trades or crafts (git)"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('akonadi-contacts' 'ctemplate' 'python-reportlab' 'python-pypdf2')
conflicts=('kraft')
optdepends=("python-weasyprint: alternative PDF generator")
makedepends=('cmake' 'extra-cmake-modules' 'asciidoctor' 'po4a')
source=(
  "${pkgname}::git://github.com/dragotin/kraft.git"
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${pkgname}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done

  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}/build"
  export PATH="/usr/bin/vendor_perl/:$PATH"
  cmake ".." \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('SKIP')
