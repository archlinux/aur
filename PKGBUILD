# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>
pkgname=logitechmediaserver-git
pkgver=20210126.9f548f9
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Git-Version, if you prefer stability consider using logitechmediaserver instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Logitech/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl>=5.26' 'perl-io-socket-ssl')
makedepends=('git' 'yasm' 'rsync' 'gd' 'zlib')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=install

_gitver=8.1.1
_githash=9f548f9b711a469bd3cb7b92a776b0c9f9005ce7
_githashvendor=c2162d0abc5f213421a171d3781805642673d9a0
source=("slimserver.tar.gz::https://github.com/Logitech/slimserver/archive/${_githash}.tar.gz"
        "slimserver-vendor.tar.gz::https://github.com/Logitech/slimserver-vendor/archive/${_githashvendor}.tar.gz"
        'service')
sha256sums=('fca1c4277fa9c63f513de8fc6b4495cfa6ed16bd8ff45ad70b969e8a3054a2bf'
            'f82930bb8965ea9d9bec9344148a157296b2bad97426e799b30d8eb074973b56'
            '7b9cfcb0ae66d27afcaea0ab2f48f44b26a5ecbef1234aeccc4dbc63a1e6e36f')

prepare() {
	cd "${srcdir}/slimserver-${_githash}/Bin"
	rm -rf MSWin32-x86-multi-thread darwin darwin-x86_64 i386-freebsd-64int i86pc-solaris-thread-multi-64int powerpc-linux sparc-linux
	case $CARCH in
	    x86_64) rm -rf {arm,armhf,aarch64}-linux ;;
	    i686) rm -rf {arm,armhf,aarch64}-linux ;;
	    aarch64) rm -rf {i386,x86_64,arm,armhf}-linux ;;
	    arm*) rm -rf {i386,x86_64,aarch64}-linux ;;
	esac
	cd "${srcdir}/slimserver-${_githash}/CPAN"
	rm -rf arch
	cd "${srcdir}/slimserver-${_githash}/lib"
	rm -rf Audio
}

build() {
	cd "${srcdir}/slimserver-vendor-${_githashvendor}/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        cd "${srcdir}/slimserver-${_githash}"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor-${_githashvendor}"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
	printf "ARCH-AUR-GIT.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}

pkgver() {
    printf "%s.%s" "$(date +%Y%m%d)" "$(git ls-remote ${url} HEAD | cut -c 1-7)"
}
