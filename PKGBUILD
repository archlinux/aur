# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi'
_tag='Prod-Release-1.1.1'
pkgver=1.1.1
pkgrel=1
pkgdesc="Universal Package Manager & Environment Setup Tool"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zillowe/Zillwen/Zusty/Zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('cargo' 'make')
depends=('git')
optdepends=(
    'bash-completion: for bash shell completion'
    'zsh: for zsh shell completion'
    'fish: for fish shell completion'
    'less: for viewing files'
)

source=("$url/-/archive/$_tag/Zoi-$_tag.tar.gz"
        "LICENSE::$url/-/raw/main/LICENSE")
sha512sums=('4270bb0c17803ba4d3892952562f4632cd9b118f7a51137ccb4c541ff9b23f39c7a34afa86748f81f433ab7cbdf46d49afabef87a859ee72d8ce6900f5c16568'
            '79caa3cd361a8875ce9c8c3ecc8c5ac085088b5fde880a3de45def41800d85ad5c6679c589a263e8e3eac2497188d13e26e534d20d2dcdfd665bbd7ead79d3a4')

build() {
  cd "$srcdir/$_pkgname_cap-$_tag"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname_cap-$_tag"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/$pkgname" generate-completions bash > "$_bash_completion_dir/$pkgname"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/$pkgname" generate-completions zsh > "$_zsh_completion_dir/_$pkgname"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/$pkgname" generate-completions fish > "$_fish_completion_dir/$pkgname.fish"

  local _man_dir="$pkgdir/usr/share/man/man1"
  install -d "$_man_dir"
  "$pkgdir/usr/bin/$pkgname" generate-manual
  install -Dm644 manuals/*.1 "$_man_dir"
}
