pkgname='stork-agent'
pkgver='2.4.0'
pkgrel='1'
pkgdesc="The agent that monitors Kea DHCP and BIND 9 as part of ISC Stork."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork/agent.env')
_repo='stork'
source=("https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz")
        # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
sha512sums=(
  '291e8811eca91659a509d7d35e78432c2be7d99ac19faca9fd357d3cd6c8182058bf70ce25a8fb5702ad8dc28fa523f99f43da6d53abe14537988732d986592d'
)

build() {
  tar -xzf "${_repo}-${pkgver}.tar.gz"
  cd "${_repo}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath'
  rake build:agent
  cd ..
}

package() {
  cd "${_repo}-${pkgver}"
  rake install:agent DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
  cd ..
}
