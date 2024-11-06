# Maintainer:
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_pkgname="revolt-desktop"
pkgname="$_pkgname"
pkgver=1.0.8
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

_pkgsrc="desktop-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"https://github.com/revoltchat/desktop/archive/v$pkgver.$_pkgext"
)
sha256sums=(
  'cec46eca480d3bf011c9ef3066b74366d706de525b432a9522156534c84ee519'
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
  cp --reflink=auto -a dist/linux-unpacked/resources/* "$pkgdir/usr/lib/$_pkgname/"

  install -Dm644 build/icons/icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 "revolt-desktop.desktop" -t "$pkgdir/usr/share/applications"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env bash
exec electron /usr/lib/$_pkgname/app.asar "\$@"
END

  chown -R u+rwX,go+rX,go-w "$pkgdir/"
}
