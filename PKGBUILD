# Maintainer: Platon Pronko < platon7pronko at gmail dot com >

pkgname="cryptopro-csp-k1"
pkgver=5.0.12222
# pkgver is not allowed to contain forward slashes
_pkgver_patch="6"
_pkgver="$pkgver-$_pkgver_patch"
pkgrel=2
pkgdesc='CryptoPro CSP 5.0'
arch=('x86_64')
url='https://cryptopro.ru/products/cryptopro-csp'
license=('proprietary')
depends=(
    'glibc'
    'gcc-libs'
    'gtk2'
    'gdk-pixbuf2'
    'pango'
    'atk'
    'glib2'
    'curl'
    'pcsclite'
    'libxml2'
    'ccid'
    'acsccid'
)
makedepends=(
    'libarchive'
)
source=(
    'linux-amd64.tgz' # download from https://cryptopro.ru/sites/default/files/private/csp/50/12222/linux-amd64.tgz
    'https://www.cryptopro.ru/sites/default/files/products/cades/current_release_2_0/cades_linux_amd64.tar.gz'
)
sha256sums=('b7229c7884ea5340b10ecc3e11c378a69c4ef9d8266e0a96a1f087082481026e'
            '5eef8664765a08c2354248289a3c232adf1a4596fedb520460877fe7e2c295ec')
install=cryptopro-csp-k1.install
options=(!strip)

package() {
    cd "$srcdir/linux-amd64"
    bsdtar -xf "lsb-cprocsp-base-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-rdr-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-kc1-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-capilite-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-ca-certs-${_pkgver}.noarch.rpm" -C "$pkgdir"
    bsdtar -xf "lsb-cprocsp-pkcs11-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-gui-gtk-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-pcsc-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-jacarta-64-5.0.0.1237-4.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-rdr-rutoken-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-cptools-gtk-64-${_pkgver}.x86_64.rpm" -C "$pkgdir"

    cd "$srcdir/cades_linux_amd64"
    bsdtar -xf "cprocsp-pki-cades-64-2.0.14368-1.amd64.rpm" -C "$pkgdir"
    bsdtar -xf "cprocsp-pki-plugin-64-2.0.14368-1.amd64.rpm" -C "$pkgdir"

    rm -r "$pkgdir/etc/init.d/"
    mv "$pkgdir/tmp/" "$pkgdir/opt/cprocsp/tmp/"
    rm -r "$pkgdir/usr/lib64/"

    mkdir -p "$pkgdir/etc/ld.so.conf.d/"
    echo "/opt/cprocsp/lib/amd64" > "$pkgdir/etc/ld.so.conf.d/cryptopro-csp-k1.conf"
}
