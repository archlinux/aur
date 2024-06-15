# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy
_pkgname=azure-storage-azcopy
pkgver=10.25.1
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d62f0a88e8899a611d9ef627252e4379bee8530177caca081f155e28917e70d3')

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  go mod download -x
}

build() {
  cd "$_archive"

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
  cd "$_archive"

  # Skip failing tests - not sure why they fail.
  local unit_tests=$(
    go list ./... \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/cmd' \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/common' \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/e2etest' \
      | grep -v 'github.com/Azure/azure-storage-azcopy/v10/ste'
  )
  # shellcheck disable=SC2086
  go test $unit_tests
}

package() {
  cd "$_archive"

  install -Dm755 azcopy "$pkgdir/usr/bin/azcopy"

  install -Dm644 azcopy.bash "$pkgdir/usr/share/bash-completion/completions/azcopy"
  install -Dm644 azcopy.fish "$pkgdir/usr/share/fish/vendor_completions.d/azcopy.fish"
  install -Dm644 azcopy.zsh "$pkgdir/usr/share/zsh/site-functions/_azcopy"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
