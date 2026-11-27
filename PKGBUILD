# Maintainer: ZilloweZ <zillowez@proton.me>

pkgname='zoi'
_tag="Prod-Release-$pkgver"
pkgver=1.29.21
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
sha512sums=('69666d9dd22d140a7599b0f31901ccb1d6940f846c551cbae84afaea9d00ecbdb3a6c5b37137f1008b8f03b9568550d8f2358ee635af444ed23685033e8be3a8'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea'
  'b7ed98d0183f302f804cfaef2b599b7d1cfd980246d3344b41a1021cd0fa1add8c00d9b76ab0d77d97f76ea2c6cfb0e5cc621bfef532a412c27af32eaeca3512'
  '3646263f4372a6edd0732a4a380bdd0d23de21db11f39503ea3637e5277c0b1363269af3e6eabfd1ea1b7ef5585b85e97f4f013d4c1286399692e849971f8472'
  '82328a6a18dda5efa97fe653e80359046374d35a140cc936332b72f41b0ed12443b1e52fef2b2c0d0c43e254acd9f5d9fc15a8815dea3df17f4cd087736230b4')

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
