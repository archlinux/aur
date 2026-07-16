# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Kemel Zaidan <kemelzaidan at gmail dot com>

pkgname='packemon-git'
_pkgname="${pkgname/-git/}"
pkgdesc='TUI tool for sending packets of arbitrary input and monitoring packets on any network interfaces (development version)'
pkgver=1.8.26.r0.g3f0cf76
pkgrel=1
url='https://github.com/ddddddO/packemon'
install="$_pkgname.install"
arch=('aarch64' 'x86_64')
license=('BSD-2-Clause')
checkdepends=('iproute2')
makedepends=('awk' 'git' 'go')
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
  cd "$_pkgname"

  git clean -dfx
  go mod tidy
  mkdir -p build

  cd tc_program && go generate
}

build() {
  cd "$_pkgname"

  case "Z$CARCH" in
    'Zaarch64' | 'Zx86_64' )
      export LDFLAGS="$LDFLAGS -Wl,-z,shstk"
    ;;
  esac

  export CGO_ENABLED=1
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  local _all=unset, _ver=unset, _rev=unset
  _all=$(git describe --long --tags)
  _ver=$(awk -F- '{print $1}'  <<< "$_all" | sed 's/^v//g')
  _rev=$(awk -F- '{print $NF}' <<< "$_all" | sed 's/^g//g')

  go build \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode=external -X main.Version=$_ver -X main.Revision=$_rev" \
    -mod=readonly \
    -modcacherw \
    -o build/packemon \
      cmd/packemon/*.go
}

check() {
  cd "$_pkgname"

  go test
  chmod +x build/packemon
  build/packemon --version
}

package() {
  cd "$_pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" build/packemon
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" CREDITS ./*.md
}

# eof
