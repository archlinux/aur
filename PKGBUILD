# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.2
pkgrel=1
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=('x86_64')
url="https://drobilla.net/software/patchage"
license=('GPL3')
depends=('atkmm' 'cairo' 'cairomm' 'dbus-glib' 'fontconfig' 'gcc-libs'
'gdk-pixbuf2' 'glibc' 'harfbuzz' 'libsigc++' 'pangomm')
makedepends=('alsa-lib' 'atk' 'boost' 'dbus' 'freetype2' 'ganv' 'glib2' 'gtk2'
'jack' 'pango' 'waf')
source=("https://download.drobilla.net/$pkgname-$pkgver.tar.bz2"{,.sig})
sha512sums=('8d59bf4a71c2b41a1c9d8f72da30046568573c6cedaca69815b279fd1c24d44267da6846e219449d47f43157663abc331ef89f241d94dd16e666e06da9f81e12'
            'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

prepare() {
  cd "${pkgname}-${pkgver}"
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
  cd "${pkgname}-${pkgver}"
  waf configure --prefix=/usr
  waf build -v
}

package() {
  depends+=('libasound.so' 'libatk-1.0.so' 'libdbus-1.so' 'libfreetype.so'
  'libganv-1.so' 'libgdk-x11-2.0.so' 'libgio-2.0.so' 'libglib-2.0.so'
  'libgobject-2.0.so' 'libgtk-x11-2.0.so' 'libjack.so' 'libpangoft2-1.0.so'
  'libpango-1.0.so' 'libpangocairo-1.0.so')
  cd "${pkgname}-${pkgver}"
  waf install --destdir="${pkgdir}"
  install -vDm 644 {AUTHORS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
