# Maintainer: Serph91P <aur+m3u-tv-bin@users.noreply.github.com>
# Generated-maintenance note: scripts/aur_update.py updates pkgver, source and sha256sums.

pkgname='m3u-tv-bin'
pkgver=1.0.4
pkgrel=1
pkgdesc='Cross-platform TV front-end player for the M3U Editor app'
arch=('x86_64')
url='https://github.com/m3ue/m3u-tv'
license=('custom')
depends=(
  'gtk3'
  'hicolor-icon-theme'
  'libepoxy'
  'libsecret'
  'mpv'
)
provides=('m3u-tv')
conflicts=('m3u-tv')
options=('!strip')

source=('m3u-tv-1.0.4-linux.tar.gz::https://github.com/m3ue/m3u-tv/releases/download/v1.0.4/m3u-tv-v1.0.4-linux.tar.gz')
sha256sums=('f5917758d322652250d3a4bb50f0ebbc0e3cbdd1fd03f65fa12693b2866cd788')

package() {
  install -dm755 "$pkgdir/opt/m3u-tv"
  cp -a "$srcdir/m3u_tv" "$srcdir/lib" "$srcdir/data" "$pkgdir/opt/m3u-tv/"
  rm -f "$pkgdir/opt/m3u-tv/lib/libdartjni.so"
  chmod 755 "$pkgdir/opt/m3u-tv/m3u_tv"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/m3u-tv" << 'END'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/m3u-tv/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
cd /opt/m3u-tv
exec ./m3u_tv "$@"
END

  install -Dm644 "$srcdir/data/flutter_assets/assets/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/m3u-tv.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/m3u-tv.desktop" << END
[Desktop Entry]
Type=Application
Name=m3u-tv
Comment=$pkgdesc
Exec=m3u-tv
Icon=m3u-tv
Terminal=false
Categories=AudioVideo;Video;Player;TV;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
