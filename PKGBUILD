# PKGBUILD forked from https://aur.archlinux.org/packages/exercism by:
# Maintainer: Severen Redwood <sev@severen.dev>
# Maintainer: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: Federico Squartini <federico.squartini at gmail dot com>

# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
_pkgname=exercism
pkgname=exercism-git
pkgver=3.5.9.r0.g4223e01
pkgrel=1
pkgdesc="Command line tool for exercism.io -- special edition::(extra cool and swag mode)!"
arch=("x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("git+$url")
provides=("$_pkgname")
conflicts=("$_pkgname")
b2sums=('SKIP')

pkgver() {
  cd cli
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  export GOPATH="$srcdir/.gopath"

  mkdir -p "$GOPATH/src/github.com/exercism"
  ln -sf "$srcdir/cli" "$GOPATH/src/github.com/exercism/cli"
}

build() {
  export GOPATH="$srcdir/.gopath"
  cd "$GOPATH/src/github.com/exercism/cli"

  go build \
    -trimpath \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -modcacherw \
    -o out/exercism \
    exercism/main.go
}

package() {
  cd cli
  install -D out/exercism "$pkgdir/usr/bin/exercism"

  install -D -m644 shell/exercism_completion.bash "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -D -m644 shell/exercism_completion.zsh "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
  install -D -m644 shell/exercism.fish "$pkgdir/usr/share/fish/vendor_completions.d/exercism.fish"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
