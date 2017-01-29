# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>

pkgname=byzanz
pkgver=0.3.0.1
_gitrev=81235d235d12c9687897f7fc6ec0de1feaed6623
pkgrel=3
pkgdesc="Record what's happening on your desktop"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/byzanz"
license=('GPL')
depends=('gtk3' 'gst-plugins-base' 'gst-plugins-good')
makedepends=('gnome-common' 'intltool') # 'gnome-panel'
optdepends=('gst-libav: save into FLV format') # 'gnome-panel: panel applet'
source=(https://git.gnome.org/browse/byzanz/snapshot/$pkgname-$_gitrev.tar.xz
        0001-Port-to-libpanel-applet-5.patch
        flv-audio.patch)
sha256sums=('05709c980b876df015b16e22d0299630708d09ec94c319e5dbceee4bfcf6ae0e'
            'abebbc8116294a8a2a2a43fc9389e075a1d4b0a88731be224e6532daa6ca3577'
            'e45e15f9c52f9bd72e5f362f0494ebee65e1d2c99ea5b0ca446547c11d6ab4d2')

prepare() {
  cd $pkgname-$_gitrev

  # Port to libpanel-applet 5
  # patch -Np1 -i ../0001-Port-to-libpanel-applet-5.patch

  # Fix flv audio
  patch -Np1 -i ../flv-audio.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname-$_gitrev
  CFLAGS+=" -Wno-error"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$_gitrev
  make DESTDIR="$pkgdir" install
}
