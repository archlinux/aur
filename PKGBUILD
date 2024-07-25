# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgbase=glibc-eac-bin
pkgname=(glibc-eac-bin lib32-glibc-eac-bin glibc-eac-locales-bin)
pkgver=2.40
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
b2sums=('5c18eaa7cf544583bb9c43be2dbb510d34df5a934011a89ab751b89875678d439112ed2f4adf354041fa32a023623d10c0d985be08915912fd9639ccfcb6d16f'
        '8ba90d0e47dd0f5945897ab7bbb3037d0308c512f47559ed2a48b6e287b3fda78f3d6244aa4cd2d39eebe46474debb5412c9519714cd0bf6816a2ddb4f6d1aca'
        'ccc062d5b7f414886c9a4b129cb22eaf4e157820e6e0df0df338dcad09f93d1ab63171c3ea1f5c4e2ceb8ab76e353d44fe9e50d17b53cce495764a6a370d3fd1'
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
