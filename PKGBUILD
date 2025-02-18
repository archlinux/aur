# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgbase=glibc-eac-bin
pkgname=(glibc-eac-bin lib32-glibc-eac-bin glibc-eac-locales-bin)
pkgver=2.41+r6+gcf88351b685d
pkgrel=1
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
b2sums=('7a1a4dbac8a3230f72eb7291eec0d077773e930279e1dc7ea2eb2762149a0cb5b256baf0c0f765fba806f3807c565bbb1b92959f3f4fa5139351f5ee0848d5f0'
        'f4b8ec43ecf9c31e18475791b9c4a81c0247388e4106fda1813faa28510cc7779f09c5a6cec411fe81ba6f288cb06bfa00566d1f1fa6be56bbcf5c7518600a4b'
        '65ef1126028529b84dbce8fdf053964927d68969d0907e083f3ab6221a1c016d5789bb16e9e68cc99e2cc734101494bc74746130499f56b991fda8af3b3e1c43'
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
