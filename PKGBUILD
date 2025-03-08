# Maintainer: chise0713 <chise0713 at protonmail dot com>

pkgbase=glibc-eac-bin
pkgname=(glibc-eac-bin lib32-glibc-eac-bin glibc-eac-locales-bin)
pkgver=2.41+r9+ga900dbaf70f0
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
b2sums=('d30ffdb33addf1ff39776c063993dab122c2cd61efdb02807a07da2043a894e37125870ddb722da0e6b170ed6a46c73322b6dacb7c5d3335ebe4fbea95f2c3ec'
        '3491bb93536b526e51c52feb00c5b4a20ed1da2d296235fc6ad9e5cd685b5bc30063205828a15699d78e23a431c5e26a70cb1461833cb07e4f2933be03723854'
        '2001adc7d5cad7a51a5c98cfbb9fd5f327639d5efe22c140719734ecab3fe639603e94e71b45d35e36efe651b4512fd25485c98cb82178653477ade7a9481935'
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
