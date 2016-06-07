# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing
pkgver=0.9.3b
pkgrel=1
partsrev=667a5360e53e8951e5ca6c952ae928f7077a9d5e
pkgdesc='PCB layout prototyping application'
arch=('i686' 'x86_64')
url=http://fritzing.org
license=(GPL3)
makedepends=('boost')
depends=('desktop-file-utils' 'java-environment' 'libgit2' 'python2' 'qt5-serialport' 'qt5-svg' 'shared-mime-info')
source=(https://github.com/fritzing/fritzing-app/archive/${pkgver}.tar.gz
        https://github.com/fritzing/fritzing-parts/archive/${partsrev}.tar.gz
        0001-fix-application-icon-does-not-show-on-GNOME-desktop.patch
        0002-fix-desktop-Categories-entry.patch
        0003-remove-desktop-Version-entry.patch
        0004-Remove-boost-detection.patch
        0005-Remove-libgit2-detection.patch
        0006-Adapt-to-libgit2-0.24.x.patch
        0007-Provide-a-sane-default-for-parts-path.patch
        fritzing.xml)
sha256sums=('7d92579cf87bbde2325e641b674b6c340fd27ee28a8ffe4c03e527e9a4307d88'
            'c6f9c5275a569e86c0cadb85844120e8f79ca79bea004b00916af78772969d76'
            '904942e9e300cad65736dc4f4a8b275725beada5b22d9055dd9575372a393a65'
            '6fa9c5deb9b230be610fde8ad1739ec26061ce30b92cf01fb2daea8adf782a5f'
            '32199648f399b8bdcd73e99f725ce1f9ae5b32ebe40ea498113c3f931be426b4'
            '11a0392f3447135e9758c3dc3eebfa8efa47bd5cb92a1f2f7d236c3917145bc3'
            'bb36274fa1e13d0c8f383096463b3fa9c3e46916df1089185f166d9990e58049'
            '0be82b1afef07d739926943eb8c2eca939f1715b826e96ee368ff24be81f7e19'
            '49f68d73cc04d364a929b0a51128b8ac06a3b6fcd46bb233b6c9ca2688381fbf'
            '9aa55c4a27025b40a1573b3b09a59f48709dfa5ac637ef6a059fd8157d20192b')

prepare() {
  mkdir "$srcdir"/fritzing-app-${pkgver}/parts
  mv "$srcdir"/fritzing-parts-${partsrev}/* "$srcdir"/fritzing-app-${pkgver}/parts

  cd "$srcdir"/fritzing-app-${pkgver}
  patch -p1 < "$srcdir"/0001-fix-application-icon-does-not-show-on-GNOME-desktop.patch
  patch -p1 < "$srcdir"/0002-fix-desktop-Categories-entry.patch
  patch -p1 < "$srcdir"/0003-remove-desktop-Version-entry.patch
  patch -p1 < "$srcdir"/0004-Remove-boost-detection.patch
  patch -p1 < "$srcdir"/0005-Remove-libgit2-detection.patch
  patch -p1 < "$srcdir"/0006-Adapt-to-libgit2-0.24.x.patch
  patch -p1 < "$srcdir"/0007-Provide-a-sane-default-for-parts-path.patch
}

build() {
  cd "$srcdir"/fritzing-app-${pkgver}
  qmake-qt5
  make
}

package() {
  cd "$srcdir"/fritzing-app-${pkgver}
  make INSTALL_ROOT="$pkgdir" install

  # connect .fzz files to fritzing by default
  install -Dm644 "${srcdir}/fritzing.xml" "${pkgdir}/usr/share/mime/packages/fritzing.xml"
  echo "MimeType=application/x-fritzing;" >> "${pkgdir}/usr/share/applications/fritzing.desktop"
}
