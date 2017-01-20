# Maintainer: archlinux.info:tdy

pkgname=raptor-chess
pkgver=1.0
pkgrel=1
pkgdesc="A chess GUI for freechess.org (aka FICS)"
arch=(x86_64)
url=https://raptor-fics-interface.github.io/Raptor
license=(BSD)
depends=(gtk2)
source=(https://github.com/Raptor-Fics-Interface/Raptor/releases/download/v$pkgver/Raptor_v${pkgver}_Linux_x86_64_GTK2.zip
        $pkgname.desktop
        $pkgname.sh)
noextract=(Raptor_v${pkgver}_Linux_x86_64_GTK2.zip)
sha256sums=(f16dbd757c4edec9d78fbfa6581c4d914aa546361fc253a4e0c19bd47281f9b0
            09499c5cf036eea9e709f85dd5b792831519243ed12bab1e02ad4c2ce5e281af
            d3e693654722f8e588b1ca598bdb327d3ac6f6f4cde25ad22fcbc8ff82f42f65)

package() {
  bsdtar -xf Raptor_v${pkgver}_Linux_x86_64_GTK2.zip -C "$pkgdir" \
    -s ":Raptor_v$pkgver:usr/share/java/$pkgname:"

  # launchers
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  ln -sf $pkgname "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # docs
  install -Dm644 "$pkgdir"/usr/share/java/$pkgname/bsd-new-license.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # cleanup
  cd "$pkgdir"/usr/share/java/$pkgname
  rm -f bsd-new-license.*
  chown -R root:root "$pkgdir"/usr/share/java/$pkgname

  msg "Sanitizing \$pkgdir/usr/share/$pkgname..."
  find -not -path './resources/set/*' -exec sh -c \
    "file '{}' | grep -qE 'executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;

  # only looped to give feedback because it takes such a long time
  _i=1
  for _set in resources/set/*; do
    msg2 "[$_i/58] $_set..."
    find "$_set" -exec sh -c \
      "file '{}' | grep -qE 'executable|directory' && chmod 755 '{}' || chmod 644 '{}'" \;
    _i=$((_i+1))
  done
}
