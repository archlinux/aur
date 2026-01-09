# Maintainer: jslay88
pkgname=zladxhd-installer-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Automated installer for Zelda: Link's Awakening DX HD on Linux (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jslay88/zladxhd-installer"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
    'steam: Required for Steam integration'
    'protontricks: Required for Wine prefix setup'
    'flatpak: Alternative protontricks installation method'
)
provides=('zladxhd-installer')
conflicts=('zladxhd-installer' 'zladxhd-installer-bin')
source=("${pkgname}::git+https://github.com/jslay88/zladxhd-installer.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    export CGO_ENABLED=0
    go build -ldflags "-s -w -X main.version=${pkgver}" -o zladxhd-installer ./cmd/zladxhd-installer
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 zladxhd-installer "$pkgdir/usr/bin/zladxhd-installer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
