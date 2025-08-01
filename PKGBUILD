# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi'
_tag='Prod-Beta-3.2.6'
pkgver=3.2.6_beta
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
    'bat: for prettier viewing files'
    'less: for viewing files'
)

source=("$url/-/archive/$_tag/Zoi-$_tag.tar.gz"
        "LICENSE::$url/-/raw/main/LICENSE")
sha512sums=('2cba950ae08889b8f8fb21b163a26f49e9a92293c6b9dea79b4fbffb5400d37fedbd468696ae7b80d8c901565a098176149f91ca5b2bf96b8e03e2f6535ac0fa'
            'cc2dd6697f330b0269594e6906577f51846eb317a9f98c4334fad8bdd827f79221d286101ec11f097b56f910396ad6f7831c447e7b40019ecf39c487c65436b9')

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
