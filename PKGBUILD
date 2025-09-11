# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='moor'
pkgname="$_pkgname-git"
pkgver=2.1.1.r0.g36e76c6
pkgrel=1
epoch=1
pkgdesc='Pager designed to just do the right thing without any configuration (development version)'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/walles/moor'
license=('BSD-2-Clause-Views')  # SPDX-License-Identifier: BSD-2-Clause-Views
provides=('moor')
conflicts=("${provides[@]}" moar)
replaces=('moar-git')
depends=('glibc')
makedepends=('git' 'go')
source=("git+$url.git")
#install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --abbrev=7 2>/dev/null \
  | sed 's/\([^-]*-g\)/r\1/;s/^v//;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  git clean -dfx
  go mod tidy
}

build() {
  cd "$_pkgname"

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

  _opts=(
    -buildmode=pie
    -trimpath
    -ldflags="-linkmode=external -X main.versionString=$pkgver"
    -mod=readonly
    -modcacherw
  )
  go build "${_opts[@]}" ./cmd/moor
}

check() {
  cd "$_pkgname"

  printf 'moor %s\n' "$(./moor -version)"
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" moor
  install -vDm0644 -t "$pkgdir/usr/share/man/man1" moor.1
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# eof
