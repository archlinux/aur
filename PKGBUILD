# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>
# Contributor: Maël Kerbiriou <m431.kerbiriou@gmail.com>

pkgname=bwa-mem2
pkgver=2.2.1
pkgrel=1
pkgdesc="The next version of Burrows-Wheeler Aligner MEM algorithm"
arch=("x86_64")
url="https://github.com/bwa-mem2/bwa-mem2"
license=("MIT")
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bwa-mem2/bwa-mem2/releases/download/v${pkgver}/Source_code_including_submodules.tar.gz"
        "gcc_rdtsc.patch")
sha256sums=('9b001bdc7666ee3f14f3698b21673714d429af50438b894313b05bc4688b1f6d'
            '50556ad538edb98bbdcaae4338dc42873e6aae27ab7ab4a090cd0442818072f9')

# For compiling for native instruction set only, set this to false:
MULTI=${MULTI:-true}

prepare() {
    cd "$srcdir/$pkgname-${pkgver}"

    patch -p1 -i "${srcdir}/gcc_rdtsc.patch"
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
