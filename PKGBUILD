# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgver=23.0.12
pkgrel=1
epoch=2

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server'
arch=('x86_64')
license=('GPL3')

depends=('libadalang-tools' 'gtkada' 'libvss' 'ada_spawn' 'ada-libfswatch' 'gpr' 'gnatdoc')
makedepends=('gcc-ada' 'gprbuild')

# NOTE: When new releases of spawn, lal, lal-tools, gnatdoc, and vss make it to the AUR, try removing the corresponding patches. The patches only exist because the tagged versions of the dependencies have not been updated in GitHub.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "als.patch"
        "spawn.patch"
        "lal-tools.patch"
        "lal.patch"
        "gnatdoc.patch"
        "vss.patch")

b2sums=('9daab15000b42df79a847d0ca6eb5b7f604c18f561eed2074cce8d2477d5a85671d3677bb87bab75d31340d90114a3d7b91cbd19817bd3f9e167bf29b77b5ce3'
        '95a8d0ad9367606e5d6426dec432941d76e7bf7f8f7de3915282dcea9fcf7da783611b94f1f09376d5fac5b0fa2e81f470d01344dd42ab607918709e5a48e43b'
        '56fecf391b0618a97ea5e010b272346ae761254354bb9b74241508d47dffa6e8abaaeedd1be267775be54347c63929ad4a9f9744f9abc7f360169b139ac957ef'
        'cc8e0bd391cbf85fd188e5850977b90f1c69a6e4f43cff975c6e5daf8e9c80cde54bc9608ce8505a918300f1f5e17aef46a25300cf992cc89b1c0485e64beac5'
        '509b44efc1a2ef8cf0216632bbf03980956ba500bcedd7442308b60ffe5668a0db851de11af0606626ba4726f5efaf10cad1dca16e898b379f6314dc03f51b2e'
        '4072dde16e15faeab86da4a804730751ba7e498a32f19dd19bbf7b8e6fd44dff183b375fdacd857ecad03c6d1ac5b3a3351d17fe3b6e5d903e76a99752a2b3c7'
        '19682602c942eb3cf4a1e911d311468f21003ef7b4bd5c0f36d592cc2088faa50a9dc814dd14596be5bfb834ee3de57fc83c3323462076379995f4042a484849')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --strip=1 < ../als.patch
    patch --strip=1 --reverse < ../spawn.patch
    patch --strip=1 --reverse < ../lal-tools.patch
    patch --strip=1 --reverse < ../lal.patch
    patch --strip=1 --reverse < ../gnatdoc.patch
    patch --strip=1 < ../vss.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make BUILD_MODE=prod
}

#check() {
#    cd "$srcdir/$pkgname-$pkgver"
#    make check
#}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make BUILD_MODE=prod LIBRARY_TYPE=relocatable DESTDIR="$pkgdir/usr" install
}
