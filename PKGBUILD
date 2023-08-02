pkgname='stork-agent'
pkgver='1.12.0'
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
sha512sums=('e0fcec11d2c00a9c95e0e35f3a42644c9dfeadd58302b01d648e952ad8bba4dde7e363b9be6cdc954057b764eb6f10493a61de24892c9b013d97f577de810150')

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
