# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-installer
pkgver=1.1.1
pkgrel=3
pkgdesc='Installer for BetterDiscord'
arch=('x86_64')
url='https://github.com/BetterDiscord/Installer'
license=('MIT')
replaces=('betterdiscord')
makedepends=('nodejs' 'yarn')
depends=('libxss')
source=("$pkgname-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('8431545ae012dc62e7b1fdc45ecc7bbd79a5a5b44d91ebdfcb85d571e12012d4')

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
