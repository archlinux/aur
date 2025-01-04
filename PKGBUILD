# Maintainer: Mark Collins <tera_1225 ɑʈ hotmail ɗɵʈ com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=ddns-updater
pkgver=2.9.0
pkgrel=1
pkgdesc="Dynamic DNS updater daemon (multiple providers)"
arch=(
  'x86_64'
  'armv7h'  # because the release binary exists
  'aarch64' # because the release binary exists
)
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
  "${pkgname}.env"
  "${pkgname}.service"
  "${pkgname}.sysusers"
  "${pkgname}.tmpfiles"
)
sha256sums=('8115ec4e2debbe92414f067eb2963c0329494489c58f8758296783d74f83608b'
            'e36eeec5c040a8cda0bb3a50462bf13dd4050bca93dc730c9770384923a2217b'
            '07363c1e31b1255350ee715da96ff1ab1b61d814d0305b1e80ef43b87b9bd84f'
            '309f261d420190eb08846e133a7bcc039b26ee99b5b96f6645532d9ad31ef741'
            'd33a34bbb658b9b48d77dc16e8eaa3b07003a9535fc0394e437e9e2ea01815f8')
backup=("etc/default/$pkgname")

prepare() {
 cd "${srcdir}/${pkgname}-$pkgver"
 go mod download
}

build() {
 cd "${srcdir}/${pkgname}-${pkgver}/cmd/$pkgname"
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
 install -Dvm 755 "cmd/${pkgname}/${pkgname}" "$pkgdir/usr/bin/$pkgname"
 install -Dvm 644 "${srcdir}/${pkgname}.env" "${pkgdir}/etc/default/${pkgname}"
 install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
 install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
 install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
