# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver
pkgver=9.1.1
pkgrel=1
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=(
    glibc
    libgcc
    libstdc++
    perl
    'perl>=5.40' 'perl<5.45'
    perl-io-socket-ssl
    sh
    zlib
    )
makedepends=(
    git
    rsync
    yasm
    )
install=lyrionmusicserver.install
options=(!strip)
source=("git+https://github.com/LMS-Community/slimserver.git#tag=${pkgver}"
        "git+https://github.com/LMS-Community/slimserver-vendor.git"
        'lyrionmusicserver.service'
        'IO-AIO-perl544.patch'
        'Image-Scale-libm.patch')
sha256sums=('eb28fe88c7bb4a5a127b359b4d78e5b9b77301e9afea45874fba95f2cbd3d3a3'
            'SKIP'
            '8d06c69c06bf824c427990de091dec2a738090aa46f0034c392d34ec446f844f'
            '0695c8151ca509f1d65e8df5025510cfff4c56fe6cb1cbd64e2a641dc6c7aa51'
            '7d47361adcb36f5ddb5529068e96a0ccff3c517a9eacc258c9d86aeb4ea23780')

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

    cd "${srcdir}/slimserver-vendor/CPAN"
    rm -rf build
    # buildme.sh echoes before "exit $?", so failures exit 0
    sed -i 's/exit \$?/exit 1/' buildme.sh
    # buildme.sh reuses an already extracted module dir, then deletes it after building
    rm -rf IO-AIO-3.71 Image-Scale-0.14
    tar xzf IO-AIO-3.71.tar.gz
    tar xzf Image-Scale-0.14.tar.gz
    patch -d IO-AIO-3.71 -p1 < "${srcdir}/IO-AIO-perl544.patch"
    patch -d Image-Scale-0.14 -p1 < "${srcdir}/Image-Scale-libm.patch"
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
}
