# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.29.4
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
sha512sums=('a3676950f84dba4a8c5029d9704c4608a0a5ed2f63db5c9f76e5aeaad305b111216f9f343b0b53faa08c04c61de431e647708e057f1cb5fade5f2fb9ad3db4d8'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'dd725a538b37cf48728879e2434b1821a663096a3d58ebaccc4266b27c5dc489e44423db3e50619365ed87bc0879364e2f0c22c0d28867873b55148b9340f935'
  'ba56c449375206d999581ce408119250422271f75e5acdbbddf0b80fbabb983a3576d6dac29aa12fa82ad17cc699200a73b646fcc404b34c9cd32aadcd30f9a4'
  'd5c1fd30e492f4eaea9b394df88d14bce7f2f1c69e3592f9b368d50e5fff6c449a29adc228c7d9711a33368712d3b6e29af29728b0f182d7897cee7037dfd2bd')

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
