# Maintainer: ZXY <3303057136@qq.com>

pkgname=verylup
pkgver=0.1.7
pkgrel=2
pkgdesc="The Veryl toolchain installer"
arch=('x86_64' 'aarch64')
url="https://github.com/veryl-lang/verylup"
license=('Apache-2.0' 'MIT')
provides=("$pkgname")
conflicts=("$pkgname")
_binlinks=('veryl' 'veryl-ls')
install='post.install'

makedepends=('cargo')
options=(!lto)

source=("$pkgname-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('394acd4e7599893469ccae9767817ac987aca8642998cbdf8a947c5f06d20db1')

prepare() {
  cd "$pkgname-${pkgver}"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-${pkgver}"
  cargo build --frozen --release --features no-self-update 
}

package() {
  cd "$pkgname-${pkgver}"
  install -Dm755 "target/release/verylup" "${pkgdir}/usr/bin/verylup"
  for link in "${_binlinks[@]}"; do
      ln -s /usr/bin/verylup "${pkgdir}/usr/bin/${link}"
  done

  # Generate completion files.
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir"/usr/bin/verylup completion bash verylup > "$pkgdir/usr/share/bash-completion/completions/verylup"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  "$pkgdir"/usr/bin/verylup completion fish verylup > "$pkgdir/usr/share/fish/vendor_completions.d/verylup.fish"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir"/usr/bin/verylup completion zsh verylup > "$pkgdir/usr/share/zsh/site-functions/_verylup"
  
  install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
  install -Dm644 LICENSE-APACHE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-APACHE
}

