# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=setbfree
pkgname="${_pkgname}-git"
pkgver=0.8.7.r748.ad04112
pkgrel=1
pkgdesc="A DSP tonewheel organ emulator"
arch=('i686' 'x86_64')
url="http://setbfree.org/"
license=('GPL')
depends=('alsa-lib' 'ftgl' 'hicolor-icon-theme' 'jack' 'liblo' 'lv2' 'pango'
         'ttf-bitstream-vera' 'xorg-xmessage')
makedepends=('libicns')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("$_pkgname::git+https://github.com/pantherb/setBfree.git"
        'setbfree.desktop'
        'x42-whirl.desktop')
md5sums=('SKIP'
         '5c28e2aeea63e9274394ac2b23ccb43d'
         '3b263ac1f57d04e7d4a46c72ac18b905')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver="$(grep EXPORTED_VERSION= Makefile | cut -f 2 -d =)"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make \
    PREFIX="/usr" \
    INSTALL_EXTRA_LV2=yes \
    ENABLE_ALSA=yes \
    OVERDRIVEJACK=yes \
    FONTFILE=/usr/share/fonts/TTF/VeraBd.ttf

  icns2png -x -o img img/setBfree.icns
  icns2png -x -o img img/x42-whirl.icns
}

package() {
  cd "${srcdir}/${_pkgname}"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    INSTALL_EXTRA_LV2=yes \
    ENABLE_ALSA=yes \
    OVERDRIVEJACK=yes \
    FONTFILE=/usr/share/fonts/TTF/VeraBd.ttf \
    install

  # desktop files
  install -Dm644 "${srcdir}/setbfree.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "${srcdir}/x42-whirl.desktop" -t "$pkgdir/usr/share/applications"

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

  # man pages
  install -Dm644 doc/*.1 -t "$pkgdir/usr/share/man/man1"

  # docs
  install -Dm644 AUTHORS ChangeLog README.md doc/*.png cfg/KB3X42_1.K25 \
    -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
