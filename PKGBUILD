# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu
pkgver=1.1.1
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way!"
url="https://github.com/AryToNeX/Sunamu"
license=('MPL-2.0')
arch=('x86_64')
conflicts=(sunamu-git sunamu-bin)
makedepends=("git" "npm" "node-gyp")
depends=("electron")

source=("$pkgname-$pkgver.tar.gz::https://github.com/AryToNeX/Sunamu/archive/v$pkgver.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=("09620046e32c219ebb08f899235d4384d3e4a5ed82094aa33743716032c9aab6"
            "61e7326922b6f1a58d894488df27264ed307e1c1e8a0bb3aea61f0fcaa9c2bd4"
            "3ec100c03e6653aeed2400109501c3209295d58e74e4dbc71dadcfad86ef910c")

build() {
  cd "$srcdir/Sunamu-$pkgver"
  
  # use system electron version
  # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
  electronDist="/usr/lib/electron"
  electronVer=$(sed s/^v// /usr/lib/electron/version)
  yarn install
  yarn build:dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/Sunamu-$pkgver"
  install -dm755 "${pkgdir}/usr/lib/$pkgname"
  cp -dr --no-preserve=ownership targets/linux-unpacked/resources/* "${pkgdir}/usr/lib/$pkgname/"

  install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
