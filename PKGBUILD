# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=check-broken-packages-pacman-hook-git
pkgver=r92.ae70a79
pkgrel=1
pkgdesc='Pacman hook to check for broken packages'
arch=('x86_64')
_gitname='pacman-hooks'
url="https://github.com/desbma/${_gitname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('pacman-hooks-desbma-git')
source=("git+https://github.com/desbma/${_gitname}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_gitname}/check-broken-packages"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${_gitname}/check-broken-packages"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${srcdir}/${_gitname}/check-broken-packages"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 644 check-broken-packages/check-broken-packages.hook "${pkgdir}/usr/share/libalpm/hooks/80-check-broken-packages.hook" 
    install -Dm 755 -t "${pkgdir}/usr/bin" check-broken-packages/target/release/check-broken-packages
}
