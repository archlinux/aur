# Maintainer: Jonian Guveli <jonian@hardpixel.eu>
# Contributor: Jan Magnus Brevik <janmbrevik@gmail.com>
# Contributor: Rubén Fdes Moreira <tmp-meteque@openmailbox.com>
# Contributor: Sigmund Vestergaard <sigmundv@gmail.com>
# Contributor: MacCyber <jonas.enge@gmail.com>
# Contributor: Doug Newgard <scimmia22@outlook.com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Antti Hautaniemi <an7oine@me.com>

_ubuntuver=18.04
pkgname=acestream-engine
pkgver=3.1.74
pkgrel=1
pkgdesc="Ace Stream engine"
arch=("x86_64")
url="https://acestream.org"
license=("custom")
depends=(
  net-tools
  python2-apsw
  python2-requests
  python2-setuptools
)
optdepends=(
  "pygtk: GTK+ gui support"
  "python2-libappindicator: GTK+ gui support"
)
backup=("usr/lib/$pkgname/acestream.conf")
install="$pkgname.install"
source=(
  "$pkgname-$pkgver.tar.gz::https://download.acestream.media/linux/acestream_${pkgver}_ubuntu_${_ubuntuver}_x86_64.tar.gz"
  "$pkgname.desktop"
  "$pkgname.service"
  "LICENSE"
)
sha256sums=('87db34c1aedc55649a8f8f5f4b6794581510701fc7ffbd47aaec0e9a2de2b219'
            '930ba23b7d94487d51c2b43203922467ae254981d00992337ab9a057c5e0f804'
            'a0b657b00e8cedc69d24d28591c478d5b4c3443ed1a2796f3c606ae6635cbd89'
            'da210a9270403957864ec5c77b727bdd6d7186035af6b38c1cc74e2c6f193585')

_libsymlinks() {
  ln -sf "/usr/lib/$pkgname/lib/lib$1.so.$2.$3" "$pkgdir/usr/lib/$pkgname/lib/lib$1.so"
  ln -sf "/usr/lib/$pkgname/lib/lib$1.so.$2.$3" "$pkgdir/usr/lib/$pkgname/lib/lib$1.so.$2"
}

package() {
  sed -i "/ROOT=/c\ROOT=\/usr/lib\/${pkgname}" "start-engine"

  install -Dm755 "start-engine"                "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "acestream.conf"              "$pkgdir/usr/lib/$pkgname/acestream.conf"
  install -Dm755 "acestreamengine"             "$pkgdir/usr/lib/$pkgname/acestreamengine"
  cp -a "data"                                 "$pkgdir/usr/lib/$pkgname/"
  cp -a "lib"                                  "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 "data/images/streamer-32.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "LICENSE"          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/acestreamengine"

  _libsymlinks "avcodec"   "58" "100.100"
  _libsymlinks "avdevice"  "58" "11.101"
  _libsymlinks "avfilter"   "7" "87.100"
  _libsymlinks "avformat"  "58" "51.100"
  _libsymlinks "avutil"    "56" "58.100"
  _libsymlinks "fdk-aac"    "2" "0.1"
  _libsymlinks "mp3lame"    "0" "0.0"
  _libsymlinks "swresample" "3" "8.100"
  _libsymlinks "swscale"    "5" "8.100"

  ln -sf "/usr/lib/$pkgname/lib/libx264.so.148" "$pkgdir/usr/lib/$pkgname/lib/libx264.so"

  # acestream user
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u acestream - "systemd Ace Stream Service"
END

  # acestream service directory
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf" <<END
d /var/lib/ACEStream 0755 acestream acestream -
END
}
