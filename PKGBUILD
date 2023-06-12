# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>
pkgname=jdupes
pkgver=1.24.0
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories'
arch=(i686 x86_64)
url=https://github.com/jbruchon/jdupes
license=(MIT)
depends=(glibc libjodycode xxhash)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        system-xxhash.patch)
sha256sums=('76ee1ffcf958958c3e093bbe9674c9410d4b1d730081b50f6d1e2dc342b230dd'
            'b68853cefa710ad4941feee40fc420afc6941d8664f2a1c22d1a5678f57a6057')

prepare() {
    patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/system-xxhash.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
