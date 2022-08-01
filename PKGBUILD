# Maintainer: Techcable <Techcable@techcable.net>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Tetsumi <tetsumi@vmail.me>

pkgname=wren
pkgver=0.4.0
pkgrel=1
pkgdesc='Small, fast, class-based concurrent scripting language. '
makedepends=('python3')
depends=('libuv')
license=('MIT')
arch=('x86_64')
url='https://wren.io/'
# NOTE: I pinned wren-cli to a specific commit (961003d7e439f) because there
# is currently no 0.4.0 release for wren-cli (see issue #108)
source=("wren-$pkgver.tar.gz::https://github.com/wren-lang/wren/archive/refs/tags/${pkgver}.tar.gz"
        "wren-cli-${pkgver}.tar.gz::http://api.github.com/repos/wren-lang/wren-cli/tarball/961003d7e439f6cf9aa62aebd641ff67f8c93872"
        "0001-Fix-build-on-glibc-2.34.patch")
sha256sums=('23c0ddeb6c67a4ed9285bded49f7c91714922c2e7bb88f42428386bf1cf7b339'
            '0116fde664ef418845aadd1388021caf6937068a81536f95ff55797a0c622d87'
            '2ea2d46392e9d4b13d2df30f235d3fdbbf1d7a4d9bd8c2ffaf104fabf8b7c588')
# NOTE: Needs to be extracted manualy, because of the hacked commit (see note above)
noextract=("wren-cli-${pkgver}.tar.gz")

prepare() {
    mkdir -p "${srcdir}/wren-cli-${pkgver}"
    tar -xf "${SRCDEST}/wren-cli-${pkgver}.tar.gz" --strip-components=1 -C "${srcdir}/wren-cli-${pkgver}"
    pushd "${srcdir}/wren-cli-${pkgver}" >/dev/null
    patch -p1 < "${srcdir}/../0001-Fix-build-on-glibc-2.34.patch"
    popd >/dev/null
}

build() {
    make -C "${srcdir}/wren-${pkgver}/projects/make"
    make -C "${srcdir}/wren-cli-${pkgver}/projects/make"
}

check() {
    pushd "${srcdir}/wren-${pkgver}"
    echo "======== Testing Wren ========"
    python3 util/test.py
    popd
    echo "====== Testing Wren CLI ======" 
    pushd "${srcdir}/wren-cli-${pkgver}"
    python3 util/test.py
    popd
}

package() {
    pushd "${srcdir}/wren-${pkgver}"
    rm ./bin/wren_test # NOTE: We don't need the language tests installed ;)
    install -Dm644 ./src/include/wren.h "$pkgdir/usr/include/wren.h"
    install -Dm755 ./lib/libwren.so "$pkgdir/usr/lib/libwren.so"
    install -Dm644 ./lib/libwren.a "$pkgdir/usr/lib/libwren.a"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/wren/LICENSE"

    popd
    pushd "${srcdir}/wren-cli-${pkgver}"

    # NOTE: Rename 'wren_cli' to plain 'wren'
    install -Dm755 ./bin/wren_cli "$pkgdir/usr/bin/wren"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/wren/cli-LICENSE"
}

