# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
pkgname=unix-runescape-client
pkgver=4.0.0
pkgrel=1
pkgdesc="RuneScape client for Linux and Unix"
arch=(any)
url="http://hkprojects.weebly.com/runescape-client-for-linux-and-unix.html"
license=(GPL2)
depends=('java-runtime' 'perl' 'xterm' 'p7zip')
optdepends=(
  'zenity: better UI'
  'perl-wx: for rsu-settings'
  'wine: for "compatibility mode" fix'
  'alsa-oss: for "force alsa" fix'
  'pulseaudio: for "force pulseaudio" fix'
)
conflicts=('runescape-client-bin')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/HikariKnight/rsu-client/tarball/v$pkgver")

package() {
  local _instdir="$pkgdir"/opt/runescape
  local _hash=$(tar -tf "$srcdir"/$pkgname-$pkgver.tar.gz | head -1 | sed 's:HikariKnight-rsu-client-\([0-9a-fA-F]*\)/:\1:g')

  cd "$srcdir/HikariKnight-rsu-client-$_hash/runescape"

  mkdir -p "$_instdir" "$pkgdir"/usr/{bin,share/applications}

  # copy the stuff
  cp -t "$_instdir" *.txt runescape updater rsu-settings AUTHORS
  cp -Rt "$_instdir" share rsu
  cp -Rt "$pkgdir"/usr/bin templates/packaging/usr/games/*
  cp -Rt "$pkgdir"/usr templates/packaging/usr/share

  # typo fix - applied upstream in following commits:
  # d2ef369f74a671667732af6d742bc63dfc8bf0e9
  # e169b1c5f4bb9380ca7bdd3f55cd6aafb7bc714f
  # 525b8b693388a65642976c6fb0ac65da29816c7c
  sed -e 's/sciptname/scriptname/g' -i "$pkgdir"/usr/bin/{runescape,rsu-settings,update-runescape-client}
}

md5sums=('39436913d5e85e6e7c5ee62daab1411d')
