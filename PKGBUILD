# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
pkgname=hashdeep
pkgver=4.4
pkgrel=6
pkgdesc="cross-platform tools to message digests for any number of files"
arch=('x86_64')
url="https://github.com/jessek/hashdeep"
license=('GPL' 'custom')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jessek/hashdeep/archive/v$pkgver.tar.gz"
        "hashdeep-4.4-fix-errors-found-by-clang.patch::https://github.com/jessek/hashdeep/commit/6ef69a26126ee4e69a25392fd456b8a66c51dffd.patch")
sha256sums=('ad78d42142f9a74fe8ec0c61bc78d6588a528cbb9aede9440f50b6ff477f3a7f'
            '7a7fbca4339ca64589386d12d560c04e0929da9065b7e9c0dd1f441bc6fc0fbc')

prepare() {
    cd "$pkgname-$pkgver"

    # Fix compilation with GCC 11
    patch --forward --strip=1 --input="$srcdir/hashdeep-4.4-fix-errors-found-by-clang.patch"

    ./bootstrap.sh
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

