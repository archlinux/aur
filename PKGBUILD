pkgname='stork-agent'
pkgver='1.8.0'
pkgrel='1'
pkgdesc="The Kea companion comonent in ISC Stork."
arch=('x86_64')
url='https://gitlab.isc.org/isc-projects/stork'
license=('MPL2')
depends=('glibc')
makedepends=('rake')
backup=('etc/stork')
_repo='stork'
_pkg="${_repo}-v${pkgver}"
source=("https://gitlab.isc.org/isc-projects/${_repo}/-/archive/v${pkgver}/${_pkg}.tar.gz")
sha512sums=('8c86eac4fe54052bc7e9570617105bd31499e4c7f5a89fb2b0f859367591de1fb320f43cdeedb3c6ef004e1f785545a8ec12ac7bd37cac8c15706a3e182d8bfd')

build() {
  tar -xzf "${_pkg}.tar.gz"
  cd "${_pkg}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
  rake build:agent
}

package() {
  cd "${_pkg}"
  rake install:agent DEST="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/man" "${pkgdir}/usr/share"
  mv "${pkgdir}/lib" "${pkgdir}/usr"
}
