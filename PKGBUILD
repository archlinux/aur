# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname='wasmer-bin'
pkgver='2.1.1'
_shortver="${pkgver%.*}"
_majorver="${_shortver%.*}"
pkgrel='1'
pkgdesc='Universal WebAssembly runtime'
arch=('x86_64')
license=('MIT')
url='https://wasmer.io/'
_repo='https://github.com/wasmerio/wasmer'
depends=('bash')
conflicts=(
  'wasmer'
  'wapm'
)
provides=(
  'wasmer'
  'wasmer-headless'
  'wapm'
  'wasm.h'
  'wasmer_wasm.h'
  'wasmer.h'
  'libwasmer.a'
  "libwasmer.so.$pkgver"
  "libwasmer.so.$_shortver"
  "libwasmer.so.$_majorver"
  "libwamser.so=$pkgver"
)
source=(
  "wasmer-linux-amd64-$pkgver.tar.gz::$_repo/releases/download/$pkgver/wasmer-linux-amd64.tar.gz"
  "https://raw.githubusercontent.com/wasmerio/wasmer/$pkgver/LICENSE"
)
sha512sums=(
  'SKIP'
  'SKIP'
)
options=(
  'strip'
  'libtool'
  'staticlibs'
)

build() {
  cd "$srcdir"

  msg2 'Creating shell completion files for wapm...'
  for shell in bash zsh fish; do
    ./bin/wapm completions "$shell" >"wapm-$shell-completions"
  done
}

package() {
  cd "$srcdir"

  msg2 'Installing executable commands...'
  for name in wasmer wapm wax; do
    install -Dm755 "bin/$name" "$pkgdir/usr/bin/$name"
  done

  msg2 'Installing libraries...'
  for name in wasm.h wasmer_wasm.h wasmer.h; do
    install -Dm644 "include/$name" "$pkgdir/usr/include/$name"
  done
  install -Dm644 lib/libwasmer.a "$pkgdir/usr/lib/libwasmer.a"
  install -Dm755 lib/libwasmer.so "$pkgdir/usr/lib/libwasmer.so.$pkgver"
  ln -s "libwasmer.so.$pkgver" "$pkgdir/usr/lib/libwasmer.so.$_shortver"
  ln -s "libwasmer.so.$pkgver" "$pkgdir/usr/lib/libwasmer.so.$_majorver"
  ln -s "libwasmer.so.$pkgver" "$pkgdir/usr/lib/libwasmer.so"

  msg2 'Installing shell completion files for wapm...'
  install -Dm644 wapm-bash-completions "$pkgdir/usr/share/bash-completion/completions/wapm"
  install -Dm644 wapm-zsh-completions "$pkgdir/usr/share/zsh/site-functions/_wapm"
  install -Dm644 wapm-fish-completions "$pkgdir/usr/share/fish/completions/wapm.fish"

  msg2 'Installing license...'
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  msg2 'Installing documentation...'
  install -Dm644 include/README.md "$pkgdir/usr/share/doc/$pkgname/wasmer-runtime-api.md"
}
