# Maintainer: trya <tryagainprod@gmail.com>

pkgname=kega-fusion
pkgver=3.63
pkgrel=17
pkgdesc="An emulator of classic Sega consoles, including SMS/GG, Genesis/Megadrive and add-ons"
url="http://www.carpeludum.com/kega-fusion"
license=('custom')
arch=('i686' 'x86_64')
depends=('alsa-lib' 'glu' 'libsm' 'gtk2' 'mpg123')
optdepends=('gtk-engines: libclearlooks.so library')
makedepends=('upx')
depends_x86_64=('lib32-alsa-lib' 'lib32-glu' 'lib32-libsm' 'lib32-gtk2' 'lib32-mpg123')
optdepends_x86_64=('lib32-gtk-engines: libclearlooks.so library'
                   'lib32-alsa-plugins: for PulseAudio users')
install="kega-fusion.install"
source=("http://www.carpeludum.com/download/Fusion363x.tar.gz"
        "http://www.carpeludum.com/download/PluginsLinux.tar.gz"
        "http://trya.alwaysdata.net/linux/icons/kega-fusion.png"
        kega-fusion.sh kega-fusion.desktop Fusion.ini)
md5sums=('9a6f93c2f3bd48ef09a9170e7f0512f4'
         '6121a37c42026da032386d9d5a5e9c42'
         '1fdaacf18fb2965fb6f64a769037056b'
         '130ce3ac8bd1993a32be20c051ffc779'
         '5ecf6ba3ef1eff460ee659ef7b6e78db'
         '30396e603a6996e8f20a6be32430b6f6')
options=(!strip)

package() {
  cd "$srcdir"

  # plugins
  install -d "$pkgdir/usr/lib/kega-fusion/plugins"
  install -m644 Plugins/*.rpi "$pkgdir/usr/lib/kega-fusion/plugins"
  if [ "$CARCH" == "x86_64" ]; then
    ln -s /usr/lib32/libmpg123.so.0 "$pkgdir/usr/lib/kega-fusion"  
  else
    ln -s /usr/lib/libmpg123.so.0 "$pkgdir/usr/lib/kega-fusion" 
  fi
  
  # default configuration and documentation
  install -Dm644 Fusion.ini "$pkgdir/usr/share/kega-fusion/Fusion.ini"
  install -d "$pkgdir/usr/share/doc/kega-fusion"
  install -m644 Fusion/*.txt "$pkgdir/usr/share/doc/kega-fusion"
  
  # startup script and executable
  install -Dm755 kega-fusion.sh "$pkgdir/usr/bin/kega-fusion"
  upx -d "$srcdir/Fusion/Fusion"
  install -Dm755 Fusion/Fusion "$pkgdir/usr/lib/kega-fusion"
  
  # desktop icon
  install -Dm644 kega-fusion.desktop "$pkgdir/usr/share/applications/kega-fusion.desktop"
  install -Dm644 kega-fusion.png "$pkgdir/usr/share/pixmaps/kega-fusion.png"
}
