# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi-bin'
_tag='Prod-Release-1.8.2'
pkgver=1.8.2
pkgrel=1
pkgdesc="Universal Package Manager & Environment Setup Tool (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/Zillowe/Zillwen/Zusty/Zoi"
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
_license_url='http://gitlab.com/Zillowe/Zillwen/Zusty/Zoi/-/raw/main/LICENSE'

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$url/-/releases/Prod-Release-$pkgver/downloads/${pkgname%-bin}-linux-amd64.tar.zst"
              "LICENSE::$_license_url")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$url/-/releases/Prod-Release-$pkgver/downloads/${pkgname%-bin}-linux-arm64.tar.zst"
               "LICENSE::$_license_url")

sha512sums_x86_64=('c72248254cd1d2c72365b86b291fa96b22717587fcdc8974a296cc6ea984c847a622b5a787209052700876d5d99d40745ff0c4591e0c19b3c398f1572870c66c'
                   'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea')
sha512sums_aarch64=('d3dfea979fb6773174fec8a348fa9226cfd5257a38aab57767efd39a3c6407c47c52ad80d9e2c9d2a55261f0db3e3b7730a91e0ecd64fdd7bea6854b8d288a79'
                    'e2cca3fc757382874694b00e85372aa114ef6f6196d767ba445b4499f170ef6589e3aab60d41615bdc1a74596a1f0f6b148a934b19b69e639de1fddf6dd2b2ea')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _bash_completion_dir="$pkgdir/usr/share/bash-completion/completions"
  install -d "$_bash_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions bash > "$_bash_completion_dir/${pkgname%-bin}"

  local _zsh_completion_dir="$pkgdir/usr/share/zsh/site-functions"
  install -d "$_zsh_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions zsh > "$_zsh_completion_dir/_${pkgname%-bin}"

  local _fish_completion_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -d "$_fish_completion_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-completions fish > "$_fish_completion_dir/${pkgname%-bin}.fish"

  local _man_dir="$pkgdir/usr/share/man/man1"
  install -d "$_man_dir"
  "$pkgdir/usr/bin/${pkgname%-bin}" generate-manual
  install -Dm644 manuals/*.1 "$_man_dir"
}
