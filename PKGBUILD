# Maintainer: Nakaya <eniehack at outlook dot jp>
pkgname='binchotan-backend-git'
pkgver=r80.ac92668
pkgrel=1
pkgdesc='Twitter client with programmable filters'
arch=('x86_64')
url='https://github.com/sei0o/binchotan-backend'
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/sei0o/binchotan-backend.git'
        'binchotan.service')
noextract=()
sha256sums=('SKIP'
            '1664eef4cde6cdae43c54aeff2cdf54080164de5abe4a3a6aaa98757e9f40ad8')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --frozen --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"

  install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/binchotan"

  install -Dm644 "resources/binchotan.service" "$pkgdir/usr/lib/systemd/user/binchotan.service"
  mkdir -p "$pkgdir/usr/share/${pkgname%-git}/filters"
  cp -rT "example_filters" "$pkgdir/usr/share/${pkgname%-git}/filters"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
  for f in docs/*.md; do
      cp "$f" "$pkgdir/usr/share/doc/${pkgname%-git}"
  done

  install -Dm644 "config.toml" "$pkgdir/usr/share/${pkgname%-git}/config.toml"
}
