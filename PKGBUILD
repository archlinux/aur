# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='omnom'
pkgname="$_pkgname-git"
pkgdesc='A webpage bookmarking and snapshotting service (development version)'
pkgver=0.9.0.r1.g8b9c2b7
pkgrel=2
url='https://github.com/asciimoo/omnom'
arch=('aarch64' 'x86_64')
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
makedepends=('git' 'go')
depends=('glibc')
provides=("$_pkgname")
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  local _ver=''; _ver="$(pkgver)"

  cd "$_pkgname"

  git clean -dfx
  mkdir -p build
  go mod tidy

  sed -i "s/Version: \"v0.2.0\"/Version: \"$_ver\"/g" cmd/cmd.go
}

build() {
  cd "$_pkgname"

  case "Z$CARCH" in
    'Zaarch64' | 'Zx86_64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  _opts=(
    '-buildmode=pie'
    '-ldflags=-linkmode=external'
    '-mod=readonly'
    '-modcacherw'
    '-trimpath'
  )
  go build "${_opts[@]}" -o build .

  for _shell in bash fish zsh; do
    build/omnom completion "$_shell" > "build/_completions.$_shell"
  done
}

check() {
  cd "$_pkgname"

  build/omnom --version
}

package() {
  cd "$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    build/omnom
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md config.yml_sample

  install -Dm0644 build/_completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm0644 build/_completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm0644 build/_completions.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  cd "$pkgdir/usr/share/doc" && ln -sf "$pkgname" "$_pkgname"
}

# eof
