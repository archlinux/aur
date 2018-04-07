# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing
pkgver=0.9.3b
pkgrel=4
partsrev=667a5360e53e8951e5ca6c952ae928f7077a9d5e
pkgdesc='PCB layout prototyping application'
arch=('i686' 'x86_64')
url=http://fritzing.org
license=(GPL3)
makedepends=('boost')
depends=('desktop-file-utils' 'java-environment' 'libgit2' 'python2' 'qt5-serialport' 'qt5-svg' 'shared-mime-info')
source=(https://github.com/fritzing/fritzing-app/archive/${pkgver}.tar.gz
        parts-${partsrev}.tar.gz::https://codeload.github.com/fritzing/fritzing-parts/tar.gz/${partsrev}
        0001-Squashed-commit-of-the-following.patch
        fritzing.desktop.patch
        fritzing.xml)
sha256sums=('2475a95aad2c1536eef3fdb72665c5c16590644b45bd110a0cde223c916625b8'
            'c6f9c5275a569e86c0cadb85844120e8f79ca79bea004b00916af78772969d76'
            'e142b7443d03c644d06a4741dcc64eef7077a86b42b4461f10ee8b1f59e4775c'
            'e48994c9d4191675ca8c53c64d99effc704bb10b67f253eb9f05b0c188805baa'
            '9aa55c4a27025b40a1573b3b09a59f48709dfa5ac637ef6a059fd8157d20192b')

prepare() {
  mkdir -p "$srcdir"/fritzing-app-${pkgver}/parts
  mv "$srcdir"/fritzing-parts-${partsrev}/* "$srcdir"/fritzing-app-${pkgver}/parts

  cd "$srcdir"/fritzing-app-${pkgver}
  patch -p1 < "$srcdir"/0001-Squashed-commit-of-the-following.patch
  patch -p0 < "$srcdir"/fritzing.desktop.patch
}

build() {
  cd "$srcdir"/fritzing-app-${pkgver}
  qmake-qt5
  make
}

package() {
  cd "$srcdir"/fritzing-app-${pkgver}
  make INSTALL_ROOT="$pkgdir" install

  # install partsdb clone script
  install -Dm755 "${srcdir}"/fritzing-app-${pkgver}/tools/user_parts_clone.sh "${pkgdir}"/usr/bin/fritzing_clone_parts

  # connect .fzz files to fritzing by default
  install -Dm644 "${srcdir}/fritzing.xml" "${pkgdir}/usr/share/mime/packages/fritzing.xml"
  echo "MimeType=application/x-fritzing;" >> "${pkgdir}/usr/share/applications/fritzing.desktop"
}
