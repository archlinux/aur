pkgname='stork-server'
pkgver='2.5.1'
pkgrel='1'
pkgdesc="A dashboard for ISC BIND 9 DNS, ISC Kea DHCP, PowerDNS, and other services."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('java-runtime' 'python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork/server.env')
_repo='stork'
source=(
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz"
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-server-ldap-${pkgver}.tar.gz"
  "${pkgname}.sysuser"
)
  # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
  # "https://gitlab.isc.org/isc-projects/stork-hook-ldap/-/archive/v${pkgver}/stork-hook-ldap-v${pkgver}.tar.gz"
sha512sums=(
  'ae9389333580df50841911e7a5c4228a575cc708ee2538a291baa7d60e74e753e702e58860b6591b2d33a36762bf57bfb22bd72b832de7375ea532ff0d04f93f'
  '0918e22c405417c201c90713f462cf2460e9daca34f93170bbdeb47b8a1b9aa6df052e735864f18299579a98bf1c2d903a9ebc15237f545c5ce55a660e1b99a3'
  '524a319ab3b938bdab902b82c99744dcbf90cf5b44dc2bc7003b5fac7b77f6bb07d260c7f5cdd3fee8d3f673ca23611b00d1ded27a96da6fcb85d16e70b7a580'
)

build() {
  tar -xzf "${_repo}-${pkgver}.tar.gz"
  tar -xzf "${_repo}-server-ldap-${pkgver}.tar.gz"
  cd "${_repo}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -ldflags=-linkmode=external -mod=readonly -modcacherw -trimpath'
  rm -rf ./hooks/stork-server-ldap
  cp -rf "../${_repo}-server-ldap-${pkgver}/" ./hooks/stork-server-ldap
  rake build:server
  rake hook:build
  cd ..
}

package() {
  cd "${_repo}-${pkgver}"
  rake install:server DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
  install -Dm644 "./hooks/stork-server-ldap/build/stork-server-ldap.so" "${pkgdir}/usr/lib/stork-server-ldap.so"
  install -Dm644 "${srcdir}/${pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  cd ..
}
