# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi'
_tag='Prod-Beta-3.7.2'
pkgver=3.7.2_beta
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
sha512sums=('61f3a89de8ad53c32e2f06bbac3704204f56c13787902859796c452c049af3ca76f3871dc4a722463efb6ca6c1cc688d625dde88cc4503cf4b054b092875a909'
            'b3923750b32ac92a6305437fec688b51fdd2083f2fa51a5a5ac87a0359937e574edf909b02cfc7f26197df730810102572944fe294a0f8f605fe8264ab825afb')

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
}
