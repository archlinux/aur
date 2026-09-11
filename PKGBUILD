# Maintainer: ycna07 <aozakitouko at foxmail dot com>
pkgname=juggler-git
_pkgname=juggler
pkgver=0.6.2.r1.g19571f9
pkgrel=1
pkgdesc="The Juggler Code Agent"
arch=('x86_64' 'aarch64')
url="https://github.com/juggler-ai/juggler"
license=('AGPL-3.0-or-later' 'Apache-2.0')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'hicolor-icon-theme'
  'libsoup3'
  'libx11'
  'webkitgtk-6.0'
)
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!lto')
source=("${_pkgname}::git+${url}.git"
        'juggler.desktop')
install=hint.install
b2sums=('SKIP'
        'b7dcf1b2c626e0c37badd2b5bbd58982c195a0ffafcd334111d8420806fb506a727594ba0ad821866149188ad76a476c9a9aab8e09d1bd860ce3520692e14a24')


pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # 3rdparty/wails is a git submodule and a `replace` target of the main Go
  # module (see go.mod), so the tree cannot compile without it. makepkg never
  # clones submodules: fetch the pinned commit here, shallow — the fork's full
  # history is large and only the recorded revision is needed.
  git submodule update --init --recursive --depth 1

  # Prime the module cache so build() itself needs no network.
  export GOFLAGS="-buildmode=pie -trimpath -mod=mod -modcacherw"
  go mod download
}

build() {
  cd "${_pkgname}"

  # The GTK4/WebKitGTK backend is cgo, so the distro's C flags reach it through
  # the CGO_* variables. GOFLAGS carries the Arch Go packaging defaults.
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=mod -modcacherw"

  # release-build = go build -tags production: drops the test handlers and the
  # worker test-support code that a shipped binary must not carry. It also
  # regenerates the two generated embeds (icon.png, wails_runtime.js) that the
  # build depends on. The Go linker stamps the version/commit/build date.
  make release-build \
    VERSION="${pkgver}" \
    COMMIT="$(git rev-parse --short HEAD)" \
    BUILD_DATE="$(date -u -d "@${SOURCE_DATE_EPOCH}" +%Y-%m-%dT%H:%M:%SZ)"
}

package() {
  cd "${_pkgname}"

  # Both halves of the pair live in the same directory on purpose: the desktop
  # app spawns the server it finds as a sibling of its own executable
  # (serverBinPath), and mixing an app with a different server build is not a
  # supported configuration. See docs/distribution.md.
  install -Dm755 bin/juggler -t "${pkgdir}/usr/bin/"
  install -Dm755 bin/juggler-app -t "${pkgdir}/usr/bin/"

  install -Dm644 "${srcdir}/juggler.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 assets/icons/flat-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/juggler.png"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 web/sdk/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.sdk"
}


