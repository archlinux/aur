# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=cmake-pkg
pkgver=0.0.6
pkgrel=1
pkgdesc="pkg-config clone for CMake packages."
arch=('any')
url='https://gitlab.com/yataro/cmake-pkg/'
license=('MIT')
depends=('cmake')
makedepends=('zig')

source=("https://gitlab.com/yataro/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('529a377c01439c911a44f83260a0b03462dcbf5cf86f6fb410f90122aa6b9da3')



build() {
    cd "$pkgname-v$pkgver"

    DESTDIR="build" zig build                   \
        --summary all                           \
        --global-cache-dir ../zig-global-cache  \
        --prefix /usr                           \
        --release=safe                          \
        -Dtarget=native-linux.6.1-gnu.2.38      \
        -Dcpu=baseline
}

package() {
    cd "$pkgname-v$pkgver"

    cp -a build/* "$pkgdir"

    install -Dm644 completions/bash/cmake-pkg -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/zsh/_cmake-pkg -t "$pkgdir/usr/share/zsh/site-functions"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
