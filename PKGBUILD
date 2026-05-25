# Maintainer: Seann Moser <you@example.com>
pkgname=ymn-git
pkgver=0.1.11.r0.gcf19ab5
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
  'icon.svg'
)
sha256sums=(
  'SKIP'
  'df60b7525f82e0cd8f1910eb2dff2b3d5892c04d9d6f1d30bc28c2b7d24d6468'
  '77ab34aacd3b216c2c8a243c7a49903a675e0731010d3d421d08a4d200bf8314'
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
  install -Dm644 "$srcdir/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ymn.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
