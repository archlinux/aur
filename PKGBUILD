# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-git
_pkgname=sunamu
pkgver=r54.86fb6f3be9
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Development version)"
url="https://github.com/AryToNeX/Sunamu"
license=("MPL-2.0")
arch=("any")
conflicts=(sunamu sunamu-bin)
makedepends=("git" "npm" "yarn" "node-gyp")
depends=("electron")

source=("${_pkgname}::git+https://github.com/AryToNeX/Sunamu"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
sha256sums=("SKIP"
            "61e7326922b6f1a58d894488df27264ed307e1c1e8a0bb3aea61f0fcaa9c2bd4"
            "3ec100c03e6653aeed2400109501c3209295d58e74e4dbc71dadcfad86ef910c")

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  # use system electron version
  # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
  electronDist="/usr/lib/electron"
  electronVer=$(sed s/^v// /usr/lib/electron/version)
  yarn install
  yarn build:dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "${pkgdir}/usr/lib/$_pkgname"
  dir=$(compgen -G "targets/linux*unpacked" | head -n1)
  cp -dr --no-preserve=ownership $dir/resources/* "${pkgdir}/usr/lib/$_pkgname/"

  install -Dm644 assets/icon.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
