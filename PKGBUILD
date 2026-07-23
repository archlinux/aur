# Maintainer: L3-N0X <leon.goett@web.de>
pkgname=marker-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="Convert PDFs to Markdown from the terminal using MistralAI, Datalab or a self-hosted Marker OCR backend"
arch=('x86_64' 'aarch64')
url="https://github.com/L3-N0X/marker-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
  'gnome-keyring: Secret Service backend for storing the API key'
  'kwallet: Secret Service backend for storing the API key'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Run `updpkgsums` after tagging a new release to refresh this.
sha256sums=('1ac63fb5a1636a121889b24fa788967da7d2cc971b991bb1e870b41079402ea8')

prepare() {
  cd "$pkgname-$pkgver"
  go mod download -x
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make VERSION="v$pkgver"
  make completions
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  # MIT requires shipping the license text; add a LICENSE file to the repo.
  [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  return 0
}
