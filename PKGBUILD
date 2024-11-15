# Maintainer: Alexander Kalentyev <o.kalentev@gmail.com>
_base=METIS
pkgname=${_base,,}-git
pkgver=5.2.1.r4.ge0f1b88
pkgrel=1
arch=(x86_64)
pkgdesc="Serial Graph Partitioning and Fill-reducing Matrix Ordering"
url="https://github.com/KarypisLab/${_base}"
license=(Apache)
depends=(glibc gklib)
makedepends=(cmake)
options=(docs)
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')
provides=(${_base,,})
conflicts=(${_base,,})

pkgver() {
  cd ${_base}
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
  cd ${_base}
  echo "target_link_libraries(metis PUBLIC \"-lGKlib\")" >>"libmetis/CMakeLists.txt"
}

build() {
  cd ${_base}
  make config \
    shared=1 \
    cc=gcc \
    prefix=/usr \
    gklib_path=/usr
}

package() {
  cd ${_base}
  make install DESTDIR="${pkgdir}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
