# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Caleb Fontenot <foley2431 at gmail dot com>

pkgname=packwiz-git
pkgver=r211.e71b63e
pkgrel=1
pkgdesc="A command line tool for creating minecraft modpacks."
arch=("x86_64")
url="https://packwiz.infra.link/"
license=("custom:MIT")
depends=("glibc")
makedepends=("git" "go")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/packwiz/packwiz.git")
md5sums=("SKIP")

pkgver() {
    cd "${pkgname%-git}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${pkgname%-git}"

    install -Dm755 packwiz "$pkgdir/usr/bin/packwiz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
