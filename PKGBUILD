# Maintainer: Ateles
pkgname=dawn-writer-git
pkgver=0.1.3.r0.g33e15d8
pkgrel=1
pkgdesc='A distraction-free writing environment with live markdown rendering.'
arch=('x86_64')
url='https://github.com/andrewmd5/dawn'
# omitting glibc and curl dependencies (e2fsprogs, keyutils, libunistring, zlib, libidn2, brotli, openssl, krb5, libnghttp2, libnghttp3, libpsl, libssh2)
depends=('curl' 'zstd' 'pcre2')
makedepends=('git')
license=('MIT')
source=("${pkgname}-${pkgver}::git+${url}.git")
sha256sums=('SKIP')
provides=('dawn')
conflicts=('dawn')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git submodule update --init --recursive
}

pkgver() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make release
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install

    # Remove bundled PCRE2 files (owned by system pcre2)
    rm -f  "$pkgdir/usr/bin/pcre2-"*
    rm -f  "$pkgdir/usr/include/pcre2"*.h
    rm -f  "$pkgdir/usr/lib/libpcre2"*
    rm -f  "$pkgdir/usr/lib/pkgconfig/libpcre2"*
    rm -rf "$pkgdir/usr/share/doc/pcre2"
    rm -f  "$pkgdir/usr/share/man/man1/pcre2"*
    rm -f  "$pkgdir/usr/share/man/man3/pcre2"*

    # UTF8Proc / CYAML artifacts
    rm -f "$pkgdir/usr/include/utf8proc.h" "$pkgdir/usr/include/cyaml.h"
    rm -f "$pkgdir/usr/lib/libutf8proc.a" "$pkgdir/usr/lib/libcyaml.a"
    rm -f "$pkgdir/usr/lib/pkgconfig/libutf8proc.pc"

    # CMake config files
    rm -f "$pkgdir/usr/lib/cmake/utf8proc"/*.cmake
    rm -f "$pkgdir/usr/lib/cmake/cyaml"/*.cmake
    rm -f "$pkgdir/usr/lib/cmake/pcre2"/*.cmake

    # Remove now-empty directories
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/cmake/utf8proc/" "$pkgdir/usr/lib/cmake/cyaml/" "$pkgdir/usr/lib/cmake/pcre2/"
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/cmake/"
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/lib/pkgconfig/" "$pkgdir/usr/lib/"
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/include/"
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/man/man1/" "$pkgdir/usr/share/man/man3/" "$pkgdir/usr/share/man/"
    rmdir --ignore-fail-on-non-empty "$pkgdir/usr/share/doc/"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
