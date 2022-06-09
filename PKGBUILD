# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.6
pkgrel=2
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=(x86_64)
url="https://drobilla.net/software/patchage.html"
license=(GPL3)
depends=(atkmm cairo cairomm dbus-glib gcc-libs gdk-pixbuf2 glibc
libsigc++ pangomm)
makedepends=(alsa-lib atk boost dbus fontconfig freetype2 ganv
glib2 gtk2 harfbuzz jack pango waf)
options=(debug)
source=(https://download.drobilla.net/$pkgname-$pkgver.tar.bz2{,.sig})
sha512sums=('b7aedcb07da0c81842929833ab93a0b20c08e465bf05ebb4e47670d295c0d4d0d50f0f74001d9264c2c23ef08d3881232e7622ecf101d1d53ffcae2f8c0f31d3'
            'SKIP')
b2sums=('72d0de6d12e07ec160f4c59c51f138e1220a1b8994bdab90f56dd715bf16b6f561836d184ec5d5077de3bc7bb5c6778ea2b7bcbf0b33230be662f2b729eac568'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

prepare() {
  cd $pkgname-$pkgver
  # copy custom waf scripts in place
  mkdir -pv tools
  touch __init__.py
  cp -av waflib/extras/autowaf.py tools/
  # remove vendored waflib
  rm -rf waflib
  # modify wscript to use current scripts
  sed -e 's/waflib.extras/tools/' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/" \
      -i wscript
}

build() {
  export LINKFLAGS="$LDFLAGS"

  cd $pkgname-$pkgver
  waf configure --prefix=/usr
  waf build -v
}

package() {
  depends+=(libasound.so libatk-1.0.so libdbus-1.so libfontconfig.so
  libfreetype.so libganv-1.so libgdk-x11-2.0.so libgio-2.0.so libglib-2.0.so
  libgobject-2.0.so libgtk-x11-2.0.so libharfbuzz.so libjack.so
  libpangoft2-1.0.so libpango-1.0.so libpangocairo-1.0.so)

  cd $pkgname-$pkgver
  waf install --destdir="$pkgdir"
  install -vDm 644 {AUTHORS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
