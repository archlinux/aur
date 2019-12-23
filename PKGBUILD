# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.0
pkgrel=6
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=('x86_64')
url="https://drobilla.net/software/patchage"
license=('GPL3')
depends=('alsa-lib' 'atk' 'atkmm' 'cairo' 'cairomm' 'dbus' 'dbus-glib'
'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'glib2' 'gtk2' 'harfbuzz'
'libfreetype.so' 'libganv-1.so' 'libjack.so' 'libsigc++' 'pango' 'pangomm')
makedepends=('boost' 'waf')
source=("https://download.drobilla.net/$pkgname-$pkgver.tar.bz2"{,.sig}
        "wscript::https://git.drobilla.net/cgit.cgi/patchage.git/plain/wscript?id=23e58365cede1117676b74d855d046f90c28accb"
        "autowaf.py::https://git.drobilla.net/cgit.cgi/autowaf/plain/extras/autowaf.py?id=de76b89dc1039e2f7d6c6b229a8950156b0e5c9")
sha512sums=('0a2be0183257a34a68ec84e6fb17d29a3d8ba7dd54a05fcdd13784ac8f5621eb7a376f17d42168958f5e1a8dab8858a9c5c8c867aa1838736cc2b7775f75f510'
            'SKIP'
            '9bc2e288ee99b01b04f67b6668b5a1c386c47059e6223b96612980b4a9ec0cb801063e65f0fb3ad1f43689f925bb2123da1e18b7cfa2f5c5ef11cc38915606c0'
            '2e1424d35520f18fa7a7a0c4e30e6b742f723b87aa2ddc109917d353f83b436f3e7da2ea3af7aca64827dafb56caa9c1a64035884905d6b0f6d4bba3ef31f27b')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

prepare() {
  cd "${pkgname}-${pkgver}"
  # copy more current versions of custom waf scripts in place
  mkdir -pv tools
  cp -av ../autowaf.py tools/
  touch __init__.py
  # copy more current version of wscript in place
  cp -av ../wscript .
  # modify wscript to use current scripts and fix version
  sed -e 's/waflib.extras/tools/' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/" \
      -i wscript
  sed -E "s|(PATCHAGE_VERSION       =) .+|\1 '${pkgver}'|" -i wscript
  # set correct ganv version dependency
  sed -e 's/1.5.2/1.4.2/g' -i wscript
}

build() {
  cd "${pkgname}-${pkgver}"
  waf configure --prefix=/usr
  waf build
}

package() {
  cd "${pkgname}-${pkgver}"
  waf install --destdir="${pkgdir}"
  install -vDm 644 {AUTHORS,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
