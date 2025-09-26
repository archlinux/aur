# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.31.1
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories'
arch=(i686 x86_64)
url=https://www.jdupes.com
license=(MIT)
depends=(glibc 'libjodycode>=4' xxhash)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jbruchon/jdupes/archive/v${pkgver}.tar.gz"
        jdupes-system-xxhash.patch)
sha256sums=('c80d4c1deb03cc891a7e938f886952cfc480b8a0bc48baf21b312d350b62d8e3'
            'b4df170f8ea5569808e0c4f84a1af24282ea53233db760d97531e50df8eea1c4')

prepare() {
    patch --directory="${pkgname}" --forward --strip=1 --input="${srcdir}/jdupes-system-xxhash.patch"
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
