# shellcheck shell=bash
# -*- mode: sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='gut'
pkgdesc='A beginner friendly porcelain for git'
pkgver=0.3.3
pkgrel=1
url="https://github.com/julien040/$pkgname"
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2e5af066ac8bcf46ef15cd9c788e57862c3dcb6119539eac100a71daee148e7d')

_pkgdate='2026-06-07'
_pkgver="$pkgver ($_pkgdate)"

prepare() {
  cd "$pkgname-$pkgver"

  sed -i "s|var gutVersion = \"dev\"|var gutVersion = \"$_pkgver\"|g" \
    src/telemetry/telemetry.go

  go mod tidy
}

build() {
  cd "$pkgname-$pkgver"

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

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external" \
    -mod=readonly \
    -modcacherw \
     .

  for _shell in bash fish zsh; do
    ./gut completion "$_shell" > "_completions.$_shell"
  done
}

check() {
  cd "$pkgname-$pkgver"

  go test ./...
  ./gut --version
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    "$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    {CONTRIBUTING,README,SECURITY,future_of_gut}.md
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  install -Dm0644 _completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm0644 _completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -Dm0644 _completions.zsh  \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

# eof
