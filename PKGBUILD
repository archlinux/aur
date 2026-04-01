# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Alexander Kalentyev <o.kalentev@gmail.com>
_base=METIS
pkgname=${_base,,}-git
pkgver=5.2.1.r13.gdfded64
pkgrel=1
arch=(x86_64)
pkgdesc="Serial Graph Partitioning and Fill-reducing Matrix Ordering"
url="https://github.com/KarypisLab/${_base}"
license=("Apache-2.0")
depends=(
  "glibc"
  "gklib"
)
makedepends=(
  "cmake"
  "git"
)
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

build() {
  cd ${_base}
  make config \
    shared=1 \
    prefix=/usr \
    gklib_path=/usr
}

package() {
  cd ${_base}
  make install DESTDIR="${pkgdir}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
