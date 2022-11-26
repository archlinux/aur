# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-installer
pkgver=1.1.2
pkgrel=2
pkgdesc='Installer for BetterDiscord'
arch=('x86_64')
url='https://github.com/BetterDiscord/Installer'
license=('MIT')
replaces=('betterdiscord')
makedepends=('nodejs' 'yarn')
depends=('libxss')
source=("$pkgname-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz"
        'electron-13.patch::https://github.com/BetterDiscord/Installer/pull/289.patch')
sha256sums=('adac48dff0bf80aa08caa251900f61f863748a8d6c5b089f54947937a30e1bca'
            '26fc164838b8d981a80a9efdb03716ba663e176df46a5be5372d1426f204e1bb')

prepare() {
  cd Installer-${pkgver}
  patch -Np1 -i ../electron-13.patch
}

build() {
    cd Installer-${pkgver}
    export NODE_OPTIONS=--openssl-legacy-provider
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
