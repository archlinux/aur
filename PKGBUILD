# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Kemel Zaidan <kemelzaidan at gmail dot com>

pkgname='packemon-git'
_pkgname="${pkgname/-git/}"
pkgver=1.8.3.r0.g6d4ab66
pkgrel=1
pkgdesc='TUI tool for sending packets of arbitrary input and monitoring packets on any network interfaces (development version)'
arch=('aarch64' 'x86_64')
license=('BSD-2-Clause')
url='https://github.com/ddddddO/packemon'
makedepends=('awk' 'git' 'go')
depends=('glibc')
checkdepends=('iproute2')
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')
install="$pkgname.install"

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

  install -vDm0755 -t "$pkgdir/usr/bin" build/packemon
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" CREDITS ./*.md
}

# eof
