# Maintainer: Enihcam <gmail n a n e r i c w a n g>

_commit=940493ce509bb2784738d547cc27df677b4835a2 # master
pkgname="lxqt-connman-applet"
pkgver=201805
pkgrel=1
pkgdesc='LXQt system-tray applet for connman'
epoch=1
arch=('i686' 'x86_64')
url='https://github.com/lxqt/lxqt-connman-applet'
license=('LGPL')
depends=('liblxqt' 'qt5-svg' 'connman')
makedepends=('git' 'cmake' 'qt5-tools' 'lxqt-build-tools')
conflicts=("$pkgname-git")
source=("git+$url.git#commit=$_commit"
        "use_app_font.patch"
        "fix_build_qt511.patch"
        "russian_translation.patch")
sha256sums=("SKIP"
            "dbe35db41680798814cd83bee84fedcc550caa4465f9553522109a7b47823ce6"
            "abd9cac3a8ff2a61cecac945066a2565c06b7cea6df8e8c812e60f7b6bc94e90"
            "c953bb93ddbac8203d5f50797d1d1280c8451e4b644726e5fa0b86200afa300b")

prepare() {
  cd $pkgname
  patch -p1 -i "${srcdir}/use_app_font.patch"
  patch -p1 -i "${srcdir}/fix_build_qt511.patch"
  patch -p1 -i "${srcdir}/russian_translation.patch"
}

build() {
  cd $pkgname
  cmake "$srcdir/$pkgname" \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_C_FLAGS:STRING="$CFLAGS" \
    -DCMAKE_CXX_FLAGS:STRING="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="$LDFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
