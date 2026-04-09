# Maintainer: dougefresh dchimento@gmail.com
pkgname=kiro-generator-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Kiro agent configuration generator"
arch=('x86_64')
url="https://github.com/kiro-generator/kiro-generator"
license=('MIT')
conflicts=('kiro-generator' 'kiro-generator-git')
provides=('kiro-generator')
backup=('etc/kg/global.env' 'etc/kg/home.env')
install=kiro-generator.install
source=("${pkgname%-bin}::https://github.com/kiro-generator/kiro-generator/releases/download/v${pkgver}/kg-amd64-linux.tar.gz")
sha256sums=('36d77dd68c4d34662fbff640b942fd7c04dd95b1301b46cec605e3771d131968')
options=('!lto' '!debug')
_target_dir='target'

package() {
    cd "$srcdir"

    # Install kg binary
    install -Dm755 "bin/kg" -t "${pkgdir}/usr/bin/"

    # Install systemd user units
    install -Dm644 resources/systemd/kiro-generator.service -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 resources/systemd/kiro-generator.path -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 "resources/systemd/kiro-generator-local@.service" -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm644 "resources/systemd/kiro-generator-local@.path" -t "${pkgdir}/usr/lib/systemd/user/"

    # Install default environment files
    install -Dm644 resources/systemd/global.env -t "${pkgdir}/etc/kg/"
    install -Dm644 resources/systemd/home.env -t "${pkgdir}/etc/kg/"

    install -Dm644 resources/agents/kg-helper.json "${pkgdir}/usr/share/doc/${pkgname%-bin}/agents/kg-helper.json"
    # Install documentation
    # install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/"
    install -Dm644 resources/kg-helper/SKILL.md "${pkgdir}/usr/share/doc/${pkgname%-bin}/kg-helper/SKILL.md"
    (
        cd resources/kg-helper/references
        for md in *.md; do
            install -Dm644 "$md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/kg-helper/references/${md}"
        done
    )

    (
        cd resources/kg-helper/assets
        for md in *.*; do
            install -Dm644 "$md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/kg-helper/assets/${md}"
        done
    )
    (
        cd schemas
        for schema in *.json; do
            install -Dm644 "$schema" "${pkgdir}/usr/share/doc/${pkgname%-bin}/schemas/${schema}"
        done
    )
}
