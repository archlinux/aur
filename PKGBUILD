# Maintainer: psi4j <116757358+psi4j@users.noreply.github.com>

pkgname=sunsetr-git
_realname=sunsetr
pkgver=0.12.0.r0.g0000000
pkgrel=1
pkgdesc="Automatic blue light filter for Hyprland, Niri, and everything Wayland (git version)"
arch=('x86_64')
url="https://github.com/psi4j/sunsetr"
license=('MIT')
depends=('wayland')
makedepends=('git' 'rust' 'cargo')
provides=('sunsetr')
conflicts=('sunsetr' 'sunsetr-bin')
replaces=('sunsetr-git-debug')
options=('!debug')
source=("${_realname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_realname}"
    export SUNSETR_VERSION="$pkgver"
    cargo build --release --locked
}

package() {
    cd "${srcdir}/${_realname}"

    install -Dm755 "target/release/${_realname}" \
                    "${pkgdir}/usr/bin/${_realname}"
    install -Dm644 "LICENSE" \
                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${_realname}.service" \
                    "${pkgdir}/usr/lib/systemd/user/${_realname}.service"
    install -Dm644 "README.md" \
                    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
