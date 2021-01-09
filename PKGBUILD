# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.4
pkgrel=1
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=('x86_64')
url="https://drobilla.net/software/patchage"
license=('GPL3')
depends=('atkmm' 'cairo' 'cairomm' 'dbus-glib' 'gcc-libs' 'gdk-pixbuf2' 'glibc'
'libsigc++' 'pangomm')
makedepends=('alsa-lib' 'atk' 'boost' 'dbus' 'fontconfig' 'freetype2' 'ganv'
'glib2' 'gtk2' 'harfbuzz' 'jack' 'pango' 'waf')
source=("https://download.drobilla.net/$pkgname-$pkgver.tar.bz2"{,.asc})
sha512sums=('665d81ca16c1052f71c3037d2ad8f9a6120b09a323999468484dda1b4c4b567c36728ebe38c54152406b63a4107f04764d0dede52302bc7a7b124e82132749fb'
            'SKIP')
b2sums=('3e56b7513e19e0acb1ef524ba7d7754699abdb6a968547f7a545c8651f23a33c209b9728dae01d839022ec380185a1673ff58733c1553007a6a3b7c889aa7f03'
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
  depends+=('libasound.so' 'libatk-1.0.so' 'libdbus-1.so' 'libfontconfig.so'
  'libfreetype.so' 'libganv-1.so' 'libgdk-x11-2.0.so' 'libgio-2.0.so'
  'libglib-2.0.so' 'libgobject-2.0.so' 'libgtk-x11-2.0.so' 'libharfbuzz.so'
  'libjack.so' 'libpangoft2-1.0.so' 'libpango-1.0.so' 'libpangocairo-1.0.so')
  cd "${pkgname}-${pkgver}"
  waf install --destdir="${pkgdir}"
  install -vDm 644 {AUTHORS,NEWS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
