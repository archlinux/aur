# Maintainer: MasketLP
#
# pkgver is rewritten from the release tag, and checksums by updpkgsums, by
# packaging/aur/publish.sh on every release.
pkgname=mlp-gui
pkgver=0.5.0
pkgrel=1
pkgdesc='Desktop app to encrypt and decrypt files with AES-256-GCM (GUI for mlp)'
arch=('x86_64' 'aarch64')
url='https://github.com/EldinBegano/mask-decryption'
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxinerama' 'libxkbcommon' 'libxrandr' 'libxxf86vm' 'wayland')
makedepends=('go' 'xorgproto')
checkdepends=('desktop-file-utils')
optdepends=('mlp: command-line interface using the same keyfile')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64c4c12f8cd9d5d7216a1be382daba1892707f475da14cadb36994bc2a862ed0')

prepare() {
  cd "mask-decryption-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS='-modcacherw'
  go list -deps ./cmd/mlp-gui > /dev/null
}

build() {
  cd "mask-decryption-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  go build -o mlp-gui \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=${pkgver}" \
    ./cmd/mlp-gui
}

check() {
  cd "mask-decryption-$pkgver"
  # The window itself can't open in a build chroot; check the parts that can run.
  test "$(./mlp-gui --version)" = "mlp-gui $pkgver"
  desktop-file-validate cmd/mlp-gui/assets/mlp-gui.desktop
}

package() {
  cd "mask-decryption-$pkgver"
  install -Dm755 mlp-gui "$pkgdir/usr/bin/mlp-gui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 cmd/mlp-gui/assets/mlp-gui.desktop "$pkgdir/usr/share/applications/mlp-gui.desktop"
  install -Dm644 cmd/mlp-gui/assets/mlp-gui.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/mlp-gui.svg"
}
