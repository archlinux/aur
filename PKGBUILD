# Maintainer: L3-N0X <leon.goett@web.de>
pkgname=marker-cli-git
_pkgname=marker-cli
pkgver=0.2.0.r1.gb2ea1fe
pkgrel=1
pkgdesc="Convert PDFs to Markdown from the terminal using MistralAI OCR (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/L3-N0X/marker-cli"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=(
  'gnome-keyring: Secret Service backend for storing the API key'
  'kwallet: Secret Service backend for storing the API key'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  go mod download -x
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make
  make completions
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  [ -f LICENSE ] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  return 0
}
