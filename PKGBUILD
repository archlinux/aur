# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=go-dsp-guitar-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="A cross-platform multichannel multi-effects processor for electric guitars and other instruments"
arch=('x86_64')
url='https://github.com/andrepxx/go-dsp-guitar'
license=('Apache')
provides=('go-dsp-guitar' 'dsp-guitar')
conflicts=('go-dsp-guitar' 'dsp-guitar' 'go-dsp-guitar-git')
depends=('glibc' 'jack')
makedepends=('openssl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andrepxx/go-dsp-guitar/releases/download/v${pkgver}/go-dsp-guitar-v${pkgver}.tar.gz")
sha256sums=('a1bb02f5fe85d32a19422f1fac4c0aaa9019a7adff49a6e776d30ed774a286c3')

prepare() {
  cd "${pkgname}"
  rm -rf keys
  mkdir -p keys
  openssl genrsa -out keys/private.pem 4096
  openssl req -new -x509 -days 365 -sha512 -key keys/private.pem -out keys/public.pem -subj "/C=DE/ST=Berlin/L=Berlin/O=None/OU=None/CN=localhost"
}

package() {
  cd "${pkgname}"
  install -Dm755 dsp-linux-amd64 "${pkgdir}/opt/${pkgname}/go-dsp-guitar"
  cp -R config "${pkgdir}/opt/${pkgname}/"
  cp -R ir "${pkgdir}/opt/${pkgname}/"
  cp -R keys "${pkgdir}/opt/${pkgname}/"
  cp -R webroot "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  chmod o+r "${pkgdir}/opt/go-dsp-guitar/keys/private.pem"
}
