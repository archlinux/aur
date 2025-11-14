# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=pkgstate
pkgver=0.1.4
pkgrel=1
pkgdesc="The perfect companion your dotfiles repo: declaratively define your installed packages, systemd services, and user groups"
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pol-rivero/pkgstate/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c90fe63b90a42c52c6b5e61f4bda320d43a1312884df7137227e592f33dc3b9a')

build() {
    tar -xzf "${pkgname}-${pkgver}.tar.gz"
    cd "${pkgname}-${pkgver}"

    sed -i "s/\[\[VERSION\]\]/${pkgver}/g" cmd/version.go
    sed -i "s/\[\[COMMIT\]\]/aur/g" cmd/version.go
    
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o pkgstate
}

package() {
    # Install binary
    cd "${pkgname}-${pkgver}"
    install -Dm755 pkgstate "$pkgdir/usr/bin/pkgstate"

    # Generate and install shell completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"
    install -d "$pkgdir/usr/share/fish/vendor_completions.d"

    "$pkgdir/usr/bin/pkgstate" completion bash > "$pkgdir/usr/share/bash-completion/completions/pkgstate"
    "$pkgdir/usr/bin/pkgstate" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_pkgstate"
    "$pkgdir/usr/bin/pkgstate" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/pkgstate.fish"
}
