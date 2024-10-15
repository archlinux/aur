# Maintainer: haxibami <contact at haxibami dot net>

pkgname=nody-greeter
pkgver=1.6.2
pkgrel=2
pkgdesc="LightDM greeter that allows to create wonderful themes with web technologies. Made in Node.js"
arch=("any")
url="https://github.com/JezerM/nody-greeter"
license=("GPL3")
depends=("lightdm" "gobject-introspection" "cairo" "xorg-xsetroot")
makedepends=("git" "nodejs<21" "npm" "python3")
conflicts=('web-greeter')
source=("${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}" "package.patch")
sha256sums=('9dc6b1f2026dfff59039648aca88048a05c1d4f6d869f3731c2b25ed5bfeda82'
  '1ad9ec249d275f92f57800c0c78ed3fa492b6227e7e7ad85aaf528027c9c4a17')

prepare() {
  cd "${pkgname}-${pkgver}"
  git submodule update --init --recursive
  patch --forward --strip=1 --input="${srcdir}/package.patch"
  npm install
}

build() {
  cd "${pkgname}-${pkgver}"
  npm run rebuild
  npm run build
}

package() {
  cd "${pkgname}-${pkgver}"
  node make --DEST_DIR="${pkgdir}/" install
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/nody-greeter" "${pkgdir}/usr/bin"
}
