# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Arnoud Willemsen <mail at lynthium dot com>

pkgname=jdupes-git
pkgver=1.25.3.r1.gcaab350
pkgrel=1
pkgdesc='A program for identifying duplicate files residing within specified directories (git)'
arch=(i686 x86_64)
url=https://github.com/jbruchon/jdupes
license=(MIT)
depends=(glibc libjodycode xxhash)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git
        jdupes-system-xxhash.patch)
sha256sums=('SKIP'
            'ef7221ca9148bf984d4d82ea973037d6284060945fe8cf59c252881cf42118a4')

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
