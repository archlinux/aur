pkgname='stork-agent'
pkgver='2.5.1'
pkgrel='1'
pkgdesc="The agent that monitors ISC BIND 9 DNS, ISC Kea DHCP, and other services as part of ISC Stork."
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
  'ae9389333580df50841911e7a5c4228a575cc708ee2538a291baa7d60e74e753e702e58860b6591b2d33a36762bf57bfb22bd72b832de7375ea532ff0d04f93f'
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
