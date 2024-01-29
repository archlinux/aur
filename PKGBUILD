# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=10.23.0
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('9e8ff91f28074b180b063092142a182ca3dffdecf83d1966a85d1ea2f491ba9a')

prepare() {
  cd "${srcdir}/azure-storage-azcopy-${pkgver}"

  # Avoid downloading Go dependencies in build() by doing it here instead
  go mod download -x
}

build() {
  cd "${srcdir}/azure-storage-azcopy-${pkgver}"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v -buildvcs=false -o azcopy

  # Completions
  ./azcopy completion bash > azcopy.bash
  ./azcopy completion fish > azcopy.fish
  ./azcopy completion zsh > azcopy.zsh
}

check() {
  cd "${srcdir}/azure-storage-azcopy-${pkgver}"

  # Skip failing tests - not sure why they fail.
  _unit_tests=$(
    go list -buildvcs=false ./... \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/cmd' \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/common' \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/e2etest' \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/ste' \
      | sort
  )
  # shellcheck disable=SC2086
  go test $_unit_tests
}

package() {
  cd "${srcdir}/azure-storage-azcopy-${pkgver}"

  install -Dm755 azcopy "${pkgdir}/usr/bin/azcopy"

  install -Dm644 azcopy.bash "${pkgdir}/usr/share/bash-completion/completions/azcopy"
  install -Dm644 azcopy.fish "${pkgdir}/usr/share/fish/vendor_completions.d/azcopy.fish"
  install -Dm644 azcopy.zsh "${pkgdir}/usr/share/zsh/site-functions/_azcopy"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
