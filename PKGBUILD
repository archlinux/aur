# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.29.0
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories'
arch=(i686 x86_64)
url=https://www.jdupes.com
license=(MIT)
depends=(glibc 'libjodycode>=4' xxhash)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jbruchon/jdupes/archive/v${pkgver}.tar.gz"
        jdupes-system-xxhash.patch
        jdupes-fix_static_stripped.patch::https://codeberg.org/jbruchon/jdupes/commit/50886412c876100ccc08dcba933c68937c68e89c.patch
        jdupes-fix-build-system.patch::https://codeberg.org/jbruchon/jdupes/commit/9ce7f4c48f79a7e5c6f5bdd5f6bc8d335ffcdf93.patch)
sha256sums=('4475a97e515713c99d12920d3807f06ba6fdff07f84a6ce9f7a1174793ad5950'
            'b4df170f8ea5569808e0c4f84a1af24282ea53233db760d97531e50df8eea1c4'
            '1a95a8f802a1b1fa2c0012440eda414b5324d02b0cad3e54d72d7545e7d67a09'
            '54e02eab89fa0a0ebca8b6738e35f89439bfdac40e6abbd6503cac393eeec35d')

prepare() {
    cd "${pkgname}"
    patch --forward --strip=1 --input="${srcdir}/jdupes-system-xxhash.patch"
    patch --forward --strip=1 --input="${srcdir}/jdupes-fix_static_stripped.patch" # Needed for the next patch
    patch --forward --strip=1 --input="${srcdir}/jdupes-fix-build-system.patch"
}

build() {
    cd "${pkgname}"
    make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package() {
    cd "${pkgname}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
