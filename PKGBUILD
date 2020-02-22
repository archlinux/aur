# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>
pkgname=xi-term
pkgver=d264767
pkgrel=1
pkgdesc="A terminal frontend for the Xi editor"
arch=('any')
url="https://github.com/xi-frontend/xi-term"
license=('MIT')
provides=("xi-term")
depends=('xi-core')
makedepends=('cargo' 'git' 'make')
conflicts=('xi-term')
source=("$pkgname::git+${url}")
sha1sums=('SKIP')

build() {
  cd "${pkgname}"
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

pkgver() {
  cd "$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/xi-term" "$pkgdir/usr/bin/xi-term"
}

# vim:set ts=2 sw=2 et:
