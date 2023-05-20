# Maintainer: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=nimlangserver-git
pkgver=latest.r9.gf7b32fa
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/nim-lang/langserver"
license=('MIT')
depends=('nim>=1.0.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git"
        "nimlangserver.patch")
sha256sums=('SKIP'
            '76a987077dea6a224a6337a08f172f92da1734af6c7e31e8674d131654aba07c')

prepare() {
    # patching
    cd "$srcdir/${pkgname%-git}"
    patch --strip=2 < ../../nimlangserver.patch # work around "Error: cannot open file: /usr/compiler/pathutils" https://github.com/nim-lang/langserver/issues/22
    # download packages.json file
    nimble refresh
}

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # change into source
    cd "$srcdir/${pkgname%-git}"
    # compile program
    nimble build
}

check() {
    # change into source
    cd "$srcdir/${pkgname%-git}"
    # run all tests
    nimble test
}

package() {
    # create our target filestructure
    mkdir -p "$pkgdir/usr/bin"
    # copy executable
    install -Dm755 "$srcdir/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
