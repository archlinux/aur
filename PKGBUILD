# Maintainer: dougefresh dchimento@gmail.com
pkgname=kiro-generator
pkgver=0.2.1
pkgrel=2
pkgdesc="Kiro agent configuration generator"
arch=('x86_64')
url="https://github.com/kiro-generator/kiro-generator"
license=('MIT')
makedepends=('cargo' 'git' 'binutils')
conflicts=('kiro-generator-bin' 'kiro-generator-git')
provides=('kiro-generator')
backup=('etc/kg/global.env' 'etc/kg/home.env')
install=kiro-generator.install
source=("${pkgname}::git+https://github.com/kiro-generator/kiro-generator.git#tag=v${pkgver}")
sha256sums=('e9896d228bf8c2ca2d74e22b440364db2b28c4c4d944b248af3480eb0019c1c5')
options=('!lto' '!debug')
_target_dir='target'

build() {
    cd "$srcdir/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$_target_dir"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}"

    # Install kg binary
    install -Dm755 "${_target_dir}/release/kg" -t "${pkgdir}/usr/bin/"

    # Install systemd user units
    install -Dm644 resources/systemd/kiro-generator.service -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 resources/systemd/kiro-generator.path -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 "resources/systemd/kiro-generator-local@.service" -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 "resources/systemd/kiro-generator-local@.path" -t "${pkgdir}/usr/lib/systemd/user/"

    # Install default environment files
    install -Dm644 resources/systemd/global.env -t "${pkgdir}/etc/kg/"
    install -Dm644 resources/systemd/home.env -t "${pkgdir}/etc/kg/"

    install -Dm644 resources/agents/kg-helper.json "${pkgdir}/usr/share/doc/${pkgname}/agents/kg-helper.json"
    # Install documentation
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 resources/kg-helper/SKILL.md "${pkgdir}/usr/share/doc/${pkgname}/kg-helper/SKILL.md"
    (
        cd resources/kg-helper/references
        for md in *.md; do
            install -Dm644 "$md" "${pkgdir}/usr/share/doc/${pkgname}/kg-helper/references/${md}"
        done
    )

    (
        cd resources/kg-helper/assets
        for md in *.*; do
            install -Dm644 "$md" "${pkgdir}/usr/share/doc/${pkgname}/kg-helper/assets/${md}"
        done
    )
    (
        cd schemas
        for schema in *.json; do
            install -Dm644 "$schema" "${pkgdir}/usr/share/doc/${pkgname}/schemas/${schema}"
        done
    )
}
