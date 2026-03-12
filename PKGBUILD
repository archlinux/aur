# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>

pkgname=secrets-dispatcher
pkgver=0.1.1
pkgrel=1
pkgdesc="Per-operation approval and audit logging for secret access and git commit signing on Linux"
arch=('x86_64')
url="https://github.com/nikicat/secrets-dispatcher"
license=('MIT')
depends=('glibc')
makedepends=('go' 'deno' 'git' 'make')
install=secrets-dispatcher.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7796b4b50f4e18ded9fb42f1220dd80c4bc57cc241dfbe76bc09fca4d3f9f13b')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make build VERSION="v${pkgver}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 secrets-dispatcher "${pkgdir}/usr/bin/secrets-dispatcher"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 config.yaml.example "${pkgdir}/usr/share/secrets-dispatcher/config.yaml.example"
}
