# Maintainer: zeozeozeo <killabites@duck.com>
# Upstream: https://github.com/zeozeozeo/teacrush
pkgname=teacrush-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc='Bubble Tea TUI for compressing videos down to a target size (git master)'
arch=('x86_64' 'aarch64')
url='https://github.com/zeozeozeo/teacrush'
license=('Unlicense')
depends=('ffmpeg' 'glibc')
makedepends=('git' 'go')
provides=('teacrush')
conflicts=('teacrush' 'teacrush-bin')
optdepends=(
  'nvidia-utils: NVENC hardware encoding'
  'intel-media-driver: Intel QSV hardware encoding'
  'libva-mesa-driver: AMD VA-API hardware encoding'
)
source=("git+https://github.com/zeozeozeo/teacrush.git")
sha256sums=('SKIP')

pkgver() {
  cd teacrush
  # e.g. 0.1.0.r12.gabcdef1 (or 0.1.0 if exactly on a tag)
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd teacrush
  export CGO_ENABLED=0
  export GOFLAGS='-trimpath -mod=readonly'
  go build -ldflags='-s -w' -o teacrush .
}

package() {
  cd teacrush
  install -Dm755 teacrush "$pkgdir/usr/bin/teacrush"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
