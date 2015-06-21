# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com> 
pkgname=airdcnano-git
pkgver=20140305-git
pkgrel=2
pkgdesc="AirDC++ nano is a high-performance text-mode client for sharing and chatting."
arch=('any')
url="http://www.airdcpp.net/nano"
license=('GPL')
depends=('bzip2' 'ncurses' 'zlib' 'glib2' 'miniupnpc' 'geoip' 'boost' 'leveldb')
optdepends=(
  'natpmp: NAT-PMP port mapping support'
  'intel-tbb: Intel x86 multicore support'
)
makedepends=('git' 'scons')
conflicts=('airdcnano')
provides=('airdcnano')
source=('git+https://github.com/airdcnano/airdcnano.git')
md5sums=( 'SKIP' )

pkgver() {
  cd "$srcdir/airdcnano"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/airdcnano"
  clang_inst=0
  pacman -Qs clang>/dev/null || clang_inst=$?
  if [ "$clang_inst" -eq 0 ]
  then
    echo "Using clang, since it will compile the client twice as fast as gcc."
    export CXX=clang
  fi
  scons -Q PREFIX=/usr
}

package() {
  cd "$srcdir/airdcnano"
  scons -Q PREFIX=/usr --install-sandbox="$pkgdir" install
}


