# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=starsector
pkgver=0.98a_RC5
pkgrel=1
pkgdesc='Starsector (formerly "Starfarer") is an in-development open-world single-player space-combat, roleplaying, exploration, and economic game.'
arch=('i686' 'x86_64')
url="http://fractalsoftworks.com/"
license=('custom')
depends=('openal'
         'bash'
         'desktop-file-utils'
         'java-environment=17')
replaces=('starfarer')
source=(https://f005.backblazeb2.com/file/fractalsoftworks/release/starsector_linux-${pkgver//_/-}.zip
        ${pkgname}.pdf::http://www.fractalsoftworks.com/starfarer/docs/StarfarerManual.pdf
        starsector.sh
        starsector.desktop)
sha256sums=('2c90233d7b2d831a54292428f0b8f2ff55d40b5e3a4c0fed9a5d92bfb57ddd43'
            '0d9a2382e1c15e3d471b88eb3770c68f5dd93edc81710e511fd892def9f2ab16'
            '975a4c39989b58298b7052c51491c677471f83ba56e6ea4e204fbca527e4f557'
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

  install -Dm644 *.jar "$pkgdir/usr/share/java/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 compiler_directives.txt "$pkgdir/usr/share/$pkgname/"

  if [[ "$CARCH" == x86_64 ]]; then
    install -Dm644 native/linux/*64.so "$pkgdir/usr/lib/$pkgname/"
  else
    install -Dm644 native/linux/*[!"64"].so "$pkgdir/usr/lib/$pkgname/"
  fi
  
  find data graphics sounds -type f -print0 | xargs -0 chmod 644
  cp -R data graphics sounds "$pkgdir/usr/share/$pkgname/"
}
