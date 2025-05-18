# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A fast, simple and intuitive dotfiles manager that just gets the job done (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
makedepends=('git' 'go' 'sed')
optdepends=('diffutils: To display changes before overwriting a file')

source=("git+https://github.com/pol-rivero/doot.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/doot"
    echo "$(date +%Y%m%d).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/doot"

    sed -i "s/\[\[VERSION\]\]/${pkgver}/g" cmd/version.go
    sed -i "s/\[\[COMMIT\]\]/$(git rev-parse HEAD)/g" cmd/version.go

    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o doot
}

package() {
    # Install binary
    cd "$srcdir/doot"
    install -Dm755 doot "$pkgdir/usr/bin/doot"

    # Generate and install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/doot" completion bash > "$pkgdir/usr/share/bash-completion/completions/doot"
    "$pkgdir/usr/bin/doot" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_doot"
    "$pkgdir/usr/bin/doot" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/doot.fish"
}
