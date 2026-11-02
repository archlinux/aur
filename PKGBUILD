# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Jni <jni.viens at protonmail dot com>

pkgname=envman
pkgver=2.7.0
pkgrel=1
pkgdesc="Manage Environment Variable collections"
arch=(aarch64 x86_64)
url="https://github.com/bitrise-io/envman"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bcab3a6cac7f02252320dcdb574e0c74d8b35cdf3032592c142ee096beb648a9')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "$pkgname-$pkgver"
  go mod download -modcacherw

  mkdir -p "build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="$srcdir/go-cache"
  export GOMODCACHE="$srcdir/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

  cd "$pkgname-$pkgver"
  go build -o build/envman .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./... -skip 'Test_EnvsSerializeModel_Normalize'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/envman -t "$pkgdir/usr/bin/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
