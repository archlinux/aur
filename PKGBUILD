# Maintainer: AndreLeclercq <andre.leclercq.io@protonmail.com>
pkgname=sshctl-git
pkgver=0.2.0.r75.484813a
pkgrel=1
pkgdesc="SSH connection manager CLI tool (development version)"
arch=('x86_64')
url="https://github.com/AndreLeclercq/sshctl"
license=('MIT')
depends=('glibc')
makedepends=('git' 'rust')
provides=('sshctl')
conflicts=('sshctl')
source=("git+https://github.com/AndreLeclercq/sshctl.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/sshctl"
    local cargo_ver=$(grep '^version = ' Cargo.toml | head -1 | sed 's/version = "\(.*\)"/\1/')
    local short_hash=$(git rev-parse --short=7 HEAD)
    printf "%s.r%s.%s" "${cargo_ver}" "$(git rev-list --count HEAD)" "${short_hash}"
}

build() {
    cd "${srcdir}/sshctl"
    cargo build --release
}

package() {
    cd "${srcdir}/sshctl"
    install -Dm755 "target/release/sshctl" "${pkgdir}/usr/bin/sshctl"
    
    if [ -f README.md ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/sshctl/README.md"
    fi
    
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sshctl/LICENSE"
    fi
}
