# Maintainer: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=nimlangserver-git
pkgver=v1.2.0.r11.g97ffd6d
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/nim-lang/langserver"
license=('MIT')
depends=('nim>=2.0.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git"
        "nimble-lock.patch")
sha256sums=('SKIP'
            '9478a7b7bf1b8a6cd6c79df500e8ce52518fb400ce0a4da586aef7120f0a86a4')

prepare() {
    # patching
    cd "$srcdir/${pkgname%-git}"
    patch --strip=2 < ../nimble-lock.patch # use system nim version
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
    #nimble test
}

package() {
    # create our target filestructure
    mkdir -p "$pkgdir/usr/bin"
    # copy executable
    install -Dm755 "$srcdir/${pkgname%-git}/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
