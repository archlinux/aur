# Maintainer: Yauheni Kirylau <actionless DOT loveless PLUS aur AT gmail DOT com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=protoplug
pkgver=1.4.0
pkgrel=2
pkgdesc="A VST plugin which runs Lua scripts as audio and MIDI effects and instruments"
arch=('i686' 'x86_64')
url="http://www.osar.fr/protoplug/"
license=("MIT")
groups=('vst-plugins')
depends=('curl' 'gtk3' 'luajit')
optdepends=('fftw: FFTW support for protoplug Lua scripts')
  #"gcc9.patch::https://github.com/juce-framework/JUCE/commit/4e0adb2af8b424c43d22bd431011c9a6c57d36b6.diff"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pac-dev/${pkgname}/archive/v${pkgver}.tar.gz"
  "gcc9.patch"
)
sha256sums=('69fd7a581d2371b6776209fa199e7c7109e248b97605d34593de3cd1ed91c886'
            '0c074fd4871f0e658de4bce596b73af5bc58415f6434f2451fd6b9c86854e880')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}/Frameworks/"
  patch -Np1 -i "${srcdir}/gcc9.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/Builds/multi/Linux/"

  make CONFIG=Release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # plug-in binaries
  install -Dm755 Bin/linux/*.so -t "${pkgdir}/usr/lib/vst"
  # license
  install -Dm644 license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # support files
  cd ProtoplugFiles
  install -dm755 "${pkgdir}/usr/share/ProtoplugFiles"
  for file in effects generators include themes *.xml; do
    cp -r $file "${pkgdir}/usr/share/ProtoplugFiles"
  done

  # documentation
  cd doc
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  for file in classes examples modules *.html *.css; do
    cp -r $file "${pkgdir}/usr/share/doc/${pkgname}"
  done
  ln -s ../doc/${pkgname} "${pkgdir}/usr/share/ProtoplugFiles/doc"
}

# vim:set ts=2 sw=2 et:
