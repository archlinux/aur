# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Julio Diez <juliosddr@gmail.com>

pkgname=suscan-git
pkgver=r1149.390fb68
pkgrel=1
pkgdesc="SUScan is a graphical signal analysis tool"
arch=("any")
url="https://github.com/BatchDrake/suscan"
license=("GPL")
depends=("soapysdr" "sigutils" "fftw" "libsndfile" "libxml2")
makedepends=("git" "cmake")
optdepends=("libvolk")
provides=("suscan")
conflicts=("suscan")
source=("$pkgname::git+https://github.com/BatchDrake/suscan.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  git submodule init
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON -DCMAKE_SKIP_INSTALL_RPATH=ON ..
  make
}

package() {
  cd "$pkgname/build"

  make DESTDIR="$pkgdir/" install
}
