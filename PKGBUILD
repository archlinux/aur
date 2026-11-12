# Maintainer: agony <27015 at riseup dot net>

pkgname=greenmask
pkgver=0.2.27
pkgrel=1
pkgdesc='PostgreSQL dump, anonymization and restore tool'
arch=('x86_64' 'aarch64')
url='https://github.com/GreenmaskIO/greenmask'
license=('Apache-2.0')
depends=('glibc' 'postgresql-libs')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4cbb8dfe2c399d5c37764d7ba4320032cfae25569b658bd8f1f3f489bf92675')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
  go build -tags=viper_bind_struct \
    -ldflags="-linkmode=external -X github.com/greenmaskio/greenmask/cmd/greenmask/cmd.Version=v${pkgver}" \
    -o greenmask ./cmd/greenmask
  for shell in bash fish zsh; do
    ./greenmask completion "${shell}" > "completion.${shell}"
  done
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 greenmask -t "${pkgdir}/usr/bin"
  install -Dm644 completion.bash "${pkgdir}/usr/share/bash-completion/completions/greenmask"
  install -Dm644 completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/greenmask.fish"
  install -Dm644 completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_greenmask"
  install -Dm644 config.yml.example -t "${pkgdir}/usr/share/doc/${pkgname}"
}
