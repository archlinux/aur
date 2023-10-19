# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=check-broken-packages-pacman-hook-git
pkgver=r87.eec94bd
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

check() {
    cd "${srcdir}/${_gitname}/check-broken-packages"
    cargo test --release --locked
}

build() {
    cd "${srcdir}/${_gitname}/check-broken-packages"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm 644 check-broken-packages/check-broken-packages.hook "${pkgdir}/usr/share/libalpm/hooks/80-check-broken-packages.hook" 
    install -Dm 755 -t "${pkgdir}/usr/bin" check-broken-packages/target/release/check-broken-packages
}
