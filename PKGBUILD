# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='payme'
pkgname="${_pkgname}-git"
pkgver=1.2.4.r3.g5425749
pkgrel=2
pkgdesc='QR code generator (ASCII and PNG) for SEPA payments (development version)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/jovandeginste/payme'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  mkdir -p build
  go mod tidy
}

build() {
  cd "$_pkgname"

  _pkgver=$(git describe --tags --abbrev=0 --always | sed 's/^v//g')
  _pkgrev=$(git rev-parse --verify --short HEAD)

  case "Z$CARCH" in
    # Fix “ELF file lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK” error
    'Zaarch64' | 'Zx86_64' ) export LDFLAGS="$LDFLAGS -Wl,-z,shstk" ;;
  esac

  export CGO_ENABLED=1
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.gitRefName=$_pkgver -X main.gitCommit=$_pkgrev" \
    -mod=readonly -modcacherw \
    -o build

  for _shell in bash fish zsh; do
    "build/$_pkgname" completion "$_shell" > "_completion.$_shell"
  done
}

check() {
  cd "$_pkgname"

  build/payme --version
  go test ./...
}

package() {
  cd "$_pkgname"

  install -vDm0755 build/payme "$pkgdir/usr/bin/payme"
  install -vDm0644 README.md   "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 LICENSE     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -vDm0644 _completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -vDm0644 _completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -vDm0644 _completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# eof
