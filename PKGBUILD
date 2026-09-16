# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=profilecli
pkgver=2.3.1
pkgrel=1
pkgdesc='CLI for Grafana Pyroscope, the continuous profiling aggregation system'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/pyroscope'
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go')
conflicts=('profilecli-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/grafana/pyroscope/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b48110650d3dbb6beabdd64a44ab89518ff73449b71ea5ff783818b8d2ac1e6')

_srcname="pyroscope-$pkgver"
# Upstream stamps the version into this package; see its Makefile GO_LDFLAGS.
_vprefix='github.com/grafana/pyroscope/v2/pkg/util/build'

prepare() {
  cd "$_srcname"
  go mod download
}

build() {
  cd "$_srcname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  # -buildvcs=false: $srcdir lives inside this package's own git repo, so Go's
  # automatic VCS stamping would record *this* repo's commit as vcs.revision and
  # `profilecli --version` would report it (as "<aur commit>-modified").
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -buildvcs=false"

  # Without the -X stamps `profilecli --version` reports an empty version.
  # Revision/BuildDate are left unset: neither is knowable from a source
  # tarball, and BuildDate would break reproducibility.
  go build -o "$srcdir/$pkgname" \
    -ldflags "-linkmode=external -X $_vprefix.Version=$pkgver -X $_vprefix.Branch=HEAD" \
    ./cmd/profilecli

  # kingpin derives the completion function and `complete` target names from
  # basename($0), so these must be generated from a binary already named
  # `profilecli` — which is why build() writes to $srcdir under that name.
  "$srcdir/$pkgname" --completion-script-bash >"$srcdir/$pkgname.bash"
  "$srcdir/$pkgname" --completion-script-zsh >"$srcdir/_$pkgname"
}

check() {
  cd "$_srcname"
  go test ./cmd/profilecli/...
}

package() {
  install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/$pkgname.bash" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 "$srcdir/_$pkgname" \
    "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  install -Dm644 "$_srcname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
