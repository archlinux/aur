# Maintainer: Nikolai Rodionov <allanger@zohomail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Thomas Hobson <thomas /at/ hexf.me>

pkgname=chart-testing
pkgver=3.10.0
pkgrel=1
pkgdesc='CLI tool for linting and testing Helm charts'
arch=('x86_64' 'aarch64' 'armv6h')
url='https://github.com/helm/chart-testing'
license=('Apache')
depends=('kubectl' 'git' 'yamllint' 'helm' 'yamale')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cf22fabe2293805a4d091d55f9a62b8c1ae039518bc26e56b4aa68d8868ff5ff')
backup=('etc/ct/lintconf.yaml')

build() {
  local _commit=
  _commit=$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)
  local -a x=(
    BuildDate="$(TZ=UTC printf '%(%FT%T)TZ' "$SOURCE_DATE_EPOCH")"
    GitCommit="${_commit:?}"
    Version="v$pkgver"
  )
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  go build -o bin/ct \
    -ldflags "-linkmode=external ${x[*]/#/-X=github.com/helm/chart-testing/v3/ct/cmd.}" ./ct
}

check() {
  cd "$pkgname-$pkgver"
  go test -ldflags "-linkmode=external ${x[*]/#/-X=github.com/helm/chart-testing/v3/ct/cmd.}" -short ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/ct -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 etc/lintconf.yaml etc/chart_schema.yaml -t "$pkgdir/etc/ct"
  cp -a doc -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a examples -t "$pkgdir/usr/share/doc/$pkgname"
}
