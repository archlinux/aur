# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='payme'
pkgname="${_pkgname}-git"
pkgver=1.2.1.r0.g3807082
pkgrel=1
pkgdesc='QR code generator (ASCII and PNG) for SEPA payments (built from latest commit)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/jovandeginste/payme'
license=('MIT')  # SPDX-License-Identifier: MIT
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc')
makedepends=('git' 'go')
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
}

build() {
  cd "$_pkgname"

  _pkgver=$(git describe --tags --abbrev=0 --always | sed 's/^v//g')
  _pkgrev=$(git rev-parse --verify --short HEAD)

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
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
    -ldflags="-linkmode=external -X main.gitRefName=$_pkgver -X main.gitCommit=$_pkgrev" \
    -mod=readonly -modcacherw \
    -o build

  for _shell in bash fish zsh; do
    "build/$_pkgname" completion "$_shell" > "_completion.$_shell"
  done
}

check() {
  cd "$_pkgname"

  go test ./...
}

package() {
  cd "$_pkgname"

  # Be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install "-${_v}Dm0755" "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install "-${_v}Dm0644" README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install "-${_v}Dm0644" LICENSE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Bash
  install "-${_v}Dm0644" _completion.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  # Fish
  install "-${_v}Dm0644" _completion.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  # Zsh
  install "-${_v}Dm0644" _completion.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}

# eof
