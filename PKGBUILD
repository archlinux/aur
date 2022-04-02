# Contributor: Gergely Imreh <imrehg gmail com>

pkgname=particle-cli
pkgdesc='CLI tool for the Particle hardware platform'
pkgver=3.0.0
pkgrel=1
arch=(any)
url='http://particle.io/'
license=('GPL')
depends=('libusb' 'udev' 'nodejs')
makedepends=('npm' 'git' 'python')
optdepends=('dfu-util: local flashing'
            'openssl: local flashing')
source=(http://registry.npmjs.org/$pkgname/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
md5sums=('5de8b6e5fc579b4c8b8d473b812823f9')
sha256sums=('ef8e634393c7c39dc42b9d96ebbf9a62f4c869b0871b803a484b5bf4388b96d8')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  sed -i 's|, GROUP="plugdev", MODE="0666"|, TAG+="uaccess"|g' "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules"
  install -D -m644 "${pkgdir}/usr/lib/node_modules/${pkgname}/assets/50-particle.rules" "${pkgdir}/etc/udev/rules.d/50-particle.rules"
  rm `find "${pkgdir}/" -name '.deps'` -rf
}
