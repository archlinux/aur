pkgname='stork-server'
pkgver='1.17.0'
pkgrel='1'
pkgdesc="A dashboard for BIND 9 and Kea DHCP."
arch=('any')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=()
makedepends=('java-runtime' 'python' 'rake' 'sed' 'tar' 'unzip' 'wget')
backup=('etc/stork')
_repo='stork'
source=(
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-${pkgver}.tar.gz"
  "https://downloads.isc.org/isc/${_repo}/${pkgver}/${_repo}-server-ldap-${pkgver}.tar.gz"
  "${pkgname}.sysuser"
)
  # "https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
  # "https://gitlab.isc.org/isc-projects/stork-hook-ldap/-/archive/v${pkgver}/stork-hook-ldap-v${pkgver}.tar.gz"
sha512sums=(
  'e6cc5cb575fbce20ed2864be4b2bc2b158c9ff128aedadff532c61679bf8bd1809658021cc3c461cbf7637f4328a8260f05b21f39b20ffe6ffb4e38eb64a0af9'
  '4a4b5dff2abc647117bc8b35c8142e67547dde13c114af43881c9d06b96427bc0a62163c763d1a5099d06b90d8754e66a261dcfde9a5257515f4151ebed6d6cf'
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
