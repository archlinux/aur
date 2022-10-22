# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-installer
pkgver=1.1.2
pkgrel=1
pkgdesc='Installer for BetterDiscord'
arch=('x86_64')
url='https://github.com/BetterDiscord/Installer'
license=('MIT')
replaces=('betterdiscord')
makedepends=('nodejs' 'yarn')
depends=('libxss')
source=("$pkgname-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('adac48dff0bf80aa08caa251900f61f863748a8d6c5b089f54947937a30e1bca')

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
