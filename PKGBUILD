# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: m040601 <m040601 at example dot org>

_pkgname='ov'
pkgname="${_pkgname}-git"
pkgver=0.45.1.r21.g33c3a70
pkgrel=1
epoch=1
pkgdesc='Feature-rich terminal-based text pager (development version)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/noborus/ov'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=('ov')
conflicts=("${provides[@]}")
makedepends=('git' 'go')
depends=('glibc')
optdepends=(
  'xclip: for clipboard use'
  'xsel: for clipboard use (alternative)'
)
source=("git+$url.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
  | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  mkdir -vp build
  go mod tidy
}

build() {
  cd "$_pkgname"

  _ver=$(git describe --tags --abbrev=0 --always | sed 's/^v//g')
  _rev=$(git rev-parse --verify --short HEAD)

  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zaarch64' )
      # Fix “ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.”
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.Version=$_ver -X main.Revision=$_rev" \
    -mod=readonly \
    -modcacherw \
    -o build .

  for _shell in bash fish zsh; do
    build/ov --completion "$_shell" > "build/_completion.$_shell"
  done
}

check() {
  cd "$_pkgname"

  go test ./...

  build/ov --version
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" \
    build/ov
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md ./*.yaml ov.plugin.zsh
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  install -vDm0644 build/_completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm0644 build/_completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm0644 build/_completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# eof
