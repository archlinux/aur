# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='ovcs'
pkgname="${_pkgname}-git"
pkgver=0.16.1.r8.gd3d3968
pkgrel=2
pkgdesc='The client/server of the terminal pager ov (latest git commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/noborus/ovcs'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("${provides[@]}")
depends=('glibc')
makedepends=('git' 'go')
optdepends=('bash: used by examples mysql.sh and psql.sh')
source=("git+$url.git")
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy

  _ver=$(git describe --tags --abbrev=0 --always | sed 's/^v//g')
  _rev=$(git rev-parse --verify --short HEAD)

  sed -i "s/Version = \"dev\"/Version = \"$_ver\"/g"    cmd/root.go
  sed -i "s/Revision = \"HEAD\"/Revision = \"$_rev\"/g" cmd/root.go
}

build() {
  cd "$_pkgname"

  case "Z${CARCH:-unknown}" in
    'Zx86_64' )
      # RFC-0023: https://rfc.archlinux.page/0023-pack-relative-relocs/
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
      # Fix shadow stack error message
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
    -ldflags='-linkmode=external' \
    -mod=readonly -modcacherw \
    -o build
}

check() {
  cd "$_pkgname"

  go test
}

package() {
  cd "$_pkgname"

  install -vDm0755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -vDm0644  README.md        "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644  {my,p}sql.sh -t  "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm0644  LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _shell in bash fish zsh; do
    "$pkgdir/usr/bin/$_pkgname" completion "$_shell" > "completion.$_shell"
  done

  install -vDm0644 completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm0644 completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm0644 completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# eof
