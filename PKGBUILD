# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contriburor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Corrado Primier <ilbardo@gmail.com>

pkgname=xsoldier
pkgver=1.8
pkgrel=2
pkgdesc="2D shoot 'em up single-player game"
arch=('i686' 'x86_64')
url="http://www.interq.or.jp/libra/oohara/xsoldier"
license=('GPL')
depends=('sdl_image')
install="${pkgname}.install"
source=("${url}/${pkgname}-${pkgver}.tar.gz"
        "install-paths.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('f76c2e5465a1a2aca2286415b13b01a4'
         '6ea2ecd288e44090f79aa77292a5c74e'
         '438b0f26e90042e2b2fa47894b194613'
         '27d579d5645e77957cec358ded399d2b')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../install-paths.patch
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --enable-duplicated-scores \
    --with-sdl
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  # Set permissions for the scores file
  chmod 664 "${pkgdir}/var/lib/${pkgname}/${pkgname}.scores"
  chgrp games "${pkgdir}/var/lib/${pkgname}/${pkgname}.scores"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r old-doc ChangeLog LICENSE README "${pkgdir}/usr/share/doc/${pkgname}"
}
