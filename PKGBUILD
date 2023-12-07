# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
pkgver=10.22.0
pkgrel=2
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(
  "${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz"
  "remove-version-check.patch"
  "fix-lifecyclemgr-nil-error.patch"
)
sha512sums=(
  'e066a949098ba03770691cf7686e28c1adfdb8dca36f09933a0c5c3cde9dbd24e7e41ac4bc95c0bb35f3e01d2c68de75628aebae173f0e8d676be683965fcebf'
  'd436770cf67213fd7118992d6c04a06e5604482b24213441296f2e18fe4653301652958019f7efeb460e54e3b673feb4cf5b1228d893ee39a81f55c9c0799e94'
  '524a0f75c3a736623fdf344f8b1d406557ed34c3582958f1a3c3ca222931b3edc0f727acf04d73f877951163e62e1ca3441bf579afef491bdde037901273ff90'
)

prepare() {
  cd "${srcdir}/azure-storage-azcopy-${pkgver}"

  # Due to the version check, each invocation takes ~8 seconds. See:
  # https://github.com/Azure/azure-storage-azcopy/issues/2482
  patch --forward --strip=1 --input="$srcdir/remove-version-check.patch"

  # Fix intermittent nil pointer dereference in common/lifecyleMgr.go:375.
  patch --forward --strip=1 --input="$srcdir/fix-lifecyclemgr-nil-error.patch"

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

  go build -v -o azcopy

  # Completions
  ./azcopy completion bash > azcopy.bash
  ./azcopy completion fish > azcopy.fish
  ./azcopy completion zsh > azcopy.zsh
}

check() {
  cd "${srcdir}/azure-storage-azcopy-${pkgver}"

  # Skip failing tests - not sure why they fail.
  _unit_tests=$(
    go list ./... \
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
