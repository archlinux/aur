# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor:: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-pmp-webengine
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='http://qt-project.org/'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project (for plex-media-player)'
depends=('qt5-pmp-webchannel' 'qt5-pmp-location' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 'libvpx' 
         'libevent' 'libsrtp' 'snappy' 'nss' 'protobuf' 'libxslt' 'libxdamage' 'minizip' 'ffmpeg')
         # namcap note: libxdamage is needed for nvidia users
makedepends=('python2' 'git' 'gperf' 'jsoncpp' 'ninja')
groups=('qt5-pmp')
_pkgfqn="${pkgname/5-pmp-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
         harmony-fix.diff
         '0001-Fix-no_sanitize-attribute-placement.patch')
sha256sums=('70d26db4e7944291c5f843b875916fb95ceec0f0a8fea3daea8004990199fc07'
            '2c309c0f6978e6a399422319b5034b01881d5526cf48b2ee5fcc7f418029a344'
            '8b0a8a36f2d6ac3c3be28233767655a8ef58fe354b7fa6cbd1f806d3aad3e883')

prepare() {
  mkdir -p build

  # Hack to force using python2
  mkdir -p bin
  ln -sf /usr/bin/python2 bin/python

  cd ${_pkgfqn}

  # FreeType 2.8.1
  patch -Np1 -i ../harmony-fix.diff

  # Based on https://bugs.chromium.org/p/webrtc/issues/detail?id=7857
  cd src/3rdparty/chromium/third_party
  patch -Np1 -i "${srcdir}/0001-Fix-no_sanitize-attribute-placement.patch"
}

build() {
  cd build

  export PATH="$srcdir/bin:$PATH"
  /opt/qt5-pmp/usr/bin/qmake CONFIG+="proprietary-codecs" WEBENGINE_CONFIG+="use_proprietary_codecs" ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/opt/qt5-pmp/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -Dm644 "$srcdir"/${_pkgfqn}/src/3rdparty/chromium/LICENSE "$pkgdir"opt/qt5-pmp/usr/share/licenses/${pkgname}/LICENSE.chromium
}
