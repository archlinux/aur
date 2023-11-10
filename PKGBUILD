# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=go-dsp-guitar-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="A cross-platform multichannel multi-effects processor for electric guitars and other instruments"
arch=('x86_64')
url='https://github.com/andrepxx/go-dsp-guitar'
license=('Apache')
provides=('go-dsp-guitar' 'dsp-guitar')
conflicts=('go-dsp-guitar' 'dsp-guitar' 'go-dsp-guitar-git')
depends=('jack' glibc)
makedepends=('openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andrepxx/go-dsp-guitar/releases/download/v${pkgver}/go-dsp-guitar-v${pkgver}.tar.gz")
sha256sums=('afcb9e037a550e272b66f924e203bbcf1932ae02fbd9414232d5ae546c70e737')

prepare() {
	cd "${pkgname%-bin}"
	rm -rf keys
	install -d keys
	openssl genrsa -out keys/private.pem 4096
	openssl req -new -x509 -days 365 -sha512 -key keys/private.pem -out keys/public.pem -subj "/C=DE/ST=Berlin/L=Berlin/O=None/OU=None/CN=localhost"
}

package() {
	cd "${pkgname%-bin}"
	install -Dm755 dsp-linux-amd64 "${pkgdir}/opt/${pkgname%-bin}/go-dsp-guitar"
	cp -R config "${pkgdir}/opt/${pkgname%-bin}/"
	cp -R ir "${pkgdir}/opt/${pkgname%-bin}/"
	cp -R keys "${pkgdir}/opt/${pkgname%-bin}/"
	cp -R webroot "${pkgdir}/opt/${pkgname%-bin}/"
	install -d "${pkgdir}/usr/bin/"
	ln -s /opt/${pkgname%-bin}/${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
	chmod o+r "${pkgdir}/opt/go-dsp-guitar/keys/private.pem"
}
