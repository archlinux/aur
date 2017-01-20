# Maintainer: archlinux.info:tdy

pkgname=frinika
pkgver=0.8.1
_pkgdate=-2016-11-21
pkgrel=1
pkgdesc="A free music workstation (sequencer, software synth, audio recording, etc.)"
arch=(i686 x86_64)
url=http://www.frinika.com
license=(GPL LGPL BSD custom)
depends=(java-runtime jack)
source=(https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver$_pkgdate.zip
        $pkgname.desktop
        $pkgname.sh)
noextract=($pkgname-$pkgver$_pkgdate.zip)
sha256sums=(379f11a29a042b0963d2070ea0100750a5357a5d45bf1117f1faa70e86150bbb
            6dff025123dddd899a3f424a675444b75950a45bebaa217ff6b3cfc7a1232ba7
            ff34c2db17dbc98b114721ff8c45669c59874344b4705094ef9b411c3f2c7e68)

package() {
  bsdtar -xf $pkgname-$pkgver$_pkgdate.zip -C "$pkgdir" \
    -s ":^$pkgname-$pkgver$_pkgdate:usr/share/java/$pkgname:"
  bsdtar -xf "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar -C "$pkgdir" \
    -s ":^icons:usr/share/pixmaps:" icons/$pkgname.png

  # launchers
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # libjack
  install -dm755 "$pkgdir"/usr/lib
  ln -sf libjack.so "$pkgdir"/usr/lib/libjack-0.100.0.so.0

  # docs
  cd "$pkgdir"/usr/share/java/$pkgname
  install -Dm644 README.TXT "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 lib/RasmusDSP_LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/RasmusDSP.txt
  install -Dm644 lib/flexdock_LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/flexdock.txt
  install -Dm644 lib/looks_LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/looks.txt
  install -Dm644 lib/toot_LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/toot.txt

  # cleanup
  msg2 "Cleaning up..."
  [[ $CARCH == x86_64 ]] && rm -rf lib/i386 || rm -rf lib/amd64
  rm -f LICENSE.md README.TXT lib/*.txt
  find . -type f -exec chmod 644 '{}' \;
  find . -type d -exec chmod 755 '{}' \;
  chown -R root:root .
}
