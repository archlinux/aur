# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver
pkgver=7.9.0.arch3
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Release-Version, if you prefer bleeding edge consider using logitechmediaserver-git instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
depends=('perl<5.23' 'perl-cgi')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
makedepends=('nasm' 'yasm' 'rsync' 'gd' 'zlib')
install=install
source=("slimserver-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "slimserver-vendor-${pkgver}.tar.gz::${url}-vendor/archive/${pkgver}.tar.gz"
        'service')
sha256sums=('ede18a6d4d598e9d07bf840b9714708613efd42b49f9a5ce6acff4d8d8fde64c'
            '77066d959679f419cc1bf3d0d3d10b34e5c543a3adeb10f76f9e10c03ce728e7'
            '41718cf74b2f9b542089e7bd238fb974d049a6132e8d3e0ed598d6689e5d16c2')

prepare() {
    cd "${srcdir}/slimserver-${pkgver}"
    case $CARCH in
        x86_64) rm -rf Bin/{arm,armhf}-linux ;;
        i686) rm -rf Bin/{arm,armhf}-linux ;;
        arm*) rm -rf Bin/{i386,x86_64}-linux ;;
    esac
}

build() {
    cd "${srcdir}/slimserver-vendor-${pkgver}/CPAN"
    sh buildme.sh -t
}

package() {
    cd "${srcdir}"
    install -Dm644 service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    cd "${srcdir}/slimserver-${pkgver}"
    install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}" && ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -a * "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/slimserver-vendor-${pkgver}"
    cp -a CPAN/build/5.*/lib/*/*linux*/* "${pkgdir}/opt/${pkgname}/CPAN"
    printf "ARCH-AUR-REL.%s\n%s" "${pkgver}" "$(date)" > "${pkgdir}/opt/${pkgname}/revision.txt"
}

