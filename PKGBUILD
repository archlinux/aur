# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=zenc-git
_pkgname=zen-c
pkgver=r883.60993ab
pkgrel=1
pkgdesc='Write like a high-level language, run like C.'
url='https://github.com/z-libs/Zen-C'
arch=('x86_64' 'pentium4' 'aarch64' 'armv7h' 'riscv64')
license=('MIT')
optdepends=('gcc: gcc backend support'
    'clang: clang backend support'
    'zig: zig backend support')
makedepends=(gcc make git)
provides=(zc)
conflicts=(${pkgname%-*})
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')
# validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  # there are no tags then use number of revisions since beginning of the history
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"
  make CC=gcc -j
}

package() {
  cd "$_pkgname"
  install -Dm755 zc "$pkgdir/usr/bin/zc"
  install -d "$pkgdir/usr/local/share/zenc"
  cp -r std/ "$pkgdir/usr/local/share/zenc/std"
  install -Dm644 std.zc "$pkgdir/usr/local/share/zenc/std.zc"
  install -Dm644 man/zc.1 "$pkgdir/usr/share/man/man1/zc.1"
  command -v gzip >/dev/null 2>&1 && gzip -9 "$pkgdir/usr/share/man/man1/zc.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
