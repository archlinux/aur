# Maintainer: Jannick Hemelhof <mister.jannick@gmail.com>
# Contributor: Dick Choi <fluke8259@gmail.com>
# Contributor: Romain Bazile <gromain.baz@gmail.com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.8.7
pkgrel=1
pkgdesc="Open source note-taking app for programmers"
arch=('x86_64')
url="https://b00st.io/"
license=('GPL')
depends=(electron)
makedepends=(npm grunt-cli asar)

source=(
  "${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/v"$pkgver".tar.gz"
  "${pkgname}.sh"
  "${pkgname}.desktop"
  "npm-prune-fix.patch"
  )

md5sums=(
  '217d8b343b2215679a212b1a44f21ca7'
  'a4bbf961790883a47e3fef257ba35b98'
  '8547065c63f31831a249ccc1225197e2'
  '5de458c318306de81a9f72bcbfddaa69'
  )

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}"/npm-prune-fix.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  npm install
  grunt compile
  npm prune --production
  asar pack . ../${pkgname}.asar
  cp resources/app.png ../app.png
}

package() {
  cd $srcdir

  install -Dm644 ${pkgname}.asar $pkgdir/opt/${pkgname}/${pkgname}.asar

  install -Dm755 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}

  install -Dm644 app.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png
  install -Dm644 ${pkgname}.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
}

