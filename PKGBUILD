# Maintainer: Groctel <git@taxorubio.com>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name="zola"
pkgname="$_name-tera1"
pkgver=0.22.1
pkgrel=2
pkgdesc="The last Zola version before the breaking change to Tera 2"
conflicts=("$_name")
arch=('x86_64')
url="https://github.com/getzola/zola"
depends=('libgcc' 'glibc' 'oniguruma')
makedepends=('cargo')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0f59479e05bce79e8d5860dc7e807ea818986094469ed8bf0bb46588ade95982')

prepare() {
  cd "$_name-$pkgver"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$_name-$pkgver"
  CFLAGS+=' -ffat-lto-objects'
  RUSTONIG_DYNAMIC_LIBONIG=1 cargo build --frozen --release
}

check() {
  cd "$_name-$pkgver"
  RUSTONIG_DYNAMIC_LIBONIG=1 cargo test --frozen
}

package() {
  cd "$_name-$pkgver"
  local _target="target/release/$_name"
  install -Dm0755 -t "$pkgdir/usr/bin/" $_target
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$_name/" LICENSE
  $_target completion bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_name"
  $_target completion fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_name.fish"
  $_target completion zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_name"
}

# vim:set ts=2 sw=2 et:
