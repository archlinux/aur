pkgname=fossamail-git
pkgver=25.2.0_Release.3.g96a0103
pkgrel=1
pkgdesc="Open Source, Mozilla Thunderbird-based mail, news and chat client based on the Pale Moon browser core."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
makedepends=('git' 'python2' 'autoconf2.13' 'gcc47' 'unzip' 'zip' 'yasm' 'gstreamer0.10' 'gstreamer0.10-base-plugins')
provides=("fossamail=$pkgver")
conflicts=('fossamail' 'fossamail-bin')
install=fossamail.install
source=(fossamail.desktop
        mozconfig.txt
        git+"https://github.com/MoonchildProductions/FossaMail.git")
sha1sums=('6d19278e2af83290c83cc063b6447476b5f58fd8'
          'f2b5a4434e1b17b23969113cf1172e6c851d6deb'
          'SKIP')

pkgver() {
  cd FossaMail
  git describe --long | sed 's/-/./g'
}

prepare() {
  cd FossaMail
  git submodule update --init
  chmod -R +x *
  cd ..
  cp mozconfig.txt FossaMail/.mozconfig
  if [[ -d "$srcdir/fmbuild" ]]; then
    rm -rf "$srcdir/fmbuild"
  fi
  mkdir "$srcdir/fmbuild"
}

build() {
  cd FossaMail
  export CPPFLAGS="$CPPFLAGS -O2"
  export MOZ_OBJDIR="$srcdir/fmbuild"
  make -f client.mk build
}

package() {
  cd "$srcdir/fmbuild"
  make package
  cd mozilla/dist
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r FossaMail/ "$pkgdir/usr/lib/fossamail"
  ln -s ../lib/fossamail/FossaMail "$pkgdir/usr/bin/fossamail"
  install -Dm644 "$srcdir/fossamail.desktop" "$pkgdir/usr/share/applications/fossamail.desktop"

  # icons
  install -Dm644 FossaMail/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default22.png \
    "$pkgdir/usr/share/icons/hicolor/22x22/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default24.png \
    "$pkgdir/usr/share/icons/hicolor/24x24/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/fossamail.png"
  install -Dm644 FossaMail/chrome/icons/default/default256.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/fossamail.png"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf fossamail "$pkgdir/usr/lib/fossamail/FossaMail-bin"
}
