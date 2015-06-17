# Maintainer: Christopher Arndt <chris@chrisarndt.de>

_pkgname=setbfree
pkgname="${_pkgname}-git"
pkgver=0.8.0.8.g90e925d
pkgrel=1
pkgdesc="A DSP Tonewheel Organ emulator"
arch=('i686' 'x86_64')
url="http://setbfree.org/"
license=('GPL')
depends=('ftgl' 'desktop-file-utils' 'pango' 'ttf-bitstream-vera')
makedepends=('lv2')
conflicts="${_pkgname}"
provides="${_pkgname}"
install="$_pkgname.install"
source=("$_pkgname::git+https://github.com/pantherb/setBfree.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags | sed -r 's/^v//;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="/usr" ENABLE_ALSA=yes
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX=/usr DESTDIR="$pkgdir/" ENABLE_ALSA=yes \
    FONTFILE=/usr/share/fonts/TTF/VeraBd.ttf install

  # desktop file
  install -Dm644 "debian/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # icon
  install -Dm644 doc/setBfree.png "$pkgdir/usr/share/icons/setBfree.png"

  # man
  install -d "$pkgdir/usr/share/man/man1"
  install -Dm644 doc/*.1 "$pkgdir/usr/share/man/man1"

  # docs
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 AUTHORS ChangeLog README.md doc/*.png \
    "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
