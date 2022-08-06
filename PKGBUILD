# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-git
_pkgname=sunamu
pkgver=r236.6948d1fc89
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Development version)"
url="https://github.com/NyaomiDEV/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "i686" "armv7h" "aarch64")
conflicts=(sunamu sunamu-bin)
makedepends=("git" "npm" "yarn" "node-gyp" "nvm")
depends=("electron19" "libvips")

source=("${_pkgname}::git+https://github.com/NyaomiDEV/Sunamu"
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
  electronDist="/usr/lib/electron19"
  electronVer=$(pacman -Q $(pacman -Qqo $electronDist) | cut -d " " -f2 | cut -d "-" -f1)

  # use nvm but isolate it for this shell
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="$srcdir/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]

  # ensure .nvmrc version is installed
  nvm install --no-progress "$(cat "$srcdir/$_pkgname/.nvmrc")"

  yarn install
  yarn build:dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "${pkgdir}/usr/lib/$_pkgname"
  dir=$(compgen -G "targets/linux*unpacked" | head -n1)
  cp -dr --no-preserve=ownership $dir/resources/* "${pkgdir}/usr/lib/$_pkgname/"

  install -Dm644 assets/icons/icon.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
