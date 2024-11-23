pkgname='stork-server'
pkgver='2.0.0'
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
  'e80557289a2b4f7bd997de319951ba2d777131ac78b3ccbd0692da66482b2e518346571f55f0ac76d9bbc5fa39efb7e5d439382ed34643708b683b20a8ee68de'
  'da04512bf9858d64a9f8d432d31f11231871315c51a9cce50eceea6e17fb01c3711a9bf5bdc1eef7729f4b286822337c61522b499d1228c661bdae0e331771f1'
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
