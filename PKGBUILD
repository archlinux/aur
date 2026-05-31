# Maintainer: Kyle Galloway <kyle@thegalloways.ca>
pkgname=edcolreport
# Set to the release's semver. NOTE: AUR pkgver cannot contain a hyphen, so
# for a pre-release tag like v0.2.0-alpha use _tag below to point at the real
# tag and keep pkgver hyphen-free (e.g. pkgver=0.2.0alpha, _tag=v0.2.0-alpha).
pkgver=0.4.1
pkgrel=1
_tag="v${pkgver}"
pkgdesc="Report Elite Dangerous colonization progress to ravencolonial.com"
arch=('x86_64' 'aarch64')
url="https://github.com/pequalsnp/ed-colonization-reporter"
license=('MIT')
# Fyne runtime: OpenGL (libglvnd), X11 libs, and fontconfig.
depends=('hicolor-icon-theme' 'libglvnd' 'libxcursor' 'libxrandr'
         'libxinerama' 'libxi' 'libxxf86vm' 'fontconfig')
makedepends=('go' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('8fa145d9222dd9e3be632bb4350da39840e6a68d86fca87d9b81e15ef84753f3')

# GitHub strips the leading "v" from the tag for the archive's top dir.
_srcdir="ed-colonization-reporter-${_tag#v}"

build() {
  cd "$_srcdir"
  export CGO_ENABLED=1
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -s -w -X main.version=${_tag}" \
    -o build/edcolreport ./cmd/edcolreport
}

package() {
  cd "$_srcdir"
  install -Dm755 build/edcolreport "$pkgdir/usr/bin/edcolreport"
  install -Dm644 packaging/ca.thegalloways.edcolreport.desktop \
    "$pkgdir/usr/share/applications/ca.thegalloways.edcolreport.desktop"
  install -Dm644 packaging/ca.thegalloways.edcolreport.metainfo.xml \
    "$pkgdir/usr/share/metainfo/ca.thegalloways.edcolreport.metainfo.xml"
  install -Dm644 packaging/ca.thegalloways.edcolreport.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/ca.thegalloways.edcolreport.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
