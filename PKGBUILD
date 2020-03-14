# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=navi-git
pkgver=r238.8d0c82c
pkgrel=5
pkgdesc='An interactive cheatsheet tool for the command-line.'
arch=('any')
url='https://github.com/denisidoro/navi'
license=('Apache 2.0')
depends=('fzf')
makedepends=('git' 'make' 'rustup')
provides=('navi')
conflicts=('navi')
install='navi.install'
source=("${pkgname}::git+${url}"
        navi.sh
        navi.install)
md5sums=('SKIP'
        28d8acf7ed7a1387172526e91e7cb998
        b7c360616920dc118ef2bca1d1bfc263)
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Don't make rustc torture us even longer by re-compiling everything from scratch...
# CI pipelines are a thing anyways.
# check() {
#     cd "${pkgname}"
#     cargo test --release --locked
# }

build() {
    cd "${pkgname}"
    cargo +stable build --release --locked --all-features
}

package() {
    cd "${pkgname}"

    install -Dm755 "${srcdir}/navi.sh" "${pkgdir}/etc/profile.d/navi.sh"
    install -Dm755 "./target/release/navi" "${pkgdir}/usr/bin/navi"

    mkdir -p "${pkgdir}/etc/navi"
    cp -r "./cheats" "${pkgdir}/etc/navi/cheats"
    cp -r "./shell" "${pkgdir}/etc/navi/shell"
}
