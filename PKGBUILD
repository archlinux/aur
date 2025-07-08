# Maintainer Chris Werner Rau <aur@cwrau.io>
# Maintainer: Nikolai Rodionov <allanger@zohomail.com>
# Contributor: Morteza NourelahiAlamdari <m@0t1.me>
# Contributor: Thomas Hobson <thomas /at/ hexf.me>

pkgname=chart-testing
pkgver=3.13.0 # renovate: datasource=github-releases depName=helm/chart-testing
pkgrel=2
pkgdesc='CLI tool for linting and testing Helm charts'
arch=('x86_64' 'aarch64' 'armv6h')
url='https://github.com/helm/chart-testing'
license=('Apache-2.0')
depends=('kubectl' 'git' 'yamllint' 'helm' 'yamale')
makedepends=('go' 'goreleaser')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7b102727b30a7b4eb0946526a888fc0d3311a730354f163b605694da066fc862')
backup=('etc/ct/lintconf.yaml' 'etc/ct/chart_schema.yaml')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -modcacherw -trimpath'
  goreleaser build --clean --snapshot --single-target
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 dist/*/ct -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 etc/lintconf.yaml etc/chart_schema.yaml -t "$pkgdir/etc/ct"
  cp -a doc -t "$pkgdir/usr/share/doc/$pkgname"
  cp -a examples -t "$pkgdir/usr/share/doc/$pkgname"
}
