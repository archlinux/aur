# Maintainer: Nigel Kukard <nkukard@LBSD.net>
# Contributor: Zhaofeng Li <hello@zhaofeng.li>

pkgname=gortr
pkgver=0.14.7
pkgrel=1
pkgdesc="The RPKI-to-Router server used at Cloudflare"
arch=('x86_64' 'i686' 'aarch64' 'armv7l')
url="https://github.com/cloudflare/gortr"
license=('BSD')
depends=()
makedepends=('go')
backup=('etc/conf.d/gortr')
source=(
	"gortr-${pkgver}.tar.gz::https://github.com/cloudflare/gortr/archive/v${pkgver}.tar.gz"
	'gortr.env'
	'gortr.service'
)

sha512sums=(
	'02cd38da2af1af11a3384578c81cc07098b6e0a5abdf17cd70dcc7256c7a0ec687a60d590e7ce7a133faa28d0a768ef206c7a59672a10998e52b8a2dc2752a44'
	'3b48c5aa6e4ee074df4e7087f664a114f9fd9b5d586f17cad9cc5af6a6bff788f46012dbec37b5c08e5b858bcbe7f59d7fc65e013104a57a5606e1c3d0b9ee61'
	'a4c2c3032bd7add34844185553759631e7b3b390951bc8a8b94865be43eae5c876b8caafd40dc6690e2111a042086ddc766bdedefb3131680512b0437356ba44'
)

prepare(){
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	install -Dm755 "${srcdir}/gortr-${pkgver}/build/gortr" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/gortr-${pkgver}/build/rtrdump" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/gortr-${pkgver}/build/rtrmon" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/gortr.env" "${pkgdir}/etc/conf.d/gortr"
	install -Dm644 "${srcdir}/gortr.service" "${pkgdir}/usr/lib/systemd/system/gortr.service"
	install -Dm644 "${srcdir}/gortr-${pkgver}/cmd/gortr/cf.pub" "${pkgdir}/usr/lib/${pkgname}/cf.pub"
	install -Dm644 "${srcdir}/gortr-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

