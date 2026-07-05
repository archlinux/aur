# Maintainer: kengzzzz <github.ezgew@spk4x.com>

pkgname=hypr-kblayoutd-git
_pkgname=hypr-kblayoutd
pkgver=0.2.0.r0.g35f3e7f
pkgrel=1
pkgdesc="Small Hyprland daemon that remembers keyboard layout per window"
arch=('x86_64' 'aarch64')
url="https://github.com/kengzzzz/hypr-kblayoutd"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  if desc="$(git describe --long --tags --abbrev=7 2>/dev/null)" && [ -n "$desc" ]; then
    echo "$desc" | sed 's/^v//;s/-/.r/;s/-/./'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"

  install -Dm755 "target/release/$_pkgname" \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 contrib/hypr-kblayoutd.service \
    "$pkgdir/usr/lib/systemd/user/$_pkgname.service"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 docs/benchmarks.md \
    "$pkgdir/usr/share/doc/$pkgname/benchmarks.md"

  install -Dm644 docs/validation.md \
    "$pkgdir/usr/share/doc/$pkgname/validation.md"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
