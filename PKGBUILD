# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=setbfree
pkgname="${_pkgname}-git"
pkgver=0.8.7.r740.ff15bf2
pkgrel=1
pkgdesc="A DSP tonewheel organ emulator"
arch=('i686' 'x86_64')
url="http://setbfree.org/"
license=('GPL')
depends=('alsa-lib' 'ftgl' 'hicolor-icon-theme' 'jack' 'pango' 'ttf-bitstream-vera')
makedepends=('libicns' 'lv2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/pantherb/setBfree.git"
        'x42-whirl.desktop')
md5sums=('SKIP'
         '3b263ac1f57d04e7d4a46c72ac18b905')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver="$(grep EXPORTED_VERSION= Makefile | cut -f 2 -d =)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX="/usr" ENABLE_ALSA=yes
  icns2png -x -o img img/setBfree.icns
  icns2png -x -o img img/x42-whirl.icns
}

package() {
  cd "${srcdir}/${_pkgname}"

  make PREFIX=/usr DESTDIR="$pkgdir" ENABLE_ALSA=yes \
    FONTFILE=/usr/share/fonts/TTF/VeraBd.ttf install

  # desktop file
  install -d -m755 "$pkgdir/usr/share/applications"
  install -Dm644 "debian/setbfree.desktop" "$pkgdir/usr/share/applications"
  install -Dm644 "${srcdir}/x42-whirl.desktop" "$pkgdir/usr/share/applications"

  # icons
  for size in '32x32' '128x128' '256x256'; do
    install -d -m755 "$pkgdir/usr/share/icons/hicolor/$size/apps"
    for app in 'setBfree' 'x42-whirl'; do
      icon="img/${app}_${size}x32.png"
      if [ -e "$icon" ]; then
        install -m644 "$icon" \
          "$pkgdir/usr/share/icons/hicolor/$size/apps/$app.png"
      fi
    done
  done

  # man
  install -d -m755 "$pkgdir/usr/share/man/man1"
  install -m644 doc/*.1 "$pkgdir/usr/share/man/man1"

  # docs
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 AUTHORS ChangeLog README.md doc/*.png cfg/KB3X42_1.K25 \
    "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
