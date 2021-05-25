# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=torrential
pkgver=1.1.0
pkgrel=5
pkgdesc='Simple BitTorrent client for Pantheon'
arch=('x86_64')
url='https://github.com/davidmhewitt/torrential'
license=('GPL')
depends=('granite' 'libevent' 'libnatpmp' 'miniupnpc')
makedepends=('cmake' 'git' 'vala')
_commit=1d731f992e4567e102d1ffa28a0c44c4322eba76  # tags/1.1.0
source=("git+https://github.com/davidmhewitt/torrential.git#commit=$_commit"
        'transmission-torrential::git+https://github.com/davidmhewitt/transmission.git'
        'git+https://github.com/transmission/dht.git'
        'git+https://github.com/transmission/libb64.git'
        'git+https://github.com/transmission/libevent.git'
        'git+https://github.com/transmission/libnatpmp.git'
        'git+https://github.com/transmission/libutp.git'
        'git+https://github.com/transmission/miniupnpc.git'
        'no-unity.patch'
        'patch-vala.patch')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '8b279ca266c8b1643cf10ff0a66a66283be6595959720bcc321fdef0f3da6ea7'
            'f45f87330502796a3ab2d4798c8fa76f3ce63026828aa890e99ae06ed0adca1f')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # Remove Unity support
  patch -Np1 -i ../no-unity.patch

  # Fix build with vala 0.52
  patch -Np1 -i ../patch-vala.patch

  # Don't treat warnings as fatal
  sed -i '/--fatal-warnings/d' CMakeLists.txt

  git submodule init
  git submodule set-url transmission "$srcdir/transmission-torrential"
  git submodule update

  cd transmission
  git submodule init
  git submodule set-url third-party/dht "$srcdir/dht"
  git submodule set-url third-party/libb64 "$srcdir/libb64"
  git submodule set-url third-party/libevent "$srcdir/libevent"
  git submodule set-url third-party/libnatpmp "$srcdir/libnatpmp"
  git submodule set-url third-party/libutp "$srcdir/libutp"
  git submodule set-url third-party/miniupnpc "$srcdir/miniupnpc"
  git submodule update
}

build() {
  cmake -S $pkgname -B build -G 'Unix Makefiles' -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  ln -s com.github.davidmhewitt.torrential "$pkgdir/usr/bin/$pkgname"
}
