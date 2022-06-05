# Maintainer: Colin Arnott <colin@urandom.co.uk>

pkgname=peroxide
pkgver=0.4.0
pkgrel=1
pkgdesc="A third-party ProtonMail bridge serving SMTP and IMAP"
arch=('x86_64')
url="https://github.com/ljanyst/${pkgname}"
license=('GPL3')
depends=()
makedepends=('go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	'systemd.patch')
sha512sums=('4db68af13a78dd0538f26a792526f0b178b4f817bdd334e6d7a93a14bfa1075d7579f3519e2d49c851ef842bf70f554fb6c91070ca78f2d696475ac5602a7711'
            'e4b350dea5619b53ed3585be1701d5cbdb9dc7e408fe41f3f64ea98d73e623e698a860343bb15edf06ad335848850b55ee3f094d8c5a823f381853b2ba4786c6'
            'd91809c612fbe972ae245c2f46ac839456765e77ba724dd4c3f3f0ca97c8c2d0d1edd61d0e85b269985c911ba5310d9afa14af303250383ffac9942b85d38437'
            '551cf027678b3dc7eb348c9123f62c3f44c46896a366f2d176cf132540228c10dd17bc1cd28f290c376af40e67991f903e187b01afe76843c2a4b82631854dd9')

prepare() {
	cd "${pkgname}-${pkgver}"

	patch -Np1 < "${srcdir}/systemd.patch"
}

build() {
	cd "${pkgname}-${pkgver}"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o . ./cmd/peroxide ./cmd/peroxide-cfg
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 -- "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 -- "${pkgname}-cfg" "${pkgdir}/usr/bin/${pkgname}-cfg"
	install -Dm644 -- "config.example.yaml" "${pkgdir}/etc/peroxide.conf"
	install -Dm644 -- "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 -- "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 -- "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
