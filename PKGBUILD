# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

pkgname=fencecat-git
_pkgname=fencecat
pkgver=0.4.0.r0.gd19d115
pkgrel=1
pkgdesc="Walkdir cat with markdown fenced code output"
arch=('x86_64')
url="https://github.com/Xangelix/fencecat"
license=('MIT')
provides=('fencecat')
conflicts=('fencecat')
makedepends=('cargo-nightly' 'rust-nightly' 'git')
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Generates a version string based on tags, commits since tag, and current hash.
  # Strips any leading 'v' to match Arch versioning standards.
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release --frozen
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_pkgname"

  # Install the binary
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"

  # Install the documentation
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
