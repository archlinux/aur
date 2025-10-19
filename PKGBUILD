# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=qelectrotech-git
pkgver=r8055.410c9293d
pkgrel=1
pkgdesc="libre and open source desktop application to create diagrams and schematics"
arch=(x86_64)
license=(GPL-2.0-only)
url="https://qelectrotech.org/"
depends=(qt5-base qt5-svg kcoreaddons5 kwidgetsaddons5 tk python hicolor-icon-theme gcc-libs glibc sqlite)
makedepends=(git cmake)
conflicts=(qelectrotech)
provides=(qelectrotech)
source=("${pkgname}::git+https://github.com/qelectrotech/qelectrotech-source-mirror.git"
        "install-dir.patch")
sha256sums=('SKIP'
            '2e972aca0da3700625ac37b8cec039dcee7c23db612204e5f161ad8ae1bf88df')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule update --init

  patch -Np0 -i "${srcdir}/install-dir.patch"
  sed -i 's/gzip \-9n/gzip -9nf/' "man/compress_man_pages.sh"
}

build() {
  cd "${srcdir}/${pkgname}"

  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make INSTALL_ROOT="${pkgdir}" install
}
