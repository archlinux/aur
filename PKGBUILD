# Maintainer: fam007e <faisalmoshiur@gmail.com>
pkgname=libexecinfo
pkgver=1.1.0.25
pkgrel=1
pkgdesc="BSD-licensed clone of backtrace facility found in GNU libc"
# armv7h/aarch64 intentionally absent: GCC does not implement
# __builtin_return_address(N>0) on ARM32 and returns NULL for it on
# AArch64, so backtrace() would always return 0 frames there.
arch=('x86_64' 'i686')
url="https://github.com/fam007e/libexecinfo"
license=('BSD')
depends=('glibc')
makedepends=('python')
provides=('libexecinfo.so')
conflicts=('libexecinfo-git')
# Keep libexecinfo.a in the package: makepkg's default !staticlibs would
# otherwise silently strip it during tidying.
options=('staticlibs')

# Pinned to the exact tagged release asset, not releases/latest/download/.
# "latest" follows whatever release is newest at *build* time, so the
# sha256sum below would silently stop matching the moment a new release
# is published, even though pkgver here hasn't changed.
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/libexecinfo/releases/download/v$pkgver/libexecinfo-$pkgver.tar.gz")
sha256sums=('4547e37b20f006626ed118999ef8e6a71bc98f9f561a9939287c35853e1e7b8f')

# No prepare()/sed step: since libexecinfo 1.1.0.25 the Makefile
# generates libexecinfo.pc directly from libexecinfo.pc.in with correct
# PREFIX/LIBDIR/INCLUDEDIR substitution, so there is nothing for
# makepkg to patch around.

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr LIBDIR=/usr/lib INCLUDEDIR=/usr/include/libexecinfo all libexecinfo.pc
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    # Since 1.1.0.25 the Makefile's `test` target builds AND runs the
    # test binary (test_runner) and propagates its exit code, so check()
    # actually gates packaging.
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr LIBDIR=/usr/lib INCLUDEDIR=/usr/include/libexecinfo
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
