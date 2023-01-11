# Maintainer: Vendicated <vendicated at riseup dot net>

pkgname=armcord-git
pkgdesc="ArmCord dev build using the system electron. ArmCord is a custom client designed to enhance your Discord experience while keeping everything lightweight"
pkgver=r756.81273de
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/ArmCord/ArmCord"
license=("custom:OSL-3.0")

makedepends=("git" "nodejs" "npm")
depends=("electron")
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

install="notes.install"

provides=("armcord")
conflicts=("armcord")

source=(
  "${pkgname}::git+${url}.git"
  "armcord.desktop"
  "armcord-launcher.sh"
  "notes.install"
)
sha256sums=('SKIP'
            'a964b66a4829eb2fe86a0fa4841a67a9fd3264dfea960aa4cacf2a64c0200d93'
            '87eab1a06ee59701abe9eb97c8ec062f5a335e69510b915e6b5dce87558fe84a'
            '1eb8ba4094bd80b4e62e02198aa07bccf3d77937e01f627d2a580b8b0a4de076')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  npx pnpm install --frozen-lockfile --ignore-scripts
  npm run packageQuick
}

package() {
  cd "$srcdir"

  install -Dm 644 "$pkgname/dist/"*"-unpacked/resources/app.asar" "$pkgdir/usr/share/armcord/app.asar"

  install -Dm 755 "armcord-launcher.sh" "$pkgdir/usr/bin/armcord"
  install -Dm 644 "armcord.desktop" "$pkgdir/usr/share/applications/armcord.desktop" 

  install -Dm 644 "$pkgname/build/icon.png" "$pkgdir/usr/share/pixmaps/armcord.png"
  install -Dm 644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
