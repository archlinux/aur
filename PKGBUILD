# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>
pkgname=logitechmediaserver
pkgver=8.2.0
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Release-Version, if you prefer bleeding edge consider using logitechmediaserver-git instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Logitech/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl>=5.26' 'perl-io-socket-ssl')
makedepends=('git' 'yasm' 'rsync' 'gd' 'zlib')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=install

_gitver=8.2.0
_gitvendorver=8.0
source=("slimserver.tar.gz::https://github.com/Logitech/slimserver/archive/${_gitver}.tar.gz"
        "slimserver-vendor-public.tar.gz::https://github.com/Logitech/slimserver-vendor/archive/public/${_gitvendorver}.tar.gz"
        'service')
sha256sums=('845f11b276d3fa987d942427e10c6dece296f1e167385b19f99a2567741e7957'
            'e13f0e3529234693953e32382776ea965b87a758d1bc75cf453819fb0d76d502'
            '07208896fed78eb9cb0086360c02f3226ecf1be9a061d55a6f95b9a60b6d6735')

prepare() {
	cd "${srcdir}/slimserver-${_gitver}/Bin"
	rm -rf MSWin32-x86-multi-thread darwin darwin-x86_64 i386-freebsd-64int i86pc-solaris-thread-multi-64int powerpc-linux sparc-linux
	case $CARCH in
	    x86_64) rm -rf {arm,armhf,aarch64}-linux ;;
	    i686) rm -rf {arm,armhf,aarch64}-linux ;;
	    aarch64) rm -rf {i386,x86_64,arm,armhf}-linux ;;
	    arm*) rm -rf {i386,x86_64,aarch64}-linux ;;
	esac
	cd "${srcdir}/slimserver-${_gitver}/CPAN"
	rm -rf arch
	cd "${srcdir}/slimserver-${_gitver}/lib"
	rm -rf Audio
}

build() {
	cd "${srcdir}/slimserver-vendor-public-${_gitvendorver}/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        cd "${srcdir}/slimserver-${_gitver}"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor-public-${_gitvendorver}"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
	printf "ARCH-AUR-GIT.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}
