# Maintainer: RemixDev <RemixDev64@gmail.com>

pkgname="deemix-gui-git"
_pkgname="deemix-gui"
pkgver=r113.46980af0b6
pkgrel=2
pkgdesc="A gui electron app for the deemix lib"
arch=('x86_64')
url="https://gitlab.com/RemixDev/$_pkgname"
license=('gpl3')
depends=('electron')
makedepends=('git' 'npm')
provides=('deemix-gui')
source=("${_pkgname}::git+https://gitlab.com/RemixDev/$_pkgname" "deemix-webui::git+https://gitlab.com/RemixDev/deemix-webui"
        "$_pkgname.desktop" "$_pkgname.sh")
md5sums=('SKIP' 'SKIP'
         '89b112a6469203b6596ddd6a7efc91a6'
         '99c9ff0e767cb8554658c6465e239d5c')

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

prepare() {
  cd deemix-gui
  git submodule init
  git config submodule.webui.url $srcdir/deemix-webui
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"

  # use system electron version
  # see: https://wiki.archlinux.org/index.php/Electron_package_guidelines
  electronDist='/usr/lib/electron'
  electronVer=$(sed s/^v// /usr/lib/electron/version)
  sed -i '/		"electron": /d' ./package.json
  HOME="$srcdir/.electron-gyp" npm install --cache "${srcdir}/npm-cache" --force
  ./node_modules/.bin/electron-builder build --linux --x64 --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "${pkgdir}/usr/lib/$_pkgname"
  cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "${pkgdir}/usr/lib/$_pkgname/"

  install -Dm644 build/icon.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
