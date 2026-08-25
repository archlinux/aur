# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.26.0
pkgrel=1
pkgdesc="Advanced Package Manager & Environment Orchestrator"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/zillowe/zillwen/zusty/zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
makedepends=('cargo' 'just')
depends=('git' 'gnupg')
optdepends=(
  'bash-completion: for bash shell completion'
  'zsh: for zsh shell completion'
  'fish: for fish shell completion'
  'bubblewrap: for running contained apps'
)

source=("$url/-/archive/$_tag/Zoi-Prod-Release-$pkgver.tar.gz"
  "LICENSE::$url/-/raw/main/LICENSE")
sha512sums=('ea21af87727b5cc15a14934ec22a02401aa55b62c894d6de0b532ed5de221666f14270e4b3a504deba88ef306c32821092fb16c2b25bbf7095cda3c8392400d9'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea')

build() {
  cd "$srcdir/$_pkgname_cap-$_tag"
  ./configure --prefix=/usr
  just build
}

package() {
  cd "$srcdir/$_pkgname_cap-$_tag"
  just install

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/$pkgname" generate-completions bash >"$_bash_completion_dir/$pkgname"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/$pkgname" generate-completions zsh >"$_zsh_completion_dir/_$pkgname"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/$pkgname" generate-completions fish >"$_fish_completion_dir/$pkgname.fish"

  local _man_dir="$pkgdir/usr/share/man/man1"
  install -d "$_man_dir"
  "$pkgdir/usr/bin/$pkgname" generate-manual
  install -Dm644 manuals/*.1 "$_man_dir"
}
