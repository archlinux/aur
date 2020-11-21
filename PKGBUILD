# Maintainer: Cian McGovern <cian@cianmcgovern.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-webengine-595
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=4
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('LGPL3' 'LGPL2.1' 'BSD')
pkgdesc='Provides support for web applications using the Chromium browser project (v5.9.5)'
depends=('qt5-webchannel-595' 'qt5-location-595' 'libxcomposite' 'libxrandr' 'pciutils' 'libxss' 'libvpx' 
         'libevent' 'libsrtp' 'snappy' 'nss' 'protobuf' 'libxslt' 'libxdamage' 'minizip' 'ffmpeg')
         # namcap note: libxdamage is needed for nvidia users
makedepends=('python2' 'git' 'gperf' 'jsoncpp' 'ninja')
_pkgfqn="qtwebengine-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz"
        "QTBUG-76963.diff"
        "QTBUG-64925.diff"
        "QTBUG-77037.diff"
        "WEBRTC-7857.diff"
        "qtwebengine-ffmpeg4.patch"
        "fix-building-with-system-icu.diff"
        "QTBUG-86018.patch")
sha256sums=('70d26db4e7944291c5f843b875916fb95ceec0f0a8fea3daea8004990199fc07'
            'ae6b783f6dc8a6b6b97e44101a685aeca858bd5948e083ce442821b5d8db8c74'
            '3510f53302c6147882f43855da448b4f08cbdb10297b91474849ddbd359d5e9d'
            '5f1b988568f57bff1b64341d0a447d1e43189215a7c0689540f45bedcf969119'
            'ddd8d8b64fb2f81bbc5acd3d77cc6aeb79df44db451c3fed94f0e05b73c7b078'
            '0be352f23946a41cddae941ecedfe1bceb62b23e2a1225dd5469e77e251ccf42'
            'cef22eeef1dedd484dec4cf94bb0aed2881ea7b2ee6d563e6940f4362e26604f'
            '1eaef6c3ae167c75eec42713a6c7301f0781610d24019b5241b5f77fc207d2ed')

prepare() {
  mkdir -p build

  # Hack to force using python2
  mkdir -p bin
  ln -s /usr/bin/python2 bin/python

  cd ${_pkgfqn}

  patch -p1 -i ../QTBUG-76963.diff 
  patch -p1 -i ../QTBUG-64925.diff 
  patch -p1 -i ../QTBUG-77037.diff
  patch -p1 -i ../WEBRTC-7857.diff 
  patch -p1 -i ../qtwebengine-ffmpeg4.patch
  patch -p1 -i ../fix-building-with-system-icu.diff
  patch -p1 -i ../QTBUG-86018.patch
}

build() {
  QT_BASE_DIR=/opt/qt595
  export QTDIR=$QT_BASE_DIR
  export PATH=$QT_BASE_DIR/bin:$PATH
  cd build

  export PATH="$srcdir/bin:$PATH"
  qmake CONFIG+="proprietary-codecs" WEBENGINE_CONFIG+="use_proprietary_codecs use_system_ffmpeg use_system_icu" ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/opt/qt595/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -Dm644 "$srcdir"/${_pkgfqn}/src/3rdparty/chromium/LICENSE "$pkgdir"/opt/qt595/share/licenses/${pkgname}/LICENSE.chromium
}
