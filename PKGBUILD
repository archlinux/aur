# Maintainer: p1rater <github.com/p1rater>
pkgname=nanlang-git
pkgver=3.0.1.r13.55c4a1d
pkgrel=1
pkgdesc="Signal-driven systems programming language (Unified Toolchain)"
arch=('x86_64')
url="https://github.com/p1rater/NanLang"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'raku')
makedepends=('go' 'gcc' 'make' 'git' 'binutils' 'rakudo')
provides=('nanlang')
conflicts=('nanlang' 'npi')
source=("local_src::git+file://${PWD}/../")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/local_src"
  printf '3.0.1.r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/local_src"
  msg2 "Building unified toolchain from local source..."
  make unified GO_BUILD_FLAGS="-trimpath -buildvcs=false"
}

package() {
  cd "$srcdir/local_src"

  # Binaries
  install -Dm755 bin/nanlang "$pkgdir/usr/bin/nanlang"
  install -Dm755 bin/nanlang_cpp "$pkgdir/usr/bin/nanlang_cpp"

  # Config and metadata
  install -Dm644 npi.conf "$pkgdir/etc/nanlang/npi.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [[ -f docs/README.md ]]; then
    install -Dm644 docs/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  elif [[ -f README.md ]]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  fi

  # Tooling and NanLang assets
  install -d "$pkgdir/usr/share/nanlang/scripts"
  install -d "$pkgdir/usr/share/nanlang/lib"
  install -d "$pkgdir/usr/share/nanlang/examples"

  if [[ -f installer.sh ]]; then
    install -Dm755 installer.sh "$pkgdir/usr/share/nanlang/installer.sh"
  fi
  if [[ -d scripts ]]; then
    cp -r scripts/. "$pkgdir/usr/share/nanlang/scripts/"
  fi
  if [[ -d lib ]]; then
    cp -r lib/. "$pkgdir/usr/share/nanlang/lib/"
  fi
  if [[ -d examples ]]; then
    cp -r examples/. "$pkgdir/usr/share/nanlang/examples/"
  fi

  msg2 "Package structure completed."
}
