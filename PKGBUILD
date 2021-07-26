# Maintainer: Tom Bu <tombu@tombu.info>

pkgname=ciel-git
_pkgname=ciel-rs
pkgver=3.0.10.alpha.0.b105661
pkgrel=1
pkgdesc="A tool for controlling multi-layer file systems and containers (development version)."
arch=('x86_64')
url="https://github.com/AOSC-Dev/ciel-rs"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd' 'dbus' 'openssl')
optdepends=('libgit2: git vcs support'
            'xz: xzip archive support')
provides=('ciel')
conflicts=('ciel')
makedepends=('rust' 'cargo' 'gcc' 'make' 'git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "$(grep ^version Cargo.toml | cut -d= -f2 | tr -d ' "' | sed 's/-/./g').$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release
}


package() {
    cd "$pkgname"
    install -Dm755 target/release/ciel-rs "$pkgdir"/usr/bin/ciel
    PREFIX="$pkgdir"/usr ./install-assets.sh

    # Install the license
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/ciel/LICENSE
}

