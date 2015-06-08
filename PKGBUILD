# Maintainer: trya <tryagainprod@gmail.com>

pkgname=kega-fusion
pkgver=3.63
pkgrel=16
pkgdesc="An emulator of classic Sega consoles, including SMS/GG, Genesis/Megadrive and add-ons"
url="http://www.carpeludum.com/kega-fusion"
license=('custom')
arch=('i686' 'x86_64')
if [ "$CARCH" == "x86_64" ]; then
  depends=('lib32-alsa-lib' 'lib32-glu' 'lib32-libsm' 'lib32-gtk2')
  optdepends=('lib32-gtk-engines: libclearlooks.so library'
              'lib32-alsa-plugins: for PulseAudio users')
else
  depends=('alsa-lib' 'glu' 'libsm' 'gtk2')
  optdepends=('gtk-engines: libclearlooks.so library')
fi
makedepends=('upx')
optdepends=('lib32-gtk-engines: libclearlooks.so library')
install="kega-fusion.install"
source=("http://www.carpeludum.com/download/Fusion363x.tar.gz"
        "http://trya.alwaysdata.net/linux/Plugins(Linux).tar.gz"
        "http://trya.alwaysdata.net/linux/libmpg123.so.0.11.4.gz"
        "http://trya.alwaysdata.net/linux/icons/kega-fusion.png"
        kega-fusion.sh kega-fusion.desktop Fusion.ini)
md5sums=('9a6f93c2f3bd48ef09a9170e7f0512f4'
         '6121a37c42026da032386d9d5a5e9c42'
         '6e9516000e527e025ad9de0b15573a87'
         '1fdaacf18fb2965fb6f64a769037056b'
         'dfe05fd67cc555767b76031885844d9a'
         '5ecf6ba3ef1eff460ee659ef7b6e78db'
         '6d744c098bdf2085fe144ffd2794fe6d')
options=(!strip)

package() {
  cd "$srcdir"

  # plugins
  install -d "$pkgdir/usr/lib/kega-fusion/plugins"
  install -m644 Plugins/*.rpi "$pkgdir/usr/lib/kega-fusion/plugins"
  install -m644 libmpg123.so.0.11.4 "$pkgdir/usr/lib/kega-fusion"
  
  # default configuration and documentation
  install -Dm644 Fusion.ini "$pkgdir/usr/share/kega-fusion/Fusion.ini"
  install -d "$pkgdir/usr/share/doc/kega-fusion"
  install -m644 Fusion/*.txt "$pkgdir/usr/share/doc/kega-fusion"
  
  # startup script and executable
  install -Dm755 kega-fusion.sh "$pkgdir/usr/bin/kega-fusion"
  upx -d "$srcdir/Fusion/Fusion"
  install -Dm755 Fusion/Fusion "$pkgdir/usr/lib/kega-fusion/kega-fusion"
  
  # desktop icon
  install -Dm644 kega-fusion.desktop "$pkgdir/usr/share/applications/kega-fusion.desktop"
  install -Dm644 kega-fusion.png "$pkgdir/usr/share/pixmaps/kega-fusion.png"
}
