# Maintainer: Pablo Alessandro Santos Hugen <PabloASHugen@protonmail.com>
pkgname=bintools
pkgver=v0.1.0.r0.366a172
pkgrel=1
pkgdesc="suckless and very opinionated binary analysis tools."
arch=(x86_64)
url="https://github.com/Tomcat-42/bintools"
license=('MIT')
makedepends=('zig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("bintools::git+https://github.com/Tomcat-42/bintools.git")
md5sums=('SKIP')
options=(!debug strip)

pkgver() {
    pushd "$srcdir/${pkgname%-git}" >/dev/null || exit
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
    popd >/dev/null || exit
}

build() {
    pushd "$srcdir/${pkgname}" >/dev/null || exit
    zig build -Doptimize=ReleaseFast -Dtarget=x86_64-linux-musl -p build
    popd >/dev/null || exit
}

package() {
    pushd "$srcdir/${pkgname}/build" >/dev/null || exit

    find bin -type f -exec install -Dm755 -s {} "$pkgdir/usr/{}" \;
    find lib -type f -exec install -Dm644 -s {} "$pkgdir/usr/{}" \;
    find include -type f -exec install -v -Dm644 {} "$pkgdir/usr/{}" \;
    install -Dm644 "$srcdir/${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"

    popd >/dev/null || exit
}
