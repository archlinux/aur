# Maintainer: bipin Kumar <kbipinkumar@pm.me>

pkgname=hifiasm
pkgver=0.19.5
pkgrel=1
pkgdesc="Haplotype-resolved de novo assembler for PacBio Hifi reads. https://doi.org/10.1038/s41592-020-01056-5"
arch=(x86_64)
url="https://github.com/chhylp123/hifiasm"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
source=(
        "$pkgname-$pkgver.tar.gz::"https://github.com/chhylp123/hifiasm/archive/refs/tags/${pkgver}.tar.gz""
        "LDFLAG.patch::"https://patch-diff.githubusercontent.com/raw/chhylp123/hifiasm/pull/484.patch""
        )
b2sums=('1104508456996fb43ddf05d2c43ef49eb252a9be08f8ff08ad4577a4a89e2585b1d838ab10de45125937be4ae7e740a96fcfc16189cc738abcb43c645ff1d0aa'
        '6fa4df620ac4f10991702edaf155982ad7730d09caf69774403a1843f0668d00c9bdbe1c9c8ba20c56f7b2b214292da8184ed665a8e0812a0aa0119c20ae70fc')

prepare() {
	cd ${pkgname}-${pkgver}
    patch -p1 < ${srcdir}/LDFLAG.patch

}

build() {
	cd ${pkgname}-${pkgver}
    export LDFLAGS="-Wl,-z,relro,-z,now"
	make
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 hifiasm "$pkgdir"/usr/bin/hifiasm
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p ${pkgdir}/usr/share/man/man1/
    cp  hifiasm.1 ${pkgdir}/usr/share/man/man1/hifiasm.1
}
