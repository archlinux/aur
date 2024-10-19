# Maintainer: SomeAspy <amb@aspy.dev>
pkgname=legcord-git
# Defined by function
pkgver=r1612.b78c779 
pkgrel=1

pkgdesc="Legcord dev build using the system electron. Legcord is a custom client designed to enhance your Discord experience while keeping everything lightweight"
arch=("x86_64" "aarch64")
url="https://github.com/Legcord/Legcord"
license=("custom:OSL-3.0")
depends=("electron")
makedepends=("git" "nodejs" "yarn-pnpm-corepack")
checkdepends=()
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)
provides=(legcord)
conflicts=(
	'armcord'
	'legcord'
)
replaces=(armcord)
install="notes.install"

source=(
  "${pkgname}::git+${url}.git"
  "legcord.desktop"
  "legcord-launcher.sh"
  "notes.install"
)

sha256sums=('SKIP'
            '94ac20d815a7d3236fc03f3355f7c304ca32bb0db215dc933b3617143d207c13'
            '5ca350f037728b8a96ddb434d2a69adfb7da83786486ea3c460163957ee442f9'
            'c9827dcdde818937b51cb75ea655f645418ca3e6db0f105619a1c19530ba8955')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  pnpm install --frozen-lockfile --ignore-scripts
  pnpm run packageQuick
}

package() {
  cd "$srcdir"

  install -Dm 644 "$pkgname/dist/"*"-unpacked/resources/app.asar" "$pkgdir/usr/share/legcord/app.asar"

  install -Dm 755 "legcord-launcher.sh" "$pkgdir/usr/bin/legcord"
  install -Dm 644 "legcord.desktop" "$pkgdir/usr/share/applications/legcord.desktop" 

  install -Dm 644 "$pkgname/build/icon.png" "$pkgdir/usr/share/pixmaps/legcord.png"
  install -Dm 644 "$pkgname/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
