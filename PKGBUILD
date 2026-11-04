# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.29.6
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

_downloads="$url/-/releases/$_tag/downloads"

source=("$url/-/archive/$_tag/Zoi-Prod-Release-$pkgver.tar.gz"
  "LICENSE::$_downloads/LICENSE"
  "zoi.1::$_downloads/zoi.1"
  "zoi-rs.3::$_downloads/zoi-rs.3"
  "zoi-lua.5::$_downloads/zoi-lua.5")
sha512sums=('e260364a34a457decf6b6ce76e2ac6a45f70c25525f6df3ca677e9822ea0cda135109e68751d110545beb94e786d57ec94cf7cc4bec40fde46d7ecde975d7a14'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '9e1c068a62301a853f3377fa3323a81c25c28a69825969da07e87ca89e0f62504f164fbcdd4693b1a185cd89ecb76027c738ec119137b4b22eaa5f489c8779b7'
  '3d171e604d51e08ccbcd633bfac5019d6d597f67525c442e98bc6b47268a3a4483fea671cb7cf2b287af55592ba393651ea8a1ed033bbd100dbc15d722371f90'
  'baf75e87fd29d97ac3bd11db85c42b45d6707d5f3f6a97d13fda98fcb7214ec274a490e98a158ca5119a48a70ab5fa97fe869b8d3c00eb316eb7abe63b78d56a')

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

  install -Dm644 "$srcdir/zoi.1" "$pkgdir/usr/share/man/man1/zoi.1"
  install -Dm644 "$srcdir/zoi-rs.3" "$pkgdir/usr/share/man/man3/zoi-rs.3"
  install -Dm644 "$srcdir/zoi-lua.5" "$pkgdir/usr/share/man/man5/zoi-lua.5"
}
