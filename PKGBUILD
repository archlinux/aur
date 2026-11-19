# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname='darkubectl'
pkgver=0.15.0
pkgrel=1
pkgdesc='kubectl-like access to the Hamravesh Darkube platform'
url='https://github.com/rahacloud/darkubectl'
arch=('x86_64' 'aarch64')
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
conflicts=('darkubectl-bin' 'darkubectl-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rahacloud/darkubectl/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5d27fb075e957c3435d018c4c1728f2d6b198f9b7b54a9b2faa1a8b6df88665')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o darkubectl \
    -ldflags="-linkmode=external -X github.com/rahacloud/darkubectl/cmd.version=${pkgver}" .
  for shell in bash zsh fish; do
    ./darkubectl completion "${shell}" > "darkubectl.${shell}"
  done
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-mod=readonly -modcacherw"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 darkubectl "${pkgdir}/usr/bin/darkubectl"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 darkubectl.bash "${pkgdir}/usr/share/bash-completion/completions/darkubectl"
  install -Dm644 darkubectl.zsh "${pkgdir}/usr/share/zsh/site-functions/_darkubectl"
  install -Dm644 darkubectl.fish "${pkgdir}/usr/share/fish/vendor_completions.d/darkubectl.fish"
}
