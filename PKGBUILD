# Maintainer:

_pkgname="zrepl"
pkgname="$_pkgname-git"
pkgver=0.6.1.r39.g2923009
pkgrel=1
pkgdesc="One-stop ZFS backup & replication solution"
url="https://github.com/zrepl/zrepl"
license=('MIT')
arch=('x86_64')

depends=(
  'glibc'
)
makedepends=(
  'go'
  'git'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  sed -e 's&/usr/local/bin/&/usr/bin/&g' -i "$_pkgsrc/dist/systemd/$_pkgname.service"
}

build() {
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  export GO_LDFLAGS="-X github.com/zrepl/zrepl/version.zreplVersion=$pkgver"

  cd "$_pkgsrc"
  go build -o "$_pkgname" .
}

package() {
  install -Dm755 "$_pkgsrc/$_pkgname" -t "$pkgdir/usr/bin/"

  install -Dm644 "$_pkgsrc/dist/systemd/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -dm755 "$pkgdir/usr/share/$_pkgname/samples"
  cp --reflink=auto -a "$_pkgsrc"/internal/config/samples/* "$pkgdir/usr/share/$_pkgname/samples/"

  install -dm755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/$_pkgname" gencompletion zsh "$pkgdir/usr/share/zsh/site-functions/_zrepl"

  install -dm755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/$_pkgname" gencompletion bash "$pkgdir/usr/share/bash-completion/completions/zrepl"

  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
