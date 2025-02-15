# Maintainer: aliu <aaronliu0130@gmail.com>
pkgname=foobard-git
pkgver=0.r5.e57d8ad
pkgrel=1
pkgdesc='Client for controlling Foobar2000 through MPRIS (media controller)'
arch=('any')
url='https://git.sr.ht/~dropbear/foobard'
license=('BSD-3-Clause')
makedepends=('make' 'clang' 'git')
depends=('libsystemd')
optdepends=('foobar2000-component-mpris: Required server')
provides=('foobard')
conflicts=('foobard')
source=('git+https://git.sr.ht/~dropbear/foobard')
sha256sums=('SKIP')
DLAGENTS=("git::/usr/bin/git clone --filter=blob:none --no-checkout --single-branch %u %o")
pkgver() {
    cd foobard

    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd foobard

    git sparse-checkout init --cone
    git sparse-checkout add 'ubjson/'
    git read-tree -mu HEAD
}

build() {
    cd foobard
    make
}

package() {
    cd foobard
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/foobard/LICENSE"

    cd build
    install -Dm755 foobard "$pkgdir/usr/bin/foobard"
}
