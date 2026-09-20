# Maintainer: dougEfresh <dchimento@gmail.com>
pkgname=pi-ext-cursor-sdk
pkgver=0.3.8
pkgrel=1
pkgdesc='pi provider extension backed by Cursor SDK local agents'
arch=('any')
url='https://github.com/fitchmultz/pi-cursor-sdk'
license=('MIT')
depends=('nodejs')
optdepends=('pi-coding-agent' 'pi-coding-agent-git')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fitchmultz/pi-cursor-sdk/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2074f536898652330fa40ad4ef72feddba254b939be5faaaf5be190c9b076179')
options=('!strip' '!debug')
install='pi-ext.install'

build() {
  cd "${srcdir}/pi-cursor-sdk-${pkgver}"

  npm ci \
    --omit=dev \
    --no-audit \
    --no-fund
}

package() {
  cd "${srcdir}/pi-cursor-sdk-${pkgver}"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # docs
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -a docs README.md CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/"

  # extension payload
  _ext="${pkgdir}/usr/share/pi/extensions/cursor-sdk"
  install -d "${_ext}"

  # runtime source + bundled deps
  cp -a src shared node_modules package.json "${_ext}/"
}
