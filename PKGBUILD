# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>
pkgname=logitechmediaserver-git
pkgver=20240514.22852.251c1b0de
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Git-Version, if you prefer stability consider using logitechmediaserver instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Logitech/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl>=5.26' 'perl-io-socket-ssl')
makedepends=('git' 'nasm' 'yasm' 'rsync' 'gd' 'zlib')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=install

source=("git+https://github.com/LMS-Community/slimserver.git"
        "git+https://github.com/LMS-Community/slimserver-vendor.git"
        'service')
sha256sums=('SKIP'
            'SKIP'
            '7b9cfcb0ae66d27afcaea0ab2f48f44b26a5ecbef1234aeccc4dbc63a1e6e36f')

prepare() {
    cd "${srcdir}/${url##*/}/Bin"
    rm -rf MSWin32-x86-multi-thread darwin darwin-x86_64 i386-freebsd-64int i86pc-solaris-thread-multi-64int powerpc-linux sparc-linux
    case $CARCH in
	x86_64) rm -rf {arm,armhf,aarch64}-linux ;;
	i686) rm -rf {arm,armhf,aarch64}-linux ;;
	aarch64) rm -rf {i386,x86_64,arm,armhf}-linux ;;
	arm*) rm -rf {i386,x86_64,aarch64}-linux ;;
    esac
    cd "${srcdir}/${url##*/}/CPAN"
    rm -rf arch
    cd "${srcdir}/${url##*/}/lib"
    rm -rf Audio
}

build() {
    cd "${srcdir}/${url##*/}-vendor/CPAN"
    sed -i "/cd giflib-4.1.6/a sed -i '/#include \"gif_lib_private.h\"/a #include <stdlib.h>' lib/gif_hash.c" buildme.sh
    sh buildme.sh -t
}

package() {
    cd "${srcdir}"
    install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    cd "${srcdir}/${url##*/}"
    install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a * "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${url##*/}-vendor"
    cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
    printf "ARCH-AUR-GIT.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}

pkgver() {
    cd "${url##*/}"
    printf "%s.%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
