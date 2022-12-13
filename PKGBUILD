# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=starsector
pkgver=0.95.1a_RC6
pkgrel=3
pkgdesc='Starsector (formerly "Starfarer") is an in-development open-world single-player space-combat, roleplaying, exploration, and economic game.'
arch=('i686' 'x86_64')
url="http://fractalsoftworks.com/"
license=('custom')
depends=('openal' 'bash' 'desktop-file-utils')
replaces=('starfarer')
source=(http://s3.amazonaws.com/fractalsoftworks/starsector/starsector_linux-${pkgver//_/-}.zip
        ${pkgname}.pdf::http://www.fractalsoftworks.com/starfarer/docs/StarfarerManual.pdf
        starsector.sh
        starsector.desktop)
sha256sums=('3da88bd5198a1c35ab557ff11973c4e6fa243c13936a1faf1a3867d78ffefd93'
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
