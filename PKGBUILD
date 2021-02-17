# Maintainer: cookie-monstar <rnr1410@gmail.com>

pkgname=blockbench-git
pkgver=3.7.5
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
            'c31d9a35f2cb769c1d7094fb5b97639796a967f5319d19b5370bd5d72889d636ed203edeb1782e473c4f66188c88c3c300f5d19f572ce797a216a45aea7573f3'
            'dcb8be4a330f5e56893d3238cf08e808926f6c4932328f07420b824d87a4b1ada2f1682e5af78083a2acb2b85992ce542eb96e7e3c9fea62dc265bade59dad5f')

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
}
