# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: m040601 <m040601 at example dot org>

_pkgname='ov'
pkgname="${_pkgname}-git"
pkgver=0.39.0.r1.g6fe96f9
pkgrel=1
epoch=1
pkgdesc='Feature-rich terminal-based text pager (latest commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/noborus/ov'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=('ov')
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
install="$pkgname.install"
options=('lto')
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

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' )
      # RFC-0023: https://rfc.archlinux.page/0023-pack-relative-relocs/
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
      # Fix “ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.”
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
    * ) : pass ;;
  esac

  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.Version=$_ver -X main.Revision=$_rev" \
    -mod=readonly -modcacherw \
    -o build \
      .
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
    ./*.yaml README.md ov.plugin.zsh
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _shell in bash fish zsh; do
    "$pkgdir/usr/bin/$_pkgname" --completion "$_shell" > "completion.$_shell"
  done

  install -vDm0644 completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm0644 completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm0644 completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# eof
