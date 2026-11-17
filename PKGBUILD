# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=archive-utils
pkgver=1.0.0
pkgrel=1
pkgdesc="Safe, predictable archive extractor (x) and creator (c) built on bsdtar, GNU tar, 7-Zip and zip"
arch=('x86_64' 'aarch64')
url="https://src.panahifar.ir/ahp/archive-utils"
license=('Unlicense')
depends=(
  'glibc'
  'libarchive'
)
makedepends=('go')
checkdepends=('7zip' 'binutils' 'unzip' 'zip')
optdepends=(
  '7zip: x for 7z, RAR and UDF ISO images; c for 7z'
  'zip: c for zip'
  'tar: c for tar archives (GNU tar)'
  'gzip: x for .gz and .Z; c for tar.gz'
  'bzip2: x for .bz2; c for tar.bz2'
  'xz: x for .xz and .lzma; c for tar.xz'
  'zstd: x for .zst; c for tar.zst'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7cbe821459737f4cdf5740670671e56d370e09ff73a80f92df5ce2c4a419af95')

_goenv() {
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
  export GOPATH="$srcdir/gopath" GOTOOLCHAIN=local
}

prepare() {
  cd "$srcdir/$pkgname"
  _goenv
  go mod download
}

build() {
  cd "$srcdir/$pkgname"
  _goenv
  go build \
    -ldflags "-linkmode=external -X src.panahifar.ir/ahp/archive-utils/internal/cli.Version=$pkgver" \
    -o build/ ./cmd/x ./cmd/c
}

check() {
  cd "$srcdir/$pkgname"
  _goenv
  go test -short ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/x build/c -t "$pkgdir/usr/bin/"
  install -Dm644 README.md DESIGN.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
