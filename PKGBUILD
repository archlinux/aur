# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver
pkgver=9.0.0
pkgrel=2
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=('perl>=5.40' 'perl<=5.42' glibc gcc-libs zlib)
makedepends=(git rsync yasm clang)
install=lyrionmusicserver.install
options=(!strip)
source=("git+https://github.com/LMS-Community/slimserver.git#tag=${pkgver}"
        "git+https://github.com/LMS-Community/slimserver-vendor.git"
        'lyrionmusicserver.service')
sha256sums=('267b298f3d0de910bb4cd566218a11bbab3d63227b5f223c6d5a5ee32534e402'
            'SKIP'
            'ce46e29a56c43af2762ec7043ce45d41b83947f1983d745a86416b7fe4b0ef1c')

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
