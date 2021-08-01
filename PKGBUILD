# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_commit=d0c8469f66806b5ea738d607f7d2b000af8b1129

pkgname=ftl-sdk
pkgver=0.10.1
pkgrel=3
pkgdesc="Software Development Kit for Mixer's FTL Protocol"
arch=(x86_64)
url="https://github.com/Scrumplex/ftl-sdk"
license=("custom:MIT")
depends=("jansson" "curl")
makedepends=("cmake" "make" "git")
provides=("libftl.so=0-64")
source=("$pkgname::git+https://github.com/microsoft/ftl-sdk.git#commit=${_commit}"
        "0001-cmake-Use-external-jansson-if-possible.patch"
        "0002-cmake-Install-into-standard-directories.patch"
        "0003-cmake-Install-a-pkgconfig-file.patch"
        "0004-refactor-remove-ftl_app-completely.patch")
sha512sums=('SKIP'
            'a7b83b1f6e51040d84354b4c608fffb16be5cbb301d2dba87c13cd590440b322d240323f579999d368f6cedc28278af042baea055a90ca1e164907e67aa6d5c9'
            'bcc093365424824118d7a26c428c13ce50775f85b739100bd5e84900d60364802d356292ebb2346f8a1e19ba1b0deeb54fb59e65ab5302963da33ee9b9cfd85a'
            '4369b9b08c31527f1eea480c279c141fa4b859aa49796e2c0e7d3b83d2e9a6c28d3b3b6b147f77962bb0fe598009599466aefcf4f17f24cf4b3c51019d692ed5'
            'aec0e1bb0bc9368620d558c97294ab23564388cb09ce94e06f20a294060d1841948c073a2c90e7049d78a170e8917fcf84f4089513c46fc019ce2fdd40f516b4')


prepare() {

    cd "$pkgname"

    rm -f "libftl.pc.in"  # manual cleanup, as patch will create this file below

    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 -f -i "../$src"
    done
}

build() {

    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {

    make DESTDIR="$pkgdir" -C build install

    cd "$pkgname"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
