# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>
# Contributor: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=bwa-mem2
pkgver=2.3
pkgrel=1
pkgdesc="The next version of Burrows-Wheeler Aligner MEM algorithm"
arch=("x86_64")
url="https://github.com/bwa-mem2/bwa-mem2"
license=("MIT")
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bwa-mem2/bwa-mem2/releases/download/v${pkgver}/Source_code_including_submodules.tar.gz"
        "gcc14_implicit-function-declaration_fix.patch"
        "package_version_2p3_fix.patch")
sha256sums=('0c48a1ea800af499ae7264b4c8908c4ca35fbe5a7df2ad6106c79aa94bb49cbb'
            '53e30cf678a8c90d8f69972935cd9ea95b2023325ca93137a85db9ca0158c6b5'
            '826405ee7a23ecdbec3ea070f356230b82ed06317f121e71dd4432a00a8e7f6b')

# For compiling for native instruction set only, set this to false:
MULTI=${MULTI:-true}

prepare() {
    cd "$srcdir/$pkgname-${pkgver}"

    patch -p1 -i "${srcdir}/gcc14_implicit-function-declaration_fix.patch"
    patch -p1 -i "${srcdir}/package_version_2p3_fix.patch"
}

build() {
    cd "$srcdir/$pkgname-${pkgver}"

    if [ "$MULTI" = true ] ; then
        make multi
    else
        make arch=native
    fi
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"

    install -Dm755 bwa-mem2 "$pkgdir/usr/bin/bwa-mem2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    if [ "$MULTI" = true ] ; then
        install -Dm755 bwa-mem2.avx2      "$pkgdir/usr/bin/bwa-mem2.avx2"
        install -Dm755 bwa-mem2.avx512bw  "$pkgdir/usr/bin/bwa-mem2.avx512bw"
        install -Dm755 bwa-mem2.sse41     "$pkgdir/usr/bin/bwa-mem2.sse41"
    fi
}
