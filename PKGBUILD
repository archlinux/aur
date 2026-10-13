# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-cli
_pkgname=tizen.js
_commit=45b00106149d0c8eff74ead4a979c909dd80efd6
pkgver=1.0.1
pkgrel=1
pkgdesc="Lightweight CLI to rebuild, resign, and package Tizen applications without Tizen Studio"
arch=('any')
url="https://github.com/reisxd/tizen.js"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('npm')
provides=('tizenjs' 'tizen.js')
conflicts=('tizenjs' 'tizen.js')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/reisxd/tizen.js/archive/${_commit}.tar.gz")
sha256sums=('3f36139d0127c0cc70a19f7855b08f81fec21489e626224b20fd364515771dd9')

build() {
  cd "${_pkgname}-${_commit}"
  npm pack
}

package() {
  cd "${_pkgname}-${_commit}"
  npm install -g --prefix "${pkgdir}/usr" tizen-${pkgver}.tgz

  # Symlink aliases
  ln -sf tizenjs "${pkgdir}/usr/bin/tizen-cli"
  ln -sf tizenjs "${pkgdir}/usr/bin/tizen.js"

  # Clean npm metadata
  find "${pkgdir}" -name "package.json" -exec sed -i '/_where/d' {} + 2>/dev/null || true
  chmod u=rwX,go=rX -R "${pkgdir}"
}
