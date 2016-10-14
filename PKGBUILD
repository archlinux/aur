# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=nethack4
pkgver=4.3.0.beta2
_pkgver=4.3-beta2
pkgrel=2
pkgdesc="A modern fork of Nethack"
arch=('i686' 'x86_64')
url="http://nethack4.org/"
license=('custom')
depends=('jansson' 'gcc-libs')
makedepends=('sdl2' 'libpng' 'chrpath')
optdepends=('sdl2: tiles'
            'libpng: tiles')
#source=('git+https://gitorious.org/nitrohack/ais523.git#branch=nicehack')
source=("http://nethack4.org/media/releases/nethack4-$_pkgver.tar.gz")
md5sums=('737403ba07a18fe3030a153471ba223d')

# postgresql-libs: multiuser server

build() {
  cd "$srcdir/$pkgname-$_pkgver"

  # allow aimake to run as "root"  (fakeroot confuses it)
  sed -i "s/\$^O ne 'MSWin32'/0/" aimake
  # disable check for modified files (refuses to build)
  sed -i "s/\$objtype eq 'path'/0/" aimake

  mkdir -p build
  _target=opt00000000000000000000  # pad this out for later binary hacking
  mkdir -p $_target
  cd build
  msg "Building console version"
  ../aimake --without=jansson --without=gui --without=server -i ../$_target/
  mv ../$_target/nethack4 ../$_target/nethack4-con
  msg "Building SDL version"
  ../aimake --without=jansson --with=gui --without=server -i ../$_target/

  # there does not seem to be a way to have different build and install locations
  # official instructions say to be root!
  # so let's edit binary files, yay!

  msg "Fixing srcdir references"
  cd ../$_target
  chrpath -r "/usr/lib" nethack4-{con,sdl}
  chrpath -r "/usr/lib" lib/lib{nethack_client,uncursed_sdl}.so
  # (it would be nice if chrpath could handle all these cases...)
  _data_path1="$PWD/data"
  _data_path2="/usr/share/nethack4"
  while (( ${#_data_path1} > ${#_data_path2} )); do
    _data_path2="${_data_path2}?"
  done
  _data_path2="${_data_path2//\?/\\x00}"
  echo "$_data_path2"
  sed -i "s|$_data_path1\x00|$_data_path2\x00|g" nethack4-{con,sdl}
  # skipping a bunch of other references that seem pointless-ish
  # skipping libnethack.so because it is only debugging references
  sed -i "s|$PWD|/usr/bin|g" applications/*.desktop
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # manually install
  cd opt00000000000000000000

  install -Dm755 nethack4-con "$pkgdir/usr/bin/nethack4"
  install -Dm755 nethack4-sdl "$pkgdir/usr/bin/nethack4-sdl"

  install -Dm755 lib/libnethack.so  "$pkgdir/usr/lib/libnethack.so"
  install -Dm755 lib/libnethack_client.so  "$pkgdir/usr/lib/libnethack_client.so"
  install -Dm755 lib/libuncursed_sdl.so "$pkgdir/usr/lib/libuncursed_sdl.so"
  install -Dm755 lib/libuncursed.so "$pkgdir/usr/lib/libuncursed.so"
  # make ldconfig happy
  ln -s /usr/lib/libuncursed.so "$pkgdir/usr/lib/libuncursed.so.1"
  ln -s /usr/lib/libuncursed.so "$pkgdir/usr/lib/libuncursed.so.1.0.2"

  install -d "$pkgdir/usr/share/man/man6/"
  install -m644 man/man6/* "$pkgdir/usr/share/man/man6/"

  install -dm775 -o root -g games "$pkgdir/var/games/nethack4/"
  install -m664 -o root -g games save/* "$pkgdir/var/games/nethack4/"

  install -d "$pkgdir/usr/share/nethack4/"
  install -m644 data/* "$pkgdir/usr/share/nethack4/"

  install -d "$pkgdir/usr/share/icons/"
  cp -R icons/* "$pkgdir/usr/share/icons/"
 
  install -d "$pkgdir/usr/share/applications/"
  install -m644 applications/* "$pkgdir/usr/share/applications/"
}

