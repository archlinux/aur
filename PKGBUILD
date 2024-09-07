# Maintainer: Mark Collins <tera_1225 ɑʈ hotmail ɗɵʈ com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=ddns-updater
pkgver=2.7.0
pkgrel=1
pkgdesc="Dynamic DNS updater daemon (multiple providers)"
arch=('x86_64')
url="https://github.com/qdm12/ddns-updater"
license=('MIT')
makedepends=(
  'git'
  'go'
)
depends=(
  'gcc-libs'
  'glibc'
)
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('54f95fed9883fb9455de407968815edb2e6cdca9336449cc8661e71484600b9b'
            '9c2e723dd7daef50b8c22a52c5a60235daf84d41466d55f3f5b54e7e5d72b52d'
            '309f261d420190eb08846e133a7bcc039b26ee99b5b96f6645532d9ad31ef741'
            'd33a34bbb658b9b48d77dc16e8eaa3b07003a9535fc0394e437e9e2ea01815f8')

prepare() {
 cd "${srcdir}/${pkgname}-$pkgver"
 go mod download
}

build() {
 cd "${srcdir}/${pkgname}-${pkgver}/cmd/updater"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build \
  -trimpath \
  -buildmode=pie \
  -mod=readonly \
  -modcacherw \
  -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
   -gcflags "all=-trimpath=${srcdir}" \
   -asmflags "all=-trimpath=${srcdir}" \
  .
}

package() {
 cd "${srcdir}/${pkgname}-$pkgver"
 install -Dv LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
 install -Dvm 755 cmd/updater/updater "$pkgdir/usr/bin/ddns-updater"
 install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
 install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
 install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
