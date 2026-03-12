# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>

pkgname=secrets-dispatcher
pkgver=0.1.1
pkgrel=2
pkgdesc="Per-operation approval and audit logging for secret access and git commit signing on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/nikicat/secrets-dispatcher"
license=('MIT')
depends=('glibc')
makedepends=('go' 'deno' 'git' 'make')
install=secrets-dispatcher.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6bfb20461b2b922a2931449c691b79807d3f170c3ca0e5ab9ebc4264755c02bf')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make build VERSION="v${pkgver}" GO_LDFLAGS="-linkmode=external -s -w"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 secrets-dispatcher "${pkgdir}/usr/bin/secrets-dispatcher"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 config.yaml.example "${pkgdir}/usr/share/secrets-dispatcher/config.yaml.example"
}
