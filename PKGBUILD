# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='mermaid-ascii'
pkgname="$_pkgname-git"
pkgver=0.7.0.r0.g14ea0d2
pkgrel=1
pkgdesc='Render Mermaid graphs inside your terminal (development version)'
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
url='https://github.com/AlexanderGrooff/mermaid-ascii'
source=("$_pkgname::git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"

  git clean -dfx
  go mod tidy
}

pkgver() {
  cd "$_pkgname"

  git describe --tags --long \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zaarch64' )
      # Fix “ELF file lacks GNU_PROPERTY_*_FEATURE_1_SHSTK.”
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
  go build "${_opts[@]}" .

  for _shell in bash fish zsh; do
    ./mermaid-ascii completion "$_shell" > "_completion.$_shell"
  done
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" "$_pkgname"
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  install -vDm0644 _completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm0644 _completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm0644 _completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# eof
