pkgname='stork-agent'
pkgver='1.11.0'
pkgrel='1'
pkgdesc="The agent that monitors Kea DHCP and BIND 9 as part of ISC Stork."
arch=('x86_64')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=()
backup=('etc/stork')
_repo='stork'
_pkg="${_repo}-v${pkgver}"
source=("https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz")
sha512sums=('32488284bb80dc8ad8360938d5ba4f94c2593c38fdded6aef5ad5c1c2e6738d9438e4a070aa68e90e3b26553ab616e0c5bcfc9b05a4b314b99e896748b0312e9')

build() {
  tar -xzf "${_pkg}.tar.gz"
  cd "${_pkg}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath'
  rake build:agent
}

package() {
  cd "${_pkg}"
  rake install:agent DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
}
