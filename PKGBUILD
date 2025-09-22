# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver
pkgver=9.0.2
pkgrel=3
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=(perl glibc gcc-libs zlib
		 'perl>=5.40' 'perl<5.43'
		 )
makedepends=(git rsync yasm)
install=lyrionmusicserver.install
options=(!strip)
source=("git+https://github.com/LMS-Community/slimserver.git#tag=${pkgver}"
        "git+https://github.com/LMS-Community/slimserver-vendor.git"
        'lyrionmusicserver.service')
sha256sums=('78401ac07fd4fedfa6c9d7e3b63000261bc3f5c4bf87277b5654ca397db17ba1'
            'SKIP'
            '8d06c69c06bf824c427990de091dec2a738090aa46f0034c392d34ec446f844f')

prepare() {
    cd "slimserver/Bin"
    rm -rf MSWin32-x86-multi-thread MSWin32-x64-multi-thread darwin darwin-x86_64 i386-freebsd-64int i86pc-solaris-thread-multi-64int powerpc-linux sparc-linux
    case $CARCH in
	x86_64) rm -rf {i386,arm,armhf,aarch64}-linux ;;
	i686) rm -rf {x86_64,arm,armhf,aarch64}-linux ;;
	aarch64) rm -rf {i386,x86_64,arm,armhf}-linux ;;
	arm*) rm -rf {i386,x86_64,aarch64}-linux ;;
    esac
    cd "${srcdir}/slimserver/CPAN"
    rm -rf arch
    cd "${srcdir}/slimserver/lib"
    rm -rf Audio
}

build() {
  # default to GCC, LMS prefer clang if both are installed
  export CC=/usr/bin/gcc CXX=/usr/bin/g++

  cd "slimserver-vendor/CPAN"
  ./buildme.sh -t
}

package() {
  mkdir -p "${pkgdir}"/opt/${pkgname}/{cache,Logs,prefs{,/plugin},Plugins}

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 lyrionmusicserver.service -t "${pkgdir}/usr/lib/systemd/system/"

  cd "slimserver"
  cp -a * "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/slimserver-vendor"
  cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"

  touch "${pkgdir}/opt/lyrionmusicserver/Logs/server.log"
  touch "${pkgdir}/opt/lyrionmusicserver/Logs/perfmon.log"
}
