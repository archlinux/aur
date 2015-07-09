# Maintainer: Niels Martignène <niels.martignene@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
# Contributor: Dave Pretty <david dot pretty at gmail dot com>

pkgname=anki12
pkgver=1.2.11
pkgrel=1
pkgdesc="Helps you remember facts (like words/phrases in a foreign language) efficiently"
url="http://ankisrs.net/"
license=('GPL')
arch=('any')
conflicts=('anki')
replaces=('anki12')
depends=('python2-pyqt' 'python2-sqlalchemy' 'python2-simplejson' 
         'python2-pysqlite')
optdepends=('python2-matplotlib: for graph support'
            'python2-beautifulsoup3: for SuperMemo import support'
            'sox: for audio recording support')
makedepends=('setuptools' 'desktop-file-utils')
source=("http://ankisrs.net/download/mirror/archive/anki-$pkgver.tgz"
        'disable-auto-update.patch'
        'fix-arch-pyqtconfig.patch')
sha256sums=('ca075fd0c0d6851d22046de8f6fa90d7c442cdd4a6783f7c6ffad7fbc46f5089'
            '9ef3c30b5103b7cd52286e54aa17a79f440a92b76cd8146c63b69ddf48137594'
            'f38816a01f50a861ae879764a98a3d8038d4aa331021d1b399d24f05b52b1dad')

prepare() {
  cd "anki-${pkgver}"

  patch -Np1 <"${srcdir}/disable-auto-update.patch"
  patch -Np1 <"${srcdir}/fix-arch-pyqtconfig.patch"
}

build() {
  cd "anki-${pkgver}"

  sed -i -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' anki
  sed -i -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
    $(find . -regex ".*.py\|.*.recipe")
}

package() {
  cd "anki-${pkgver}"
  export PYTHONPATH="${srcdir}/anki-${pkgver}/libanki"

  cd libanki
  python2 setup.py install --root "${pkgdir}"

  cd ..
  python2 setup.py install --root "${pkgdir}"

  # .desktop file and icon
  desktop-file-install --dir "${pkgdir}/usr/share/applications" anki.desktop
  install -D -m 644 icons/anki.png "${pkgdir}/usr/share/pixmaps/anki.png"
}
