# Maintainer: Seann Moser <you@example.com>
pkgname=ymn-git
pkgver=0.1.2.r0.g1c579b0
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
source=(
  'ymn::git+https://github.com/DarlingGoose/ymn.git#branch=main'
  'ymn.desktop'
)
sha256sums=(
  'SKIP'
  'ff3dcc09fe17519f28df9b5d036d99a4097d7b8cea7f95206cce1beec428aac7'
)

pkgver() {
  cd ymn

  local tag commits
  tag="$(git tag --sort=-v:refname --merged HEAD | head -n1)"
  commits="$(git rev-list --count "${tag}..HEAD")"

  printf '%s.r%s.g%s\n' "${tag#v}" "${commits}" "$(git rev-parse --short HEAD)"
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
  install -Dm644 "$srcdir/ymn.desktop" "$pkgdir/usr/share/applications/ymn.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
