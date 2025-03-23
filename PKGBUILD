# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver-git
pkgver=9.0.2.r191.gb0aa22c
pkgrel=1
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=('perl>=5.40' 'perl<=5.42' glibc gcc-libs zlib)
makedepends=(git rsync yasm clang)
install=lyrionmusicserver.install
options=(!strip)
source=("git+https://github.com/LMS-Community/slimserver.git"
        "git+https://github.com/LMS-Community/slimserver-vendor.git"
        'lyrionmusicserver-git.service')
sha256sums=('SKIP'
            'SKIP'
            '9f639d3bd5c389bd64578093a67a5b7d951db588ef50769e599722a225bcf365')

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

pkgver() {
  cd "slimserver"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "slimserver-vendor/CPAN"
  ./buildme.sh -t
}

package() {
  mkdir -p "${pkgdir}"/opt/${pkgname}/{cache,Logs,prefs{,/plugin},Plugins}

  install -d "${pkgdir}/usr/lib/systemd/system/"
  install -Dm644 lyrionmusicserver-git.service -t "${pkgdir}/usr/lib/systemd/system/"

  cd "slimserver"
  cp -a * "${pkgdir}/opt/${pkgname}"
  cd "${srcdir}/slimserver-vendor"
  cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
    #printf "ARCH-AUR-GIT.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}
