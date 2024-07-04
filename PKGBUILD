# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="udpreplay"
pkgname="${_pkgname}-git"
pkgver=1.1.0.r7.ga62309e
pkgrel=1
pkgdesc="Replay UDP packets from a pcap file"
arch=('any')
url="https://github.com/rigtorp/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libpcap')
makedepends=('git' 'make' 'cmake>=3.5.0' 'gcc' 'libpcap')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "build" ] || mkdir "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}/build"
  cmake ..
  make
}

# check() {
#  cd "${srcdir}/${_pkgsrc}/build"
#  make test
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
