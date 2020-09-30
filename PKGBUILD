# Maintainer: Francesco Minnocci <ascoli dot mimnnocci at gmail dot com>

_gitname=spicetify-cli
pkgname="${_gitname}-git"
pkgver=v1.1.0.r16.gdb34ac4
pkgrel=1
pkgdesc='Command-line tool to customize Spotify client - Git master branch'
arch=('x86_64' 'i686')
url="https://github.com/khanhas/${_gitname}"
license=('GPL')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')
provides=("${_gitname}")
conflicts=("${_gitname}")

pkgver() {
	cd "$srcdir/${_gitname}"

	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"

  export GOPATH="$srcdir"
  go build -o spicetify
}

check() {
	cd "$srcdir/${_gitname}"

  ./spicetify -v
}

package() {
	cd "$srcdir/${_gitname}"

  install -Dm755 ./spicetify "$pkgdir"/usr/share/${_gitname}/spicetify
  cp -r ./Themes ./Extensions ./CustomApps ./jsHelper ./globals.d.ts "$pkgdir"/usr/share/${_gitname}

  rm -f ./wrapper
  echo "#!/bin/sh
/usr/share/${_gitname}/spicetify \"\$@\"" >> ./wrapper
  install -Dm755 ./wrapper "$pkgdir"/usr/bin/spicetify

  # Clean up deps
  go clean -modcache
}

# vim:set ts=2 sw=2 et:
