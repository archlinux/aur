# Maintainer: Gerhard Schwanzer <geri@sdf.org>
pkgname=pw-duck-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="PipeWire audio ducking utility (git)"
arch=('x86_64')
url="https://github.com/geri1701/pw-duck"
license=('MIT')

depends=('pipewire')
makedepends=('git' 'cargo' 'rust' 'clang' 'pkgconf' 'pipewire')

provides=('pw-duck')
conflicts=('pw-duck')

options=(!lto !strip)

source=("git+https://github.com/geri1701/pw-duck.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/pw-duck"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//; s/-/\.r/; s/-/\.g/' \
    || printf '0.0.0.r%s.g%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/pw-duck"
  cargo build --release --locked
}

package() {
  cd "$srcdir/pw-duck"
  install -Dm755 "target/release/pw-duck" "$pkgdir/usr/bin/pw-duck"
}
