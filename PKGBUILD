# Maintainer: patchouli

pkgname=scuisei-git
_pkgname=scuisei-rs
pkgver=0.1.1.r0.gc6ec674
pkgrel=1
pkgdesc="Blazing fast successor for SCXvid-standalone"
arch=('x86_64')
url="https://github.com/yuv420p10le/scuisei-rs"
license=('MIT')
depends=('ffmpeg' 'glibc')
makedepends=('git' 'cargo' 'clang' 'pkgconf')
provides=('scuisei-rs')
conflicts=('scuisei-rs')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cd "$_pkgname"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$_pkgname"

  install -Dm755 "$srcdir/target/release/scuisei-rs" "$pkgdir/usr/bin/scuisei-rs"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
