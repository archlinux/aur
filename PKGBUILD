# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.27.1
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories'
arch=(i686 x86_64)
url=https://github.com/jbruchon/jdupes
license=(MIT)
depends=(glibc libjodycode xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        jdupes-system-xxhash.patch)
sha256sums=('3c357374630e0dd0ee323f9f48b4a7b95433f3b1e6d3c76f04fd75325c13a1a9'
            'b4df170f8ea5569808e0c4f84a1af24282ea53233db760d97531e50df8eea1c4')

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/jdupes-system-xxhash.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
