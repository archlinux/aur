# Maintainer: gilbus <aur (AT) tinkershell.eu>
pkgname=workout-tracker
pkgver=2.9.0
pkgrel=1
pkgdesc='A workout tracking web application for personal use (or family, friends), geared towards running and other GPX-based activities'
url="https://github.com/jovandeginste/workout-tracker"
license=("MIT")
arch=('x86_64')
makedepends=('go' 'make' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"${pkgname}.service"
	"${pkgname}.env.dist")
sha256sums=('6355d1a4687e2c7313b4ea19121a281182d4dcf1bdaf4ccbaf68828b1094c526'
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
  # Remaining Go flags without -ldflags (set directly below)
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  # Build frontend separately (Makefile only used for npm part)
  env NPM_CONFIG_ALLOW_GIT=all make build-frontend

  local _buildtime
  _buildtime=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

  go build \
    -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\" \
      -X 'main.gitRef=refs/tags/v${pkgver}' \
      -X 'main.gitRefName=v${pkgver}' \
      -X 'main.gitRefType=tag' \
      -X 'main.gitCommit=v${pkgver}' \
      -X 'main.buildTime=${_buildtime}'" \
    -o build ./cmd/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  # Install systemd service file
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  # Install sample config
  install -Dm644 "${srcdir}/${pkgname}.env.dist" "${pkgdir}/etc/${pkgname}/env.dist"
}

