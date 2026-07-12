# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: m040601 <m040601 at example dot org>

_pkgname='ov'
pkgname="${_pkgname}-git"
pkgdesc='Feature-rich terminal-based text pager (development version)'
pkgver=0.54.0.r0.g0a791c8
pkgrel=1
epoch=1
url='https://github.com/noborus/ov'
install="$_pkgname.install"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
license=('MIT')
makedepends=('git' 'go')
depends=('glibc')
optdepends=(
  'xclip: for clipboard use'
  'xsel: for clipboard use (alternative)'
)
provides=('ov')
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags \
    | sed 's/^v//;s/-rc\d*//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  mkdir -p build
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
    build/ov --completion "$_shell" > "build/_completions.$_shell"
  done
}

check() {
  cd "$_pkgname"

  go test ./...

  build/ov --version
}

package() {
  cd "$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    build/ov
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md ./*.yaml ov.plugin.zsh
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  install -Dm0644 build/_completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm0644 build/_completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  install -Dm0644 build/_completions.zsh \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -srf "$pkgname" "$_pkgname"
  done
}

# eof
