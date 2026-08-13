# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=php-castor-bin
_pkgname=castor
pkgver=1.7.0
pkgrel=1
pkgdesc='A lightweight and modern task runner, automate everything in PHP (static binary, PHP embedded)'
arch=('x86_64' 'aarch64')
url='https://castor.jolicode.com/'
license=('MIT')
provides=("php-castor=$pkgver")
conflicts=('php-castor')
options=(!strip !debug)

_url_base="https://github.com/jolicode/castor/releases/download/v$pkgver"

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/jolicode/castor/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$_url_base/castor.linux-amd64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$_url_base/castor.linux-arm64")

sha256sums=('873ddfe436c906c14a9069c2358f2f81dd95d140c88a44c390419bcebc920409')
sha256sums_x86_64=('4ee2df3d779d44b750f0c38375ccc4c1bd784965a1624dda6e30402576d0dc52')
sha256sums_aarch64=('b140d82cd001fe08fcffe8ff2eaa82b1ba24286deeeeb671d5d20eb9e94c99b1')

build() {
  cd "$srcdir"

  # The completion scripts embed basename($argv[0]), so generate them from a
  # copy named exactly like the installed command.
  install -Dm755 "$_pkgname-$pkgver-$CARCH" "$_pkgname"

  ./"$_pkgname" completion bash >"$_pkgname.bash"
  ./"$_pkgname" completion zsh >"_$_pkgname"
  ./"$_pkgname" completion fish >"$_pkgname.fish"
}

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
