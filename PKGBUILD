# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=endless-sky-editor
pkgver=0.7.10
pkgrel=1
pkgdesc="Map editor for Endless Sky"
arch=('i686' 'x86_64')
url="https://github.com/endless-sky/endless-sky-editor"
license=('GPL3')
depends=('endless-sky' 'qt5-base' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/$pkgname/archive/v$pkgver.tar.gz"
        "endless-sky-editor.pro.patch")
sha512sums=('6252ce85be161a2540857c72d59a42ae7d752a6e6dc50f4e4e53346c379d2f221cf0fd814e19a1b66079cad2779cece60d25c75021ab2ee628cd63f3c4fc9c12'
            '1c7b06bc56400d1657836834c52363dcc35bbd7ada27768b00935938a1f0d11fbb8867c0abba5019e26c884cf7401e54a0ed6d6d42a1ec27e835669dae50f796')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -sp1 endless-sky-editor.pro "${srcdir}"/endless-sky-editor.pro.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # create Makefile with QMake
  qmake-qt5 \
    INSTALL_PREFIX=/usr \
    "${pkgname}.pro"

  # build package
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # copy install to pkgdir
  make INSTALL_ROOT="${pkgdir}" install

  # additional icon sizes
  for res in 16 32 256; do
    install -Dm644 \
      "endless-sky-editor.iconset/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done
}
