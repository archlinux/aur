# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Caleb Fontenot <foley2431 at gmail dot com>
# Contributor: Lgmrszd <lgmrszd at gmail dot com>

pkgname=packwiz-git
pkgver=r221.b8d9727
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

prepare() {
    cd "${pkgname%-git}"

    mkdir -p "completions"
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

    ./packwiz completion bash > completions/packwiz.bash
    ./packwiz completion zsh > completions/packwiz.zsh
    ./packwiz completion fish > completions/packwiz.fish
}

package() {
    cd "${pkgname%-git}"

    install -Dm755 packwiz "$pkgdir/usr/bin/packwiz"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 completions/packwiz.bash "$pkgdir/usr/share/bash-completion/completions/packwiz"
    install -Dm644 completions/packwiz.zsh "$pkgdir/usr/share/zsh/site-functions/_packwiz"
    install -Dm644 completions/packwiz.fish "$pkgdir/usr/share/fish/vendor_completions.d/packwiz.fish"
}
