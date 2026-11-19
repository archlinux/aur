# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=xmms-qtify
pkgver=1.2.11
pkgrel=1
_commit=5847897230da018d93cd9833695f944ece96587b
pkgdesc="XMMS, the GTK 1.2 audio player, built on Qt with GTK made Qt"
arch=(x86_64 aarch64)
url="https://github.com/deepfire/xmms"
license=(GPL-2.0-or-later)
depends=(gtk-made-qt glib2 alsa-lib libvorbis libogg)
makedepends=(pkgconf)
provides=(xmms)
conflicts=(xmms)
# no LTO: the 2007 configure's function checks give false positives with it
options=(!lto)
source=("xmms-${_commit}.tar.gz::https://github.com/deepfire/xmms/archive/${_commit}.tar.gz"
        xmms.desktop)
sha256sums=('3963f5e2c0c9b55598dff2e0e86a4b02cae952c46a82f43a62421b22b32d05d1'
            'bcd49d1fb9f9b66eccd574f347d9ba887703dfb64738d75426122997a1698350')

prepare() {
  cd "xmms-${_commit}"
  # time stamps as in the release tarball, so make does not rerun automake 1.x
  find . -exec touch -h -d '2001-01-01 00:00' {} +
  touch -d '2001-01-01 00:01' aclocal.m4
  touch -d '2001-01-01 00:02' configure $(find . -name Makefile.in -o -name '*.h.in')
}

build() {
  cd "xmms-${_commit}"
  # gnu17: GTK 1 era C (unprototyped callbacks, its own bool) is not C23;
  # no tree vectorizer: GCC 14.2 crashes on the ALSA plugin with -ffast-math
  CFLAGS+=" -std=gnu17 -fno-tree-vectorize"
  gtk-made-qt-env --shared ./configure --prefix=/usr --disable-esd --disable-opengl \
    --disable-mikmod --disable-nls ac_cv_lib_SM_SmcOpenConnection=no
  gtk-made-qt-env --shared make
}

check() {
  cd "xmms-${_commit}"
  HOME="$srcdir/home" QT_QPA_PLATFORM=offscreen GTKQT_AUTOQUIT=1500 ./xmms/xmms
}

package() {
  cd "xmms-${_commit}"
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '*.la' -delete
  install -Dm644 ../xmms.desktop "$pkgdir/usr/share/applications/xmms.desktop"
}
