# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgbase=glibc-eac-bin
pkgname=(glibc-eac-bin lib32-glibc-eac-bin glibc-eac-locales-bin)
pkgver=2.39+r52+gf8e4623421
pkgrel=4
_pkgrel=1
pkgdesc="GNU C Library with DT_HASH patch for games using EAC (CI built binary version)"
arch=('x86_64')
url='https://aur.archlinux.org/pkgbase/glibc-eac/'
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
options=(staticlibs !lto)
provides=('glibc' 'lib32-glibc' 'glibc-locales')
conflicts=('glibc' 'lib32-glibc' 'glibc-locales')
source=(
    "https://github.com/chise0713/glibc-eac-ci/releases/download/$pkgver-$_pkgrel/glibc-eac-$pkgver-$_pkgrel-x86_64.pkg.tar.zst"
    "https://github.com/chise0713/glibc-eac-ci/releases/download/$pkgver-$_pkgrel/glibc-eac-locales-$pkgver-$_pkgrel-x86_64.pkg.tar.zst"
    "https://github.com/chise0713/glibc-eac-ci/releases/download/$pkgver-$_pkgrel/lib32-glibc-eac-$pkgver-$_pkgrel-x86_64.pkg.tar.zst"
    "lib32-glibc-eac-bin.install"
    "glibc-eac-bin.install"
)
b2sums=('a672527b774c82cc15caa898c7af975a46eead9e88ac4cd814efd5002b6d05ec818770be075fe8361fea462b67a855f07f5fe47946d9c67cdbbcd1ebe39511d3'
        '5d55a25300da47f9430bad8528408c1aa169a7dfb98bb65cf0fc453762de69c53d9d1eec07fdadac0fdecb2eda26e5a7148b87b00842fbd94708f04ce0b2bfcf'
        'b81b315d1723c41da4620ba82a69de013cff5a91b4a7faaccc0267becc178a2e9b63aacb1b619685d95f4363d8bb1284fec54bd5ee0a076b635185947ee8ded9'
        '599278642d9b3034b3a897db3ec76c5c7b65c8a9974ad3e17bd0553a497793111e10b9062592c17fa4cddd4fd349323a61f5e592183948fd5625326b03c6ece5'
        '8007af446aa6e3b781aa155557279953ee86faffc6eedac5d7bdf115a7bdc59c7c0ab60ea0bab2fd61acaffc7e2e04d6353d0bbba5589f4de9775cd567ea00f7')
noextract=("${source[@]##*/}")

prepare() {
    for item in "glibc-eac-$pkgver-$_pkgrel-x86_64" "lib32-glibc-eac-$pkgver-$_pkgrel-x86_64" "glibc-eac-locales-$pkgver-$_pkgrel-x86_64"; do
        install -dm755 "$item"
        tar -xf "$item.pkg.tar.zst" --directory="$item"
        rm "$item"/{".BUILDINFO",".INSTALL",".MTREE",".PKGINFO"} -f
    done
}

package_glibc-eac-bin() {
    pkgdesc='GNU C Library with DT_HASH patch for games using EAC (CI built binary version)'
    depends=('linux-api-headers>=4.10' tzdata filesystem)
    optdepends=('gd: for memusagestat'
        'perl: for mtrace')
    provides=("glibc=$pkgver")
    conflicts=("glibc")
    install=glibc-eac-bin.install
    backup=(etc/gai.conf
        etc/locale.gen)
    cp -a "$srcdir/glibc-eac-$pkgver-$_pkgrel-x86_64/." "$pkgdir"
}

package_lib32-glibc-eac-bin() {
    pkgdesc='GNU C Library (32-bit) with DT_HASH patch for games using EAC (CI built binary version)'
    depends=("glibc-eac-bin=$pkgver")
    provides=("lib32-glibc=$pkgver")
    conflicts=("lib32-glibc")
    options+=('!emptydirs')
    install=lib32-glibc-eac-bin.install
    cp -a "$srcdir/lib32-glibc-eac-$pkgver-$_pkgrel-x86_64/." "$pkgdir"
}

package_glibc-eac-locales-bin() {
    pkgdesc='Pregenerated locales for GNU C Library (CI built binary version)'
    depends=("glibc-eac-bin=$pkgver")
    provides=("glibc-locales")
    conflicts=("glibc-locales")
    cp -a "$srcdir/glibc-eac-locales-$pkgver-$_pkgrel-x86_64/." "$pkgdir"
}
