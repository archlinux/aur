# Maintainer: Atakku <atakkudev@gmail.com>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=blockbench-git
pkgver=4.3.1
pkgrel=1
pkgdesc="A boxy 3D model editor, uses system electron and is built from git"
arch=('any')
url=https://github.com/JannisX11/blockbench
license=('GPL3')
provides=(blockbench)
conflicts=(blockbench)

_pkgname=blockbench
_electron=electron
_electronDist=/usr/lib/$_electron
_electronVersion=$(cat $_electronDist/version)

depends=("$_electron")
makedepends=(git npm)
source=("$_pkgname::git+$url#tag=v$pkgver"
        "$_pkgname.patch"
        "$_pkgname.desktop")
sha512sums=('SKIP'
            '5dfb2664a3f01267c6ad86cb124117a7ae20e1fd25d8b44f9ac009f3ae64d294024d0c51baf6a4c133404c23eb193d8a5bd7eccd12bf9efd20e1e0853b7d82dc'
            '747623aba679a06edc4013232565200b1b7f95d1e2e15db9dba851b43fea139064fcb306e0696c1b8d83d2f9ac065ac7971441261072ce850d8013c1269cb91f')

prepare() {
  cd "$srcdir"/$_pkgname
  # apply our custom patch
  # * BrowserWindow's icon uses nativeImage.createFromPath (https://github.com/electron/electron/issues/24221)
  # * Removing code pertaining to electron-updater (because we dont need it)
  git apply "$srcdir"/$_pkgname.patch
  # installs all dependencies except electron-updater
  npm remove electron-updater
}

build() {
  cd "$srcdir"/$_pkgname
  npm run dist -- --linux --x64 --dir -c.electronDist=$_electronDist -c.electronVersion=$_electronVersion
}

package() {
  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  install -d "$pkgdir"/$_electronDist/resources
  echo -e "#!/bin/bash\nexec $_electron $_electronDist/resources/$_pkgname.asar \"\$@\"" > "$pkgdir"/usr/bin/$_pkgname
  chmod 755 "$pkgdir"/usr/bin/$_pkgname
  install "$srcdir"/$_pkgname/icon.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install "$srcdir"/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install "$srcdir"/$_pkgname/dist/linux-unpacked/resources/app.asar "$pkgdir"/$_electronDist/resources/$_pkgname.asar
  cp -r "$srcdir"/$_pkgname/dist/linux-unpacked/resources/app.asar.unpacked "$pkgdir"/$_electronDist/resources/$_pkgname.asar.unpacked
}
