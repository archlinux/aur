# Maintainer: amibranch <amira.branch@protonmail.com>

pkgname=fatelf
pkgver=ed748c44c3a5eefa669ecf684acc6c4b2d23408a
pkgrel=1
pkgdesc='Utilities for a file format that allows you to package several ELF binaries in one file'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/icculus/fatelf'
license=('libselinux-1.0')
makedepends=('git' 'cmake' )
depends=('glibc')
provides=("fatelf-extract=$pkgver" "fatelf-glue=$pkgver" "fatelf-info=$pkgver" "fatelf-remove=$pkgver" "fatelf-replace=$pkgver" "fatelf-split=$pkgver" "fatelf-validate=$pkgver" "fatelf-verify=$pkgver")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git rev-list HEAD~..
}

prepare() {
    cd "$pkgname"
}

build() {
    # https://bugs.gentoo.org/704322
    export CXXFLAGS="$CXXFLAGS -fpermissive"
    cmake -B build -S "$pkgname" \
        -Wno-dev \
        -DARCH_OPT="" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install

    cd "$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim: set noet ts=4
