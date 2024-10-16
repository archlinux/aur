# Maintainer:
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_pkgname="revolt-desktop"
pkgname="$_pkgname"
pkgver=1.0.7
pkgrel=1
pkgdesc="User-first chat platform built with modern web technologies"
url="https://github.com/revoltchat/desktop"
license=('AGPL-3.0-only')
arch=('any')

depends=(
  'electron'
)
makedepends=(
  'npm'
  'nodejs'
)

_pkgsrc="desktop-1.0.7"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"https://github.com/revoltchat/desktop/archive/v$pkgver.$_pkgext"
)
sha256sums=(
  '4dcea2c0dac3920ea47e3daf2770d471da7a148e530f1e24df2aed39d45e5485'
)

build() {
  cd "$_pkgsrc"

  electronDist=/usr/lib/electron
  electronVer=$(cat /usr/lib/electron/version)

  sed -E 's&"electron": "[^"]+",&"electron": "^'$electronVer'",&' -i package.json
  HOME="$srcdir/.electron-gyp" npm install --cache "$srcdir/npm-cache"
  npm run build:bundle

  ./node_modules/.bin/electron-builder -l dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$_pkgsrc"

  install -dm755 "$pkgdir/usr/lib/$_pkgname"
  cp -dr --no-preserve=ownership dist/linux-unpacked/resources/* "$pkgdir/usr/lib/$_pkgname/"

  install -Dm644 build/icons/icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 "revolt-desktop.desktop" -t "$pkgdir/usr/share/applications"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash
exec electron /usr/lib/$_pkgname/app.asar "\$@"
END
}
