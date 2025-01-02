# -*- sh -*-

# Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='dstask'
pkgname="$_pkgname-git"
pkgver=0.27.r0.g48999d7
pkgrel=4
pkgdesc='Git-powered terminal-based todo/note manager with full markdown note for each task (latest commit)'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64' )
url='https://github.com/naggie/dstask'
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc')
makedepends=('git' 'go')
options=('lto')
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  go mod tidy
}

build() {
  cd "$_pkgname"

  local _commit='', _utcnow=''

  _commit=$(git describe --always)
  _utcnow=$(date -u '+%FT%TZ')

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

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    _GOLDFLAGS="-linkmode=external \
      -X \"github.com/naggie/dstask.GIT_COMMIT=$_commit\"
      -X \"github.com/naggie/dstask.VERSION=$pkgver\"
      -X \"github.com/naggie/dstask.BUILD_DATE=$_utcnow\""

  go build -ldflags="${_GOLDFLAGS}" -o dstask        ./cmd/dstask/main.go
  go build -ldflags="${_GOLDFLAGS}" -o dstask-import ./cmd/dstask-import/main.go
}

package() {
  cd "$_pkgname"

  install -vDm0755 -t "$pkgdir/usr/bin" dstask{,-import}
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  ./dstask bash-completion \
    | install -vDm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  ./dstask fish-completion \
    | install -vDm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
  ./dstask zsh-completion  \
    | install -vDm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/$_pkgname"
}

# eof
