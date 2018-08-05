# Maintainer: Johannes Maibaum <jmaibaum at gmail dot com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=setBfree
pkgname=${_pkgname,,}
pkgver=0.8.7
pkgrel=2
pkgdesc="A DSP tonewheel organ emulator"
arch=('i686' 'x86_64')
url='http://setbfree.org/'
license=('GPL')
depends=('alsa-lib' 'ftgl' 'jack' 'liblo' 'pango' 'ttf-bitstream-vera')
makedepends=('lv2')
CFLAGS+=' -DNDEBUG'  # Fix 'WARNING: Package contains reference to $srcdir'
conflicts=("${pkgname}-git")
_github_root="https://github.com/pantherb/${_pkgname}"
_desktop_file_commit='ff15bf2fdb85120c5125deb5debdcabb3969c6a4'
source=("${_github_root}/archive/v${pkgver}.zip"
        "${_github_root}/raw/${_desktop_file_commit}/debian/setbfree.desktop"
        "${_github_root}/raw/${_desktop_file_commit}/debian/x42-whirl.desktop")
sha256sums=('9b6a63e5ae98c89949fe3c1ad5103f74bcf7ce458f6bfa5ac8b6d94801fbaf0f'
            '02a683af4be25454094bd38cdbc1b50359b19925602650900a47b78498eb0c32'
            'ad7f3a98c3944d963d8368177b15fae78f9f27c3e702d42acd44211b011caebe')
_font=$(fc-list 'Bitstream Vera Sans:style=Bold')
font_file=${_font%%:*}

build() {
  cd "${_pkgname}-${pkgver}"
  make ENABLE_ALSA=yes FONTFILE=${font_file} PREFIX=/usr 
}

package() {
  cd "${_pkgname}-${pkgver}"

  make install ENABLE_ALSA=yes FONTFILE=${font_file} PREFIX=/usr \
    DESTDIR=${pkgdir}

  # desktop files
  install -Dm644 -t ${pkgdir}/usr/share/applications \
    ${srcdir}/*.desktop

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
