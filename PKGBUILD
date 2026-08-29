# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=hylo
pkgname=$_pkgname-git
pkgver=0.1.0.r7166.b86ff706a
pkgrel=1
pkgdesc='Compiler for the Hylo programming language'
arch=(x86_64 aarch64)
url=https://hylo-lang.org
license=(Apache-2.0)
depends=(
  clang
  gcc-libs
  glibc
  swift-language
  zstd
)
makedepends=(
  git
  hylo-llvm-bin
  pkgconf
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$_pkgname::git+https://github.com/hylo-lang/$_pkgname.git"
  "git+https://github.com/dabrahams/SPMBuildToolSupport.git"
)
sha256sums=(
  SKIP
  SKIP
)

pkgver() {
  printf '0.1.0.r%s.%s' \
    "$(git -C $_pkgname rev-list --count HEAD)" \
    "$(git -C $_pkgname rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  git config submodule.SPMBuildToolSupport.url "$srcdir/SPMBuildToolSupport"
  git -c protocol.file.allow=always submodule update SPMBuildToolSupport
  ./Tools/set-hc-version.sh "$pkgver"
}

build() {
  cd $_pkgname
  swift build \
    --configuration release \
    --disable-sandbox \
    -Xswiftc -file-prefix-map -Xswiftc "$srcdir="
}

check() {
  cd $_pkgname
  swift test \
    --configuration release \
    --disable-sandbox \
    --parallel
}

package() {
  cd $_pkgname

  local _bin_dir
  _bin_dir=$(swift build --configuration release --show-bin-path)

  # Install private binaries and resources
  install -dm755 "$pkgdir"/usr/lib/$_pkgname
  install -Dm755 "$_bin_dir/hc" -t "$pkgdir"/usr/lib/$_pkgname
  install -Dm755 "$_bin_dir/hylo-demangle" -t "$pkgdir"/usr/lib/$_pkgname

  # Copy resource bundles if generated
  for _bundle in "$_bin_dir"/*.resources; do
    [[ -e $_bundle ]] && cp -r "$_bundle" "$pkgdir"/usr/lib/$_pkgname
  done

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/$_pkgname/hc "$pkgdir"/usr/bin/hc
  ln -s /usr/lib/$_pkgname/hc "$pkgdir"/usr/bin/hylo
  ln -s /usr/lib/$_pkgname/hylo-demangle "$pkgdir"/usr/bin/hylo-demangle

  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
