pkgname=cargo-standalone-git
_gitname=cargo
pkgver=0.20.0.r4277.9fcdbb44
pkgrel=1
pkgdesc='Rust package manager'
url='http://crates.io/'
arch=('x86_64' 'i686')
license=('APACHE' 'MIT' 'custom')
depends=('curl' 'rust')
provides=('cargo')
conflicts=('cargo')
makedepends=('git' 'python' 'cmake' 'cargo')
optdepends=('gcc: for compiling C source code with gcc'
            'clang: for compiling C source code with clang')
options=('!emptydirs')
source=("git+https://github.com/rust-lang/cargo.git")
sha512sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"

  git submodule update --init --recursive
  sed 's^share/doc^share/licenses^g' -i configure
}

build() {
  cd "$_gitname"

  ./configure --prefix=/usr --disable-debug
  make
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install

  # Remove files that contains references to $srcdir or $pkgdir,
  # or that conflicts with the rust package.
  rm -f "$pkgdir/usr/lib/rustlib/"{install.log,manifest-cargo,uninstall.sh}

  install -d "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/usr/etc/bash_completion.d/cargo" \
    "$pkgdir/usr/share/bash-completion/completions/cargo"

  for f in LICENSE-APACHE LICENSE-MIT LICENSE-THIRD-PARTY; do
    install -Dm644 "$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
  done
}

# vim:set ts=2 sw=2 et:
