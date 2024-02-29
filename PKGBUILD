# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='ovcs'
pkgname="${_pkgname}-git"
pkgver=0.16.0.r0.g7efcf3c
pkgrel=1
pkgdesc='The client/server of the terminal pager ov (built from latest commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/noborus/ovcs'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("$_pkgname")
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

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
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
