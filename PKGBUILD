# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver
pkgver=8.3.1
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Release-Version, if you prefer bleeding edge consider using logitechmediaserver-git instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/Logitech/slimserver'
license=('GPL' 'custom')
depends=('perl' 'perl-io-socket-ssl')
makedepends=('nasm' 'yasm' 'rsync' 'gd' 'zlib')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=logitechmediaserver.install

_vendorver=8.4
source=("slimserver-${pkgver}.tar.gz::https://github.com/Logitech/slimserver/archive/${pkgver}.tar.gz"
        "slimserver-vendor-public-${_vendorver}.tar.gz::https://github.com/Logitech/slimserver-vendor/archive/public/${_vendorver}.tar.gz"
        'logitechmediaserver.service')
sha256sums=('71086192f93ba5b3e94440d87bf7125e02dbaacb073f372ff9030a00d544d891'
            '21ab3699ed77abd641ac66b5627fcfa877cb2fad5a24d80cd0dfcc13da58ecfb'
            '1b89638a18511e02a298bde20bb6a6608d92fd4c1ec89028475bd569e324cb67')

prepare() {
	cd "${srcdir}/slimserver-${pkgver}/Bin"
	rm -rf MSWin32-x86-multi-thread darwin darwin-x86_64 i386-freebsd-64int i86pc-solaris-thread-multi-64int powerpc-linux sparc-linux
	case $CARCH in
	    x86_64) rm -rf {arm,armhf,aarch64}-linux ;;
	    i686) rm -rf {arm,armhf,aarch64}-linux ;;
	    aarch64) rm -rf {i386,x86_64,arm,armhf}-linux ;;
	    arm*) rm -rf {i386,x86_64,aarch64}-linux ;;
	esac
	cd "${srcdir}/slimserver-${pkgver}/CPAN"
	rm -rf arch
	cd "${srcdir}/slimserver-${pkgver}/lib"
	rm -rf Audio
}

build() {
	cd "${srcdir}/slimserver-vendor-public-${_vendorver}/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 logitechmediaserver.service -t "${pkgdir}/usr/lib/systemd/system/"
        cd "${srcdir}/slimserver-${pkgver}"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor-public-${_vendorver}"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
	printf "ARCH-AUR.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}
