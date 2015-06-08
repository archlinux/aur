# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver-git
pkgver=7.9.0
pkgrel=5
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Git-Version, if you prefer stability consider using logitechmediaserver instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
provides=('logitechmediaserver')
depends=('perl<5.21')
makedepends=('nasm' 'yasm' 'rsync' 'gd' 'zlib' 'subversion' 'awk')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
install=install
source=('service')
sha256sums=('f5c64f2a066914dbab9a1dd4a8ec33895645a72bde3bdbeb83c49e4624a997cb')

pkgver() {
    printf "GIT.r%s" "$(svn info ${url}/trunk | awk '/Revision:/ { print $2 }')"
}

prepare() {
	cd "${srcdir}"
	msg "Connecting to GitHub..."
	svn export --force ${url}-vendor/trunk/CPAN slimserver-vendor/CPAN
	svn export --force ${url}/trunk slimserver
	msg "Sources fetched or server timeout"
	cd "${srcdir}/slimserver"
	case $CARCH in
	    x86_64) rm -rf Bin/{arm,armhf}-linux ;;
	    i686) rm -rf Bin/{arm,armhf}-linux ;;
	    arm*) rm -rf Bin/{i386,x86_64}-linux ;;
	esac
}

build() {
	cd "${srcdir}/slimserver-vendor/CPAN"
	sh buildme.sh -t
}

package() {
        cd "${srcdir}"
        install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
        cd "${srcdir}/slimserver"
        install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
        cp -a * "${pkgdir}/opt/${pkgname}"
        cd "${srcdir}/slimserver-vendor"
        cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
}
