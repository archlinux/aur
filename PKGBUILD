

pkgname=jaq-git
pkgver=3.1.0.15.gb3365b2a
pkgver() {
  cd jaq
  git describe --long --tags | sed -e "s/v//" -e 's/-alpha-/.r/' -e 's/\-/\./g'
}
pkgrel=1
pkgdesc='A jq clone'
url=https://github.com/01mf02/jaq
arch=('x86_64')
license=(MIT)
depends=(gcc-libs glibc mimalloc)
makedepends=(rust jotdown)
conflicts=(jaq jq)
provides=(jaq jq)
source=("git+${url}.git" build.rs
"git+https://github.com/purpleprotocol/mimalloc_rust")
b2sums=('SKIP'
        'd0256b59336fc4bd50d594577f6f816d5ba472e2de633d81a3c52853fdf9fed7b5f08f5c8dbb9ba5a4cb7b8786bb4d1a39a6a3f7eb2227a87a755876dbbc7b0e'
        'SKIP')

prepare() {
  cp -vf build.rs -t mimalloc_rust/libmimalloc-sys
  cd jaq
  cat >> Cargo.toml <<END
[patch.crates-io]
mimalloc.path = "../mimalloc_rust"
END
  cargo update -p mimalloc
}

build() {
  cd jaq
  test $RUSTC_BOOTSTRAP = 1 && test -e /usr/lib/rustlib/src/rust/library/Cargo.toml && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic=\"immediate-abort\" -Zpanic-immediate-abort'
  RUSTFLAGS+=" -C force-unwind-tables=no"
  cargo build --release $_cargoflags
  make -C docs jaq.1
}

package() {
  unset optdepends
  cd jaq
  install -Dm 755 target/release/jaq -t "$pkgdir"/usr/bin
  install -Dm 755 docs/jaq.1 -t "$pkgdir"/usr/share/man/man1
  ln -sf jaq "$pkgdir"/usr/bin/jq
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
