# Maintainer: Seann Moser <you@example.com>
pkgname=ymn-git
pkgver=0.1.0.r0.g05825b6
pkgrel=1
pkgdesc="Yomuna visual novel transcript and flashcard tool"
arch=('x86_64')
url="https://github.com/DarlingGoose/ymn"
license=('custom')
depends=(
  'ffmpeg'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'libx11'
  'libxkbcommon'
  'mesa'
  'mpv'
  'wayland'
  'wine'
)
makedepends=('git' 'go' 'pkgconf')
optdepends=(
  'steam: Steam/Proton launch flows'
  'tesseract: legacy OCR workflow'
  'grim: Wayland screenshot capture for legacy OCR workflow'
  'slurp: Wayland region selection for legacy OCR workflow'
  'ollama: local translation backend'
)
provides=('ymn')
conflicts=('ymn')
source=('ymn::git+https://github.com/DarlingGoose/ymn.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd ymn

  local ver
  ver="$(git describe --long --tags --match 'v[0-9]*' 2>/dev/null || true)"

  if [[ -n "$ver" ]]; then
    printf '%s\n' "${ver#v}" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s\n' \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd ymn

  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/gopath/pkg/mod"
  export GOFLAGS="-modcacherw"

  go mod vendor
}

build() {
  cd ymn

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="$srcdir/gopath"
  export GOCACHE="$srcdir/go-build"
  export GOMODCACHE="$srcdir/gopath/pkg/mod"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

  mkdir -p build

  go build \
    -ldflags "-linkmode external" \
    -o build/ymn \
    .
}

package() {
  cd ymn

  install -Dm755 build/ymn "$pkgdir/usr/bin/ymn"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
