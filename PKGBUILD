# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver
pkgver=9.0.2
pkgrel=1
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=('perl>=5.40' 'perl<5.43' glibc gcc-libs zlib)
makedepends=(git rsync yasm clang)
install=lyrionmusicserver.install
options=(!strip)
source=("git+https://github.com/LMS-Community/slimserver.git#tag=${pkgver}"
        "git+https://github.com/LMS-Community/slimserver-vendor.git"
		Scan.xs.patch
		typemap.patch
        'lyrionmusicserver.service')
sha256sums=('78401ac07fd4fedfa6c9d7e3b63000261bc3f5c4bf87277b5654ca397db17ba1'
            'SKIP'
            '23782e25586190cb18936167edd8b99463a82a27633d4aaece0ddf99759d2fa5'
            '73bf6b8c01c7046fa6c31f17f933db20eaa5d039ab350ada63ddf0b6ff0ab98f'
            'fda4083398b2a99c92b8a463345068f6dffcf327cf22cb66eb849a7aeef7462a')

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
  cp ../*.patch "slimserver-vendor/CPAN"
  cd "slimserver-vendor/CPAN"
  patch buildme.sh buildme.sh.patch
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
