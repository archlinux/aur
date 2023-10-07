# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Arnoud Willemsen <mail at lynthium dot com>

pkgname=jdupes-git
pkgver=1.27.3.r32.g81b9ced
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories (git)'
arch=(i686 x86_64)
url=https://www.jdupes.com
license=(MIT)
depends=(glibc libjodycode-git xxhash)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://codeberg.org/jbruchon/jdupes.git
        jdupes-system-xxhash.patch)
sha256sums=('SKIP'
            'b4df170f8ea5569808e0c4f84a1af24282ea53233db760d97531e50df8eea1c4')

pkgver() {
    git -C "${pkgname%-git}" describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    patch --directory="${pkgname%-git}" --forward --strip=1 --input="${srcdir}/jdupes-system-xxhash.patch"
}

build() {
    cd "${pkgname%-git}"
    make ENABLE_BTRFS=1 ENABLE_DEDUPE=1 STATIC_DEDUPE_H=1
}

package() {
    cd "${pkgname%-git}"
    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
