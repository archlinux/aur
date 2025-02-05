# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgbase=glibc-eac-bin
pkgname=(glibc-eac-bin lib32-glibc-eac-bin glibc-eac-locales-bin)
pkgver=2.41+r2+g0a7c7a3e283a
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
b2sums=('b6743b7f698fa283223b5719f94f0b3bd76d097ec6eef65ba226be806ce81eb648b7f116a20b214775e2558f584b3aa74942b88fa9cac217b844927044579104'
        '704b2265a2b59b8ddf7423789e10e72c3a5849d20add8cc3a7d8856ba67e98528c196effe77a572592a2959c9ca4f877731c2bfc4d5713e6d44567b7c412e48c'
        '237df23c4b7f7c0aaf07130a5dbb5804ee330d1565b1be4b380123d783f46fa2d636a0d71676541e7f7b8def521bb020f2b20587fda2624fa25d2eb2981918c6'
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
