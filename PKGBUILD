# Maintainer: Danilo <aur ät dbrgn döt ch>
# Submitter: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=transifex-client
pkgver=1.6.10
pkgrel=2
pkgdesc="The Transifex command-line tool to download and upload translations from Transifex"
arch=('x86_64')
url="https://github.com/transifex/cli"
license=('Apache')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/transifex/cli/archive/refs/tags/v${pkgver}.tar.gz")
install=transifex-client.install
sha256sums=('0256e68ac9a6b9c963c8db9fdb5b7a6b5c7445c0c0d31884477fbde36fd3025b')

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
  export GOFLAGS="-buildmode=pie -trimpath \"-ldflags=-linkmode=external -X 'github.com/transifex/cli/internal/txlib.Version=${pkgver}'\" -mod=readonly -modcacherw"

  # Build
  go build -o build
}

package() {
  cd "cli-${pkgver}"

  # Install binary
  install -Dm 755 build/cli "${pkgdir}"/usr/bin/tx
}

# vim:set ts=2 sw=2 et:
