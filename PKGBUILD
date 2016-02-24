# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=abricotine
pkgver=0.2.2
pkgrel=1
pkgdesc="A markdown editor with inline preview"
arch=('i686' 'x86_64')
url="http://abricotine.brrd.fr"
license=('GPL3')
makedepends=('npm')
source=("https://github.com/brrd/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('df35a63c1792e8d6bd89e5b7631f465ab57271788ec1630179cd2f7328ba46d6')

prepare() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  [[ $CARCH == "i686" ]] && _arch=ia32 || _arch=x64

  # Remove interactive part
  sed -i '36,41d;$d' scripts/packager.js
  sed -i "36i var arch = \"${_arch}\"," scripts/packager.js
}

build() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  npm install
  npm run packager
}


package() {
  cd "${srcdir}/${pkgname^}-${pkgver}"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r dist/*/* "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname^}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
