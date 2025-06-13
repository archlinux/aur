pkgname='stork-agent'
pkgver='2.2.0'
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
sha512sums=('1784accc9cc7351b3b446c0be41619800fdcb2d03942c7703263a1382fceb3dab4ffc88304771abcaa922d01052ce86ed3e630ad13e26e4a68572097fb3b312f')

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
