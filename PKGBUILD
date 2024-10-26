# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Previous contributors:
# William Gathoye, Emil Vanherp, Alad Wenter, Xavier D., Valere Monseur
# Troubleshooting: https://eid.belgium.be/en/faq/google-chromechromium-how-do-i-log
# Test if login works: https://iamapps.belgium.be/tma/

pkgname=eid-mw
pkgver=5.1.21
#_pkgverlong=5.1.20.1.gb3056f4d
pkgrel=1
pkgdesc="The Belgian e-ID (electronic identity card) viewer and Firefox extension"
arch=("x86_64")
url="https://eid.belgium.be/"
license=("LGPL-3.0-only")
depends=("gtk3" "libproxy" "curl" "p11-kit" "libassuan" "openssl" "libgpg-error" "libxml2")
makedepends=("autoconf-archive" "pcsclite" "libtool" "libbsd")
optdepends=(
    "firefox: Extension for Belgian eid"
    "acsccid: ACS CCID smart card readers"
    "ccid: Needed for Belgian Digipass 870"
    "pcsc-tools: PC/SC smartcard tools"
)
source=(
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v${pkgver}.tar.gz"
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v${pkgver}.tar.gz.asc"
)
sha256sums=('2d2a362d47516779d11b6160c31cbc015399292ffa34e97b310880990188295c'
            'SKIP')
#    Upstream only signs the "continuous releases" of the software, so that is the version
#    we are using.. 
#    The following key is taken from https://files.eid.belgium.be/info.html.
validpgpkeys=("D95426E309C0492990D8E8E2824A5E0010A04D46")

build() {
    cd "$pkgname-$pkgver-v$pkgver"
    sed -i "s/c_rehash/openssl rehash/g" plugins_tools/eid-viewer/Makefile.in
    SSL_PREFIX=/usr ./configure \
	--prefix=/usr \
	--libexecdir=/usr/bin \
	--sysconfdir=/etc \
	--disable-static
    make
}

package() {
    cd "$pkgname-$pkgver-v$pkgver"
    make install DESTDIR="$pkgdir"
}
