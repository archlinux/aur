# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=php-castor-bin
_pkgname=castor
pkgver=1.6.1
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
sha256sums_x86_64=('6ba05579ca9f6546a22421e935fdab0f7d9e774cb05a25b10fe9f9528e1ab30a')
sha256sums_aarch64=('9c0aa9827e99214a8a244dc41ea94eae651b979e852167f871799c5f22f1e2b7')

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
