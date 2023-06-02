# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-installer
pkgver=1.3.0
pkgrel=1
pkgdesc='Installer for BetterDiscord'
arch=('x86_64')
url='https://github.com/BetterDiscord/Installer'
license=('MIT')
replaces=('betterdiscord')
makedepends=('git' 'nodejs' 'yarn')
depends=('libxss')
source=("$pkgname-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('aecc83656770ff4d91aa0c4650e4774c162d47766e149ab2b8e0287ec52c4857')

build() {
    cd Installer-${pkgver}
    yarn && yarn dist:dir
}

package() {
    cd Installer-${pkgver}
    mkdir -p "$pkgdir"/usr/bin "$pkgdir"/opt
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cp --preserve=mode -r dist/linux-unpacked "$pkgdir"/opt/BetterDiscord
    install -Dm755 /dev/stdin "$pkgdir"/usr/bin/betterdiscord-installer <<'EOF'
#!/usr/bin/sh

exec env BD_SKIP_UPDATECHECK=1 /opt/BetterDiscord/betterdiscord-installer "$@"
EOF
}
