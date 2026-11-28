# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.29.25
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
sha512sums=('52410ac0b7af85bae5f7e1a61e373ed2d0bf52e9e0e2a348484140e62c0b4efe07ddbc1042c1c606a8703b7632679facaae6851e4ccb3d174bcf5109e5b4bba0'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  '5a01703035cc2b11a7954a3ac21fd5d160e24dc40040525d578603e77411d73fb09c62bb95a1c616b857b9c034e21450c52362800b9365d15eb70dbd3e093a98'
  'c94bec0e8d2ccdbb8773fd60700dc90b0cc3479b308e25c12f6442b54a197b693f891059ea4ab1ac691eb2a835003a78168644c2368afc0b9281914d71865a50'
  '4548c01b3aa10112dc289bf9d6b787e9d228efa612c85921ee39d0661c1347ef3b6685e47096d7fb5153476012b39c6a8784a4e52bbd9d5377a0d6c6c45e5ed3')

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
