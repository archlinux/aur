# Maintainer: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gitleaks
pkgver=7.6.0
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/zricethezav/gitleaks
arch=('x86_64' 'i686')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('922af2a6f3945954aacdf61919508d360685ee6fa165eab5070009ca9dcd523f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X=github.com/zricethezav/gitleaks/v${pkgver%%.*}/version.Version=$pkgver -extldflags \"$LDFLAGS\"" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE      "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 README.md    "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 examples/* -t"$pkgdir"/usr/share/doc/"$pkgname"/examples/
  install -Dm755 "$pkgname"   "$pkgdir"/usr/bin/"$pkgname"
}

# vim:set ts=2 sw=2 et:
