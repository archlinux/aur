# Maintainer: ml <ml@visu.li>
pkgname=kubectl-doctor
pkgver=0.3.0
pkgrel=1
pkgdesc='kubectl cluster triage plugin for k8s'
arch=('x86_64' 'aarch64')
url='https://github.com/emirozer/kubectl-doctor'
license=('Apache')
depends=('glibc')
makedepends=('go')
groups=('kubectl-plugins')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1d0faeba6875228bc9e77261e55cbc6c7b2ffaabf90c4c3f7fe96f8ea8e299bb')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'
  go build ./cmd/kubectl-doctor.go
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin"
}
