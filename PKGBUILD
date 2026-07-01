# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi-bin'
_tag="Prod-Release-$pkgver"
pkgver=1.20.4
pkgrel=1
pkgdesc="Advanced Package Manager & Environment Orchestrator (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/zillowe/zillwen/zusty/zoi"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('git')
optdepends=(
  'bash-completion: for bash shell completion'
  'zsh: for zsh shell completion'
  'fish: for fish shell completion'
  'less: for viewing files'
)
_license_url='https://gitlab.com/zillowe/zillwen/zusty/zoi/-/raw/main/LICENSE'

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$url/-/releases/Prod-Release-$pkgver/downloads/${pkgname%-bin}-linux-amd64.tar.zst"
  "LICENSE::$_license_url")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$url/-/releases/Prod-Release-$pkgver/downloads/${pkgname%-bin}-linux-arm64.tar.zst"
  "LICENSE::$_license_url")

sha512sums_x86_64=('eedfcfec2e453138454bc5708683f11b8ff805b1acd4700948dc231486f64e4c0e3cdc16203d779433f842ed36d4e906ecdb4c4033ad58054664aa3c831b8e6a'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea')
sha512sums_aarch64=('b90b1bb26314830c026f1617f0b015f7017cb5376f7bf1738d17c36cdda393a6652a77dd5af8389716aaedfe29bbbe7d85ac9b3c1b158cfedd974306ab517f13'
  'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions bash >"$_bash_completion_dir/${pkgname%-bin}"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions zsh >"$_zsh_completion_dir/_${pkgname%-bin}"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions fish >"$_fish_completion_dir/${pkgname%-bin}.fish"

  local _man_dir="$pkgdir/usr/share/man/man1"
  install -d "$_man_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-manual
  install -Dm644 manuals/*.1 "$_man_dir"
}
