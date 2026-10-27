# Maintainer: agony <27015 at riseup dot net>

pkgname=greenmask
pkgver=0.2.26
pkgrel=1
pkgdesc='PostgreSQL dump, anonymization and restore tool'
arch=('x86_64' 'aarch64')
url='https://github.com/GreenmaskIO/greenmask'
license=('Apache-2.0')
depends=('glibc' 'postgresql-libs')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e77626183f52cf6309ed8db4d84ff143fe0e045d8b3c5d47d98d2e50e70a016')

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
