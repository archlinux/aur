# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=bgpdump
pkgver=1.6.2
pkgrel=2
pkgdesc='Utility and C Library for parsing MRT files'
arch=('x86_64')
url="https://github.com/RIPE-NCC/bgpdump"
license=('GPL2')
depends=('zlib' 'bzip2')
makedepends=()
source=("https://github.com/RIPE-NCC/bgpdump/archive/v${pkgver}.tar.gz"
        '05-addr-representation.diff'
        'updates.nlri_mask_trailing_bits.gz'
        'updates.nlri_mask_trailing_bits.gz.bgp.gz')
sha256sums=('415692c173a84c48b1e927a6423a4f8fd3e6359bc3008c06b7702fe143a76223'
            '86efd03c29add6e93596b3df8eb8a6eded67a907811e2ff61f60c8bb4ac663df'
            '19ed2d93b3dd30cbb5af3bdccf421e22b685e9944138b96a72b34660865a5607'
            '8f71ea4caa5d22cf9e105a64be1be91a3168fd4ee6113ec2ff863cefc526b506')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/05-addr-representation.diff"
    cp "$srcdir/updates.nlri_mask_trailing_bits.gz" test_data/
	cp "$srcdir/updates.nlri_mask_trailing_bits.gz.bgp.gz" test_expect/
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoheader
    autoconf
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et :
