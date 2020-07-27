# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>
pkgname=logitechmediaserver-git
pkgver=20200727.91bab34
_gitver=8.0
_githash=8d4c2b0b27b040f5c64313f039b64f1bd0efbaae
_githashvendor=1a6dc71ba3470c389738fc5f127ba8a17291700b
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
source=("slimserver.tar.gz::https://github.com/Logitech/slimserver/archive/${_githash}.tar.gz"
        "slimserver-vendor.tar.gz::https://github.com/Logitech/slimserver-vendor/archive/${_githashvendor}.tar.gz"
        'service')
sha256sums=('f6a1b07d2cda5e0977e929e2e05d374546a596e11f6a83361e93cd3edbfce941'
            '5e5c328ce5f6174eb847f6f833b2f7f980fae967b240d3843dd65993a0ae0db3'
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
