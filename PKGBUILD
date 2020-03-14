# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=navi-git
pkgver=r238.8d0c82c
pkgrel=2
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
        43cf44f1cd5b9a7bb8f247735a59ba91
        27308a8ca0e77387464dbd7f1e0bcdd4)
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

    mkdir -p "${pkgdir}/etc/profile.d/"
    install -Dm755 "${srcdir}/navi.sh" "${pkgdir}/etc/profile.d/navi.sh"

    mkdir -p "${pkgdir}/usr/bin/"
    install -Dm755 "./target/release/navi" "${pkgdir}/usr/bin/navi"

    mkdir -p "${pkgdir}/${HOME}/.navi"
    cp -r "./cheats" "${pkgdir}/${HOME}/.navi/cheats"
    cp -r "./shell" "${pkgdir}/${HOME}/.navi/shell"
}
