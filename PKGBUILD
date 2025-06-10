_pkgname=git-plumber
pkgname=git-plumber-git
pkgver=v0.1.0.r0.g458ba84
pkgrel=1
pkgdesc="Explore git internals, the plumbing"
url="https://github.com/ejiektpobehuk/git-plumber"
license=('MIT')
arch=('x86_64')
makedepends=('cargo' 'git')
provides=('git-plumber')
conflicts=('git-plumber')
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/git-plumber"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$srcdir/git-plumber"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/git-plumber"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

check() {
  cd "$srcdir/git-plumber"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/git-plumber"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE

}
