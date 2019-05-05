# Maintainer: 

pkgname=doublecontact
pkgver=0.2.0
pkgrel=1
pkgdesc="Offline DE-independent contact manager primarily for phonebooks editing/merging"
arch=('x86_64')
url="https://github.com/DarkHobbit/doublecontact/"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
source=(https://github.com/DarkHobbit/${pkgname}/archive/${pkgver}.tar.gz doublecontact_Qt5_build_bugfixes.patch)
sha512sums=('c24a47038dcfcbc8ae2853e10c2c0bbe12eeb02da999f082a7652109504aa437dacf5fe04bc60c5a9aa2b5e178541f178134a44cffb05dfa398c36b5c5daaf52'
            '9bbe2538a5afd04cd9cea42d2eb6919ae300428cba9bd7aeb81bca04a5d8686fef2c220fa4a3757bb6aa817673a55842c27a0c9ca745adb63a4146e2c8a23c88')


prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../doublecontact_Qt5_build_bugfixes.patch
}


build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5 all.pro
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m755 app/doublecontact "${pkgdir}/usr/bin/doublecontact"
  install -D -m755 contconv/contconv "${pkgdir}/usr/bin/contconv"

  # install visuals
  install -D -m644 app/doublecontact.desktop "${pkgdir}/usr/share/applications/doublecontact.desktop"
  #install -D -m644 "img/128x128/doublecontact_128x128.png" "${pkgdir}/usr/share/pixmaps/doublecontact.png"
  install -D -m644 "img/32x32/doublecontact_32x32.png" "${pkgdir}/usr/share/pixmaps/doublecontact_32x32.png"
  for format in {16x16,32x32,64x64,128x128,256x256,512x512}; do
      install -D -m644 "img/${format}/doublecontact_${format}.png" "${pkgdir}/usr/share/icons/hicolor/${format}/apps/doublecontact.png"
  done

  # install translations
  install -D -m644 translations/iso639-1.utf8 "$pkgdir"/usr/share/$pkgname/translations/iso639-1.utf8
  install -D -m644 translations/*.qm -t "$pkgdir"/usr/share/$pkgname/translations/
}

