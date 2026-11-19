# Maintainer: Your Name <you at example dot com>

pkgname=tea-dash
pkgver=0.3.9
pkgrel=1
pkgdesc='Terminal dashboard for Gitea/Forgejo, in the spirit of gh-dash'
arch=('x86_64' 'aarch64')
url='https://github.com/gbarany/tea-dash'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('git: checkout, push and branch actions'
            'gitea-cli: obtain a token via tokenCommand (gt auth token)')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('e34bf03ba3e4e2485e92f1e7d5233fae01cd2d91d42aafc8dfec56e807b7e9de')

prepare() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local _pkg=github.com/gbarany/tea-dash/internal/build
  local _commit _date
  _commit=$(git rev-parse --short=7 HEAD)
  _date=$(TZ=UTC git log -1 --format=%cd --date=format-local:%Y-%m-%dT%H:%M:%SZ)

  go build -o tea-dash \
    -ldflags "-linkmode=external \
      -X $_pkg.Version=$pkgver \
      -X $_pkg.Commit=$_commit \
      -X $_pkg.Date=$_date" \
    .
}

check() {
  cd "$pkgname"
  export GOPATH="$srcdir/gopath"
  go test -mod=readonly ./...
}

package() {
  cd "$pkgname"
  install -Dm755 tea-dash -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/tea-dash.yml -t "$pkgdir/usr/share/doc/$pkgname/examples/"
  install -Dm644 schema.json -t "$pkgdir/usr/share/$pkgname/"
}
