# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver-git
pkgver=7.9.0
_gitver=7.9
pkgrel=8
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Git-Version, if you prefer stability consider using logitechmediaserver instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl>=5.18' 'perl<5.25' 'perl-cgi' 'perl-ev' 'perl-digest-sha1')
makedepends=('nasm' 'yasm' 'rsync' 'gd' 'zlib')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=install
source=("slimserver.tar.gz::${url}/archive/public/${_gitver}.tar.gz"
        "slimserver-vendor.tar.gz::${url}-vendor/archive/public/${_gitver}.tar.gz"
        'service')
sha256sums=('SKIP'
	    'SKIP'
	    'f5c64f2a066914dbab9a1dd4a8ec33895645a72bde3bdbeb83c49e4624a997cb')

prepare() {
	cd "${srcdir}/slimserver-public-${_gitver}"
	case $CARCH in
	    x86_64) rm -rf Bin/{arm,armhf}-linux ;;
	    i686) rm -rf Bin/{arm,armhf}-linux ;;
	    arm*) rm -rf Bin/{i386,x86_64}-linux ;;
	esac
}

build() {
	cd "${srcdir}/slimserver-vendor-public-${_gitver}/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        cd "${srcdir}/slimserver-public-${_gitver}"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor-public-${_gitver}"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
}
