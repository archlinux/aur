# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jackson Abascal <jacksonabascal@gmail.com>

_pkgbase=transmission
_pkgname=transmission-cli
pkgname=transmission-cli-git
pkgver=3.00.r1333.g785119f2c
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(MIT)
pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
depends=(curl libevent libsystemd miniupnpc dht libb64 libnatpmp libdeflate libpsl fmt fast_float libutp)
makedepends=(cmake publicsuffix-list git)
conflicts=(transmission-cli)
replaces=(transmission-cli)
provides=(transmission-cli)
source=(transmission::git+https://github.com/transmission/transmission.git
        transmission-cli.sysusers
        transmission-cli.tmpfiles
        "arc4"::"git+https://github.com/transmission/arc4"
        "googletest"::"git+https://github.com/google/googletest.git"
        "utfcpp"::"git+https://github.com/transmission/utfcpp#branch=post-3.2.1-transmission"
		"libutp"::"git+https://github.com/transmission/libutp#branch=post-3.4-transmission"
    	"wide-integer"::"git+https://github.com/transmission/wide-integer.git")
	#"$_pkgbase/third-party/libnatpmp"::"git+https://github.com/transmission/libnatpmp#branch=post-20151025-transmission"
        #"$_pkgbase/third-party/miniupnpc"::"git+https://github.com/transmission/miniupnpc#branch=post-2.0.20170509-transmission"
        #"$_pkgbase/third-party/libdeflate"::"git+https://github.com/transmission/libdeflate#branch=v1.11-plus-cmake"
        #"$_pkgbase/third-party/libpsl"::"git+https://github.com/transmission/libpsl.git#branch=post-3.0.0-transmission"
        #"$_pkgbase/third-party/fmt"::"git+https://github.com/transmission/fmt.git"
        #"$_pkgbase/third-party/fast_float"::"git+https://github.com/transmission/fast_float"
        #"$_pkgbase/third-party/dht"::"git+https://github.com/transmission/dht#branch=post-0.27-transmission"
        #"$_pkgbase/third-party/libb64"::"git+https://github.com/transmission/libb64#branch=post-1.2.1-transmission"
        #"$_pkgbase/third-party/libevent"::"git+https://github.com/transmission/libevent#branch=post-2.0.22-transmission"
sha256sums=('SKIP'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451'
	    'SKIP'
	    'SKIP'
	    'SKIP'
		'SKIP'
	    'SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
   cd $_pkgbase/third-party
   if [ -e arc4 ]; then
   	rm -r arc4
   fi
   ln -s $srcdir/arc4 arc4

   if [ -e googletest ]; then
        rm -r googletest
   fi
   ln -s $srcdir/googletest googletest

   if [ -e utfcpp ]; then
        rm -r utfcpp
   fi
   ln -s $srcdir/utfcpp utfcpp

   if [ -e libutp ]; then
        rm -r libutp
   fi
   ln -s $srcdir/libutp libutp

   if [ -e wide-integer ]; then
       rm -r wide-integer
   fi
   ln -s $srcdir/wide-integer wide-integer

#  git submodule update --init
}

build() {
  cd $_pkgbase

  mkdir -p build
  cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_CLI=ON \
    -DENABLE_GTK=OFF \
    -DENABLE_QT=OFF \
    -DENABLE_WEB=OFF \
    -DINSTALL_LIB=ON \
    -DUSE_SYSTEM_UTP=OFF \
    -DUSE_SYSTEM_DHT=ON \
    -DUSE_SYSTEM_B64=ON \
    -DUSE_SYSTEM_NATPMP=ON

  make
}

package() {
  cd $_pkgbase/build
  make DESTDIR="$pkgdir" install

  install -Dm644 ../daemon/transmission-daemon.service \
    "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

  install -Dm644 "$srcdir/$_pkgname.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/transmission.conf"
  install -Dm644 "$srcdir/$_pkgname.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}
