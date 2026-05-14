# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.13.0
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

source=("$url/-/archive/$_tag/Zoi-Prod-Release-$pkgver.tar.gz"
        "LICENSE::$url/-/raw/main/LICENSE")
sha512sums=('0565674ee3d7aedb6d06c20a66749dddeed3d616c29926aca48d4d5847f1ea36fa8f2a92e0a3db9aeaa6ba817bcac42df731daaf3d563d6a8c67d43083e55ee1'
            'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea')

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
