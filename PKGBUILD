# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=pkgstate-git
pkgver=0.0.0
pkgrel=1
pkgdesc="The perfect companion your dotfiles repo: declaratively define your installed packages, systemd services, and user groups (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/pkgstate"
license=('MIT')
provides=('pkgstate')
conflicts=('pkgstate')

makedepends=('git' 'go' 'sed')
depends=('pacman' 'systemd')
optdepends=(
    'doot: To manage your dotfiles repository'
    'yay: To be able to install AUR packages'
    'paru: To be able to install AUR packages'
)

source=("git+https://github.com/pol-rivero/pkgstate.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pkgstate"
    echo "$(date +%Y%m%d).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/pkgstate"

    sed -i "s/\[\[VERSION\]\]/${pkgver}/g" cmd/version.go
    sed -i "s/\[\[COMMIT\]\]/$(git rev-parse HEAD)/g" cmd/version.go

    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o pkgstate
}

package() {
    # Install binary
    cd "$srcdir/pkgstate"
    install -Dm755 pkgstate "$pkgdir/usr/bin/pkgstate"

    # Generate and install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/pkgstate" completion bash > "$pkgdir/usr/share/bash-completion/completions/pkgstate"
    "$pkgdir/usr/bin/pkgstate" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_pkgstate"
    "$pkgdir/usr/bin/pkgstate" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/pkgstate.fish"
}
