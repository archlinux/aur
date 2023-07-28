# Maintainer: Danilo <aur ät dbrgn döt ch>
# Submitter: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=1.6.9
pkgrel=1
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('x86_64')
url="https://github.com/transifex/cli"
license=('Apache')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/transifex/cli/archive/refs/tags/v${pkgver}.tar.gz")
install=transifex-client.install
sha256sums=('b86343621a684ba2dea58f9fba2df15d3907103fb069edcb3967cf6ff6588806')

prepare() {
  cd "cli-${pkgver}"

  # Create build dir
  mkdir -p build/

  # Download module cache
  go mod download
}

build() {
  cd "cli-${pkgver}"

  # Set flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Build
  go build -o build
}

package() {
  cd "cli-${pkgver}"

  # Install binary
  install -Dm 755 build/cli "${pkgdir}"/usr/bin/tx
}

# vim:set ts=2 sw=2 et:
