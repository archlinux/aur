# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu
pkgver=2.1.0
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way!"
url="https://github.com/NyaomiDEV/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "i686" "armv7h" "aarch64")
conflicts=(sunamu-git sunamu-bin)
makedepends=("git" "npm" "yarn" "node-gyp" "nvm")
depends=("electron19" "libvips")

source=("${pkgname}::git+https://github.com/NyaomiDEV/Sunamu#tag=v$pkgver"
        "${pkgname}.desktop"
        "${pkgname}.sh")
sha256sums=("SKIP"
            "61e7326922b6f1a58d894488df27264ed307e1c1e8a0bb3aea61f0fcaa9c2bd4"
            "0011819bc377cc6e39dd413f3c968ea45478d6ea140c2774bdba88ae343db410")

build() {
  cd "$srcdir/$pkgname"

  # use system electron version
  # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
  electronDist="/usr/lib/electron19"
  electronVer=$(pacman -Q $(pacman -Qqo $electronDist) | cut -d " " -f2 | cut -d "-" -f1)

  # use nvm but isolate it for this shell
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

  # ensure .nvmrc version is installed
  nvm install --no-progress "$(cat "$srcdir/$pkgname/.nvmrc")"

  yarn install
  yarn build:dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "${pkgdir}/usr/lib/$pkgname"
  dir=$(compgen -G "targets/linux*unpacked" | head -n1)
  cp -dr --no-preserve=ownership $dir/resources/* "${pkgdir}/usr/lib/$pkgname/"

  install -Dm644 assets/icons/icon.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
