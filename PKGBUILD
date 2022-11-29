# Maintainer: Vendicated <vendicated at riseup dot net>

pkgname=armcord-git
pkgdesc="ArmCord dev build using the system electron. ArmCord is a custom client designed to enhance your Discord experience while keeping everything lightweight"
pkgver=r595.cdb73c3
pkgrel=2

arch=("x86_64" "aarch64")
url="https://github.com/ArmCord/ArmCord"
license=("custom:OSL-3.0")

makedepends=("git" "nodejs" "sed" "npm")
depends=("electron")
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("armcord")
conflicts=("armcord")

source=(
  "${pkgname}::git+${url}.git"
  "armcord.desktop"
  "armcord-launcher.sh"
)
sha256sums=('SKIP'
            'e6b66912e1a73d0646e58f41a6c6f414f45843cdb3900a6b4cf6ae0bf12ea90f'
            '5a37668b474263bc362bc322df4c90981710b9294e85a5ab0fd93b253e9ca2e2')

prepare() {
    sed -i "s/%VERSION%/$pkgver/" "$srcdir/armcord.desktop"
}

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  npx pnpm install --frozen-lockfile
  npm run packageQuick
}

package() {
  cd "$srcdir"

  install -Dm 644 "$pkgname/dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/share/armcord/app.asar"

  install -Dm 755 "armcord-launcher.sh" "$pkgdir/usr/bin/armcord"
  install -Dm 644 "armcord.desktop" "$pkgdir/usr/share/applications/armcord.desktop" 

  install -Dm 644 "$pkgname/build/icon.png" "$pkgdir/usr/share/pixmaps/armcord.png"
  install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
