# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=xbps
pkgver=0.53
pkgrel=1
pkgdesc="The X Binary Package System from Void Linux. Don't use it instead of Arch's 'pacman'."
arch=('i686' 'x86_64')
url="https://github.com/void-linux/xbps"
license=('BSD')
depends=('ca-certificates' 'libarchive' 'openssl-1.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('360b3149141fec46dd6da9019605bcee48ee4d29bffe5aa47a9fd5fa68ccd5f4')

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --dbdir=/var/lib/xbps

    sed -i '/-Werror/d' config.mk
    make
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
    install -Dm644 COPYING.3RDPARTY "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING.3RDPARTY
}
