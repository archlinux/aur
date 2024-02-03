# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=starsector
pkgver=0.97a_RC6
pkgrel=2
pkgdesc='Starsector (formerly "Starfarer") is an in-development open-world single-player space-combat, roleplaying, exploration, and economic game.'
arch=('i686' 'x86_64')
url="http://fractalsoftworks.com/"
license=('custom')
depends=('openal' 'bash' 'desktop-file-utils')
replaces=('starfarer')
source=(https://f005.backblazeb2.com/file/fractalsoftworks/release/starsector_linux-${pkgver//_/-}.zip
        ${pkgname}.pdf::http://www.fractalsoftworks.com/starfarer/docs/StarfarerManual.pdf
        starsector.sh
        starsector.desktop)
sha256sums=('8ce460c85e646bba283f1a5ec082ee9616e9d36aa9e6c3c95ccf98e57797b2ce'
            '0d9a2382e1c15e3d471b88eb3770c68f5dd93edc81710e511fd892def9f2ab16'
            'bc8a222251be2d10ad7576b2909b49a9bed8d8adcdc6e915dc80eb0bc4a0db01'
            'becc92483d9599672b75d8b00216a64dd8fda38cfcfccd8e735238aa0ce6d8b6')
package() {
  install -d "$pkgdir/usr/share/$pkgname" \
    "$pkgdir/usr/share/doc/$pkgname" \
    "$pkgdir/usr/share/applications" \
    "$pkgdir/usr/share/java/$pkgname" \
    "$pkgdir/usr/lib/$pkgname"

  cd "$srcdir"
  install -Dm644 "${pkgname}.pdf" "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications"

  cd "$srcdir/$pkgname"

  cd jre_linux
  find -type f -exec install -D "{}" "$pkgdir/usr/lib/$pkgname/jre/{}" \;
  cd ..

  install -Dm644 *.jar "$pkgdir/usr/share/java/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  if [[ "$CARCH" == x86_64 ]]; then
    install -Dm644 native/linux/*64.so "$pkgdir/usr/lib/$pkgname/"
  else
    install -Dm644 native/linux/*[!"64"].so "$pkgdir/usr/lib/$pkgname/"
  fi
  
  find data graphics sounds -type f -print0 | xargs -0 chmod 644
  cp -R data graphics sounds "$pkgdir/usr/share/$pkgname/"
}
