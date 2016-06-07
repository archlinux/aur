# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=logitechmediaserver
pkgver=7.9.0.arch4
pkgrel=1
pkgdesc='Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server. (Release-Version, if you prefer bleeding edge consider using logitechmediaserver-git instead)'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/stefansielaff/slimserver'
license=('GPL' 'custom')
depends=('perl>=5.18' 'perl<5.25' 'perl-cgi' 'perl-ev' 'perl-digest-sha1')
optdepends_x86_64=('lib32-glibc: transcoding on 64-bit systems' 'lib32-gcc-libs: transcoding on 64-bit systems')
makedepends=('nasm' 'yasm' 'rsync' 'gd' 'zlib')
install=install
source=("slimserver-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "slimserver-vendor-${pkgver}.tar.gz::${url}-vendor/archive/${pkgver}.tar.gz"
        'service')
sha256sums=('edf5f4e72c8b68c6ec3c4a02a15e833bb9e638dbabaa303c168e127a3a65f66f'
            'd2f3170cbe5eca4907e6fec3fc63176ce52b1963a587c45fcd5ef469784b1160'
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

