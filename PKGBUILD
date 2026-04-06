# Maintainer: Edmund Lodewijks <edmund [AT] proteamail [DOT] com>

pkgname=mimosa
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI to manage passwords"
arch=('x86_64')
url="https://github.com/pimalaya/mimosa"
license=('AGPL-3.0-only')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'readme-doctests.patch')
b2sums=('81346e38c9c676b8db46072de989cb8715902a229a2472d5fe16667ef50c96d3a2f0cbe46c77cb2b42eb95de605726113a69c032049789fc139c0d6205d641ec'
        '31f6ce81654b00bef5cc63ea8c1c8faa6ba87ac6df6e2c19e91a29639c5cec0416500b77be4bdd789523c6bfc78d052cbf03ebf1dd4a2952f59e667c17f2ea36')

_features='dbus-secret-service'

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../readme-doctests.patch
cargo fetch --locked --target "$(rustc --print host-tuple)"
  mkdir -p {completions,man}
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  cargo build --frozen --release --no-default-features --features "$_features"
  target/release/$pkgname completions bash fish zsh -d completions/
  target/release/$pkgname manuals man/
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --no-default-features --features "$_features"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  find man/ -type f -exec install -Dm 644 -t "$pkgdir/usr/share/man/man1" {} \;
}

# vim:set ts=2 sw=2 et:
