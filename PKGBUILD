# Maintainer: zeozeozeo <killabites@duck.com>
# Upstream: https://github.com/zeozeozeo/teacrush
pkgname=teacrush
pkgver=0.1.0
pkgrel=3
pkgdesc='Bubble Tea TUI for compressing videos down to a target size (ffmpeg frontend)'
arch=('x86_64' 'aarch64')
url='https://github.com/zeozeozeo/teacrush'
license=('Unlicense')
depends=('ffmpeg' 'glibc')
makedepends=('go')
optdepends=(
  'nvidia-utils: NVENC hardware encoding'
  'intel-media-driver: Intel QSV hardware encoding'
  'libva-mesa-driver: AMD VA-API hardware encoding'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zeozeozeo/teacrush/archive/refs/tags/v$pkgver.tar.gz")
# NOTE: CI (.github/workflows/aur.yml) refreshes this on every stable release.
# After tagging locally, refresh with: updpkgsums && makepkg --printsrcinfo > .SRCINFO
sha256sums=('63a425675788d9c0963f140b9909c2e256a23cb357bfaedc87b251647106d147')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=1
  export GOFLAGS='-trimpath -mod=readonly'
  # -buildmode=pie + external linking honors makepkg LDFLAGS (RELRO/PIE).
  # shellcheck disable=SC2154
  go build -buildmode=pie -ldflags="-s -w -linkmode=external -extldflags \"$LDFLAGS\"" -o teacrush .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 teacrush "$pkgdir/usr/bin/teacrush"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
