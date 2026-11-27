# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.29.20
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
sha512sums=('7a1964a2d9c98f930e8c2c5cc1470fd632b48f7ea69096724e8fda4f39145b00b376052908d231eb7bc72c82c9999e6f9979ca7ff7d03c1d6ee9bcefbda3f505'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'c105d89db440ea9ff7593eac3f21c558383bfb84c04c7e7933a722e7dd0f1cd4b040b81e24b5263568c50577ae9bf4293aa07837f3ef74e2b3747d2d1ed714b2'
  '4f2039e025c53a0568728010bb32e0ce09be81e756cd61f85a4ba62d8159e78fcce4befdc6a1d83bea338d2a3e42e4759cbd63c9414c9645309d7a7c1799416d'
  'f428608504605ef2cd863ad0ecdabdb840d788fadfac1c228a17b80f893d3f163f61be6c0f420b0620c3f7d401a981e13ae5515f4d1ede7a34cd0c95b022ab91')

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
