# Maintainer: Johannes Maibaum <jmaibaum at gmail dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=setBfree
pkgname=${_pkgname,,}
pkgver=0.8.4
pkgrel=2
pkgdesc="A DSP tonewheel organ emulator"
arch=('i686' 'x86_64')
url="http://setbfree.org/"
license=('GPL')
depends=('ftgl' 'jack' 'liblo' 'pango' 'ttf-bitstream-vera')
makedepends=('lv2')
conflicts=("${pkgname}-git")
source=("$pkgname::git+https://github.com/pantherb/${_pkgname}#tag=v${pkgver}")
sha256sums=('SKIP')
_font=$(fc-list "Bitstream Vera Sans:style=Bold")
font_file=${_font%%:*}

build() {
  cd $pkgname
  make ENABLE_ALSA=yes FONTFILE=${font_file} PREFIX=/usr 
}

package() {
  cd $pkgname

  make install ENABLE_ALSA=yes FONTFILE=${font_file} PREFIX=/usr \
    DESTDIR=${pkgdir}

  # desktop files
  install -Dm644 -t ${pkgdir}/usr/share/applications \
    debian/*.desktop

  # icons
  install -Dm644 -t ${pkgdir}/usr/share/pixmaps \
    doc/${_pkgname}.png doc/x42-whirl.png

  # man
  install -Dm644 -t ${pkgdir}/usr/share/man/man1 doc/*.1

  # docs
  install -Dm644 -t ${pkgdir}/usr/share/doc/${pkgname} \
    AUTHORS ChangeLog README.md doc/*.png cfg/KB3X42_1.K25
}

# vim:set ts=2 sw=2 et:
