# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=php-castor
_pkgname=castor
pkgver=1.7.0
pkgrel=1
pkgdesc='A lightweight and modern task runner, automate everything in PHP (phar, uses system PHP)'
arch=('x86_64' 'aarch64')
url='https://castor.jolicode.com/'
license=('MIT')
depends=('php>=8.4')
conflicts=('php-castor-bin')
options=(!strip !debug)

_url_base="https://github.com/jolicode/castor/releases/download/v$pkgver"

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/jolicode/castor/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.phar::$_url_base/castor.linux-amd64.phar")
source_aarch64=("$_pkgname-$pkgver-aarch64.phar::$_url_base/castor.linux-arm64.phar")

sha256sums=('873ddfe436c906c14a9069c2358f2f81dd95d140c88a44c390419bcebc920409')
sha256sums_x86_64=('dfa7cd28a787049708b46cf7b8c9b51c1a0c92b84fb4eaa2c753e8cb4d647369')
sha256sums_aarch64=('7121e8e69733ff81ada654e5e55eac274ad912985d936d9c794e92f1f38e3198')

build() {
  cd "$srcdir"

  # The completion scripts embed basename($argv[0]), so generate them from a
  # copy named exactly like the installed command.
  install -Dm755 "$_pkgname-$pkgver-$CARCH.phar" "$_pkgname"

  ./"$_pkgname" completion bash >"$_pkgname.bash"
  ./"$_pkgname" completion zsh >"_$_pkgname"
  ./"$_pkgname" completion fish >"$_pkgname.fish"
}

package() {
  cd "$srcdir"

  # The phar already carries a `#!/usr/bin/env php` shebang.
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  install -Dm644 "_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  install -Dm644 "$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
