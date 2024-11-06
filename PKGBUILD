# Maintainer:
# Contributor: Paul Makles <paulmakles@gmail.com>

_pkgname="revolt-desktop"
pkgname="$_pkgname-git"
pkgver=1.0.8.r0.gd668949
pkgrel=1
pkgdesc="User-first chat platform built with modern web technologies"
url="https://github.com/revoltchat/desktop"
license=('AGPL-3.0-only')
arch=('any')

depends=(
  'electron'
)
makedepends=(
  'git'
  'npm'
  'nodejs'
)

conflicts=("$_pkgname")
provides=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

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

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
