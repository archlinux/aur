pkgname=workout-tracker
pkgver=2.2.0
pkgrel=0
pkgdesc='A workout tracking web application for personal use (or family, friends), geared towards running and other GPX-based activities'
url="https://github.com/jovandeginste/workout-tracker"
license=("MIT")
arch=('x86_64')
makedepends=('go' 'make' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"${pkgname}.service"
	"${pkgname}.env.dist")
sha256sums=('817b7aa70709339f7b96eb0e1e69c421e2fc34eaa697018d501f3d2246c2812a'
            '341941ad9a8ef27d09b3527058597709c9624d80d1319f36252aaa4e60073014'
            'b06f581b4d7ec4991b89ddad9547da284de49f3ad349186e4a2787e9daeb7930')
backup=("etc/$pkgname/env")

prepare() {
  cd "$pkgname-$pkgver"
  mkdir build
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  npm install
  make build-dist
  make build-tw
  go build -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # Install sample config
  install -Dm644 "${srcdir}/${pkgname}.env.dist" "${pkgdir}/etc/${pkgname}/env.dist"
}

