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
        "wren-cli-${pkgver}.tar.gz::http://api.github.com/repos/wren-lang/wren-cli/tarball/961003d7e439f6cf9aa62aebd641ff67f8c93872")
sha256sums=('23c0ddeb6c67a4ed9285bded49f7c91714922c2e7bb88f42428386bf1cf7b339'
            '0116fde664ef418845aadd1388021caf6937068a81536f95ff55797a0c622d87')
# NOTE: Needs to be extracted manualy, because of the hacked commit (see note above)
noextract=("wren-cli-${pkgver}.tar.gz")

prepare() {
    mkdir -p "${srcdir}/wren-cli-${pkgver}"
    tar -xf "${SRCDEST}/wren-cli-${pkgver}.tar.gz" --strip-components=1 -C "${srcdir}/wren-cli-${pkgver}"
}

build() {
    make -C "${srcdir}/wren-${pkgver}/projects/make"
    make -C "${srcdir}/wren-cli-${pkgver}/projects/make"
}

package() {
    pushd "${srcdir}/wren-${pkgver}"
    install -Dm755 ./bin/wren_test "$pkgdir/usr/bin/wren_test"
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

