# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing
pkgver=0.9.2b
pkgrel=2
partsrev=de7f8a4c8f7df4ed57386edf68275cdd66a1910d
pkgdesc='PCB layout prototyping application'
arch=('i686' 'x86_64')
url=http://fritzing.org
license=(GPL3)
makedepends=('boost')
install=fritzing.install
depends=('desktop-file-utils' 'java-environment' 'python2' 'qt5-serialport' 'qt5-svg' 'shared-mime-info')
source=(https://github.com/fritzing/fritzing-app/archive/${pkgver}.tar.gz
        https://github.com/fritzing/fritzing-parts/archive/${partsrev}.tar.gz
        fritzing.xml)
sha256sums=('6e9dbb94a4ca5e23effc2056f471c78913b9efa4c154ced94de8f72bfe29735f'
            'b9eeac2d8b169eb80162f607b5bedd9a2c92191690685955d674c14ba7aefcc1'
            '9aa55c4a27025b40a1573b3b09a59f48709dfa5ac637ef6a059fd8157d20192b')

prepare() {
  mv "$srcdir"/fritzing-parts-${partsrev}/* "$srcdir"/fritzing-app-${pkgver}/parts
}

build() {
  cd "$srcdir"/fritzing-app-${pkgver}
  qmake-qt5
  make
}

package() {
  cd "$srcdir"/fritzing-app-${pkgver}

  make INSTALL_ROOT="$pkgdir" install

  # patch python scripts to use python2
  find "$pkgdir"/usr/share/$pkgname/parts/part-gen-scripts/ \
    -name \*.py -exec sed -i \
      -e 's#/usr/bin/env python$#/usr/bin/env python2#' \
      -e 's#/usr/bin/python$#/usr/bin/python2#' {} \;

  # connect .fzz files to fritzing by default
  install -Dm644 "${srcdir}/fritzing.xml" "${pkgdir}/usr/share/mime/packages/fritzing.xml"
  echo "MimeType=application/x-fritzing;" >> "${pkgdir}/usr/share/applications/fritzing.desktop"
}
