pkgname='stork-server'
pkgver='1.8.0'
pkgrel='1'
pkgdesc="A dashboard for BIND 9 and Kea DHCP."
arch=('x86_64')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=('glibc')
makedepends=('git' 'java-environment' 'python' 'rake' 'unzip' 'wget')
backup=('etc/stork')
_repo='stork'
_pkg="${_repo}-v${pkgver}"
source=("https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz"
        "${pkgname}.sysuser")
sha512sums=('8c86eac4fe54052bc7e9570617105bd31499e4c7f5a89fb2b0f859367591de1fb320f43cdeedb3c6ef004e1f785545a8ec12ac7bd37cac8c15706a3e182d8bfd'
            '524a319ab3b938bdab902b82c99744dcbf90cf5b44dc2bc7003b5fac7b77f6bb07d260c7f5cdd3fee8d3f673ca23611b00d1ded27a96da6fcb85d16e70b7a580')

build() {
  tar -xzf "${_pkg}.tar.gz"
  cd "${_pkg}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  rake build:server
}

package() {
  cd "${_pkg}"
  rake install:server DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/man" "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/${pkgname}.sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
