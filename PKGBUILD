# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.27.3
pkgrel=2
pkgdesc='A program for identifying duplicate files residing within specified directories'
arch=(i686 x86_64)
url=https://www.jdupes.com
license=(MIT)
depends=(glibc libjodycode xxhash)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/jbruchon/jdupes/archive/v${pkgver}.tar.gz"
        jdupes-system-xxhash.patch)
sha256sums=('1c75ed30dc95b3b5024019ab2ba3f78a14835c11d5b71249aa94374fde650c16'
            'b4df170f8ea5569808e0c4f84a1af24282ea53233db760d97531e50df8eea1c4')

prepare() {
    patch --directory="$pkgname" --forward --strip=1 --input="${srcdir}/jdupes-system-xxhash.patch"
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
