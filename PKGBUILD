# Maintainer: Francesco Minnocci <ascoli dot mimnnocci at gmail dot com>

_gitname=spicetify-cli
pkgname="${_gitname}-git"
pkgver=2.16.1.r1.gd5cc68f
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client - Git master branch'
arch=('x86_64' 'i686')
url="https://github.com/spicetify/${_gitname}"
license=('LGPL2.1')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("${_gitname}")
conflicts=("${_gitname}")

pkgver() {
	cd "$srcdir/${_gitname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_gitname}"

  echo "#!/bin/sh
/usr/share/${_gitname}/spicetify \"\$@\"" > ./shortcut
}

build() {
	cd "$srcdir/${_gitname}"

  export GOPATH="$srcdir"
  go build -o spicetify

  # Clean up deps
  go clean -modcache
}

package() {
	cd "$srcdir/${_gitname}"

  install -Dm755 ./spicetify "$pkgdir"/usr/share/${_gitname}/spicetify
  cp -r ./Themes ./css-map.json ./Extensions ./CustomApps ./jsHelper ./globals.d.ts -t "$pkgdir"/usr/share/${_gitname}

  install -Dm755 ./shortcut "$pkgdir"/usr/bin/spicetify
}
# vim:set ts=2 sw=2 et:
