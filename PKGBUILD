pkgname='stork-agent'
pkgver='1.14.0'
pkgrel='1'
pkgdesc="The agent that monitors Kea DHCP and BIND 9 as part of ISC Stork."
arch=('x86_64')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('rake')
backup=('etc/stork')
_repo='stork'
_pkg="${_repo}-v${pkgver}"
source=("https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz")
sha512sums=('72fc57ded577e1d2128bf9ad06a0999bd329cfb90ebc82876dbd177abaa7ec843c2f1c6e4eff7fd8d023efb29c85dc6300e44f88ec20d8bd37ba61a9ad51a878')

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
