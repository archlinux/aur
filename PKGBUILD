# Maintainer: M0Rf30
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Original PKGBUILD by Sean Streeter <anubis2591 at gmail dot com>
pkgname=skulltag
pkgver=098d
pkgrel=4
pkgdesc="Closed source OpenGL ZDoom port with Client/Server multiplayer."
arch=('i686' 'x86_64')
url="http://skulltag.net/"
license=('closed')
depends=('sdl' 'gtk2' 'libjpeg6')
optdepends=('timidity++: midi support'
            'freedoom: free IWAD')
install=skulltag.install

case "$CARCH" in
  i686)
    source=("http://skulltag.com/download/files/release/st-v${pkgver}_linux-base.tar.bz2"
            "http://skulltag.com/download/files/release/st-v${pkgver}_linux-x86.tar.bz2"
            "http://www.fmod.org/download/fmodex/api/Linux/fmodapi42416linux.tar.gz")
    md5sums=('afe482e04ce3f51c94915e07c3aff3b0'
             'faa005fc5b44da424d87d6a17eaafccb'
             '00b157e8d09d539b0a7023c48b71422a')
    ;;
  x86_64)
    source=("http://skulltag.com/download/files/release/st-v${pkgver}_linux-base.tar.bz2"
           "http://skulltag.com/download/files/release/st-v${pkgver}_linux-x86_64.tar.bz2"
           "http://www.fmod.org/download/fmodex/api/Linux/fmodapi42416linux64.tar.gz")
    depends=(${depends[@]} libpng12)
    md5sums=('afe482e04ce3f51c94915e07c3aff3b0'
             '46e677cc851698ac101d42b6140b6047'
             '70b2a6a2618ee9823ab564b4e945c885')
    ;;
esac

package() {
  cd $srcdir

cat > skulltag.sh << EOF
#!/bin/sh
export LD_LIBRARY_PATH=/usr/share/skulltag/lib
exec /usr/share/skulltag/skulltag "\$@"
EOF

cat > skulltag-server.sh << EOF
#!/bin/sh
export LD_LIBRARY_PATH=/usr/share/skulltag/lib
exec /usr/share/skulltag/skulltag-server "\$@"
EOF

  install -Dm644 "announcer/Skulltag_98a_announcer.pk3" "$pkgdir/usr/share/skulltag/announcer/Skulltag_98a_announcer.pk3"
  for fn in skins/*; do
    install -Dm644 "$fn" "$pkgdir/usr/share/skulltag/$fn"
  done
  install -Dm644 "Skulltag Version History.txt" "$pkgdir/usr/share/skulltag/Skulltag Version History.txt"
  install -Dm644 "skulltag_data.pk3" "$pkgdir/usr/share/skulltag/skulltag_data.pk3"
  install -Dm644 "skulltag.pk3" "$pkgdir/usr/share/skulltag/skulltag.pk3"
  install -Dm755 "liboutput_sdl.so" "$pkgdir/usr/share/skulltag/lib/liboutput_sdl.so"
  install -Dm755 "libsnes_spc.so" "$pkgdir/usr/share/skulltag/lib/libsnes_spc.so"
  install -Dm755 "skulltag" "$pkgdir/usr/share/skulltag/skulltag"
  install -Dm755 "skulltag-server" "$pkgdir/usr/share/skulltag/skulltag-server"
  install -Dm755 "skulltag.sh" "$pkgdir/usr/bin/skulltag"
  install -Dm755 "skulltag-server.sh" "$pkgdir/usr/bin/skulltag-server"

  case "$CARCH" in
	  i686)
		  install -Dm755 "fmodapi42416linux/api/lib/libfmodex-4.24.16.so" "$pkgdir/usr/share/skulltag/lib/libfmodex-4.24.16.so"
		  ;;
	  x86_64)
		  install -Dm755 "fmodapi42416linux64/api/lib/libfmodex64-4.24.16.so" "$pkgdir/usr/share/skulltag/lib/libfmodex64-4.24.16.so"
		  ;;
  esac
}

# vim:set ts=2 sw=2 et:
