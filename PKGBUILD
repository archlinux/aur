# Maintainer: ZilloweZ <zillowez@gmail.com>

pkgname='zoi-bin'
_tag='Prod-Release-1.1.1'
pkgver=1.1.1
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

source_x86_64=("${pkgname%-bin}-linux-amd64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-amd64.tar.zst"
              "LICENSE::$_license_url")
source_aarch64=("${pkgname%-bin}-linux-arm64.tar.zst::$url/-/releases/$_tag/downloads/${pkgname%-bin}-linux-arm64.tar.zst"
               "LICENSE::$_license_url")

sha512sums_x86_64=('0f1b9c9a4aa914edaf9c554faac838b0c99e90e053fe691ba14a5247f4ab930c806bef3746ee28b53e75e81cf844e6eff40c552749abdad35d9b5ce1afdf4fbc'
                   '79caa3cd361a8875ce9c8c3ecc8c5ac085088b5fde880a3de45def41800d85ad5c6679c589a263e8e3eac2497188d13e26e534d20d2dcdfd665bbd7ead79d3a4')
sha512sums_aarch64=('6e46a84b2b8523dbdc79c0a28bcfc81b1716faa01d01801095c49fedcc8061ffbba2e016829c7b869ac169928002d83e9b946f1175750e561dd8c7297e95a571'
                    '79caa3cd361a8875ce9c8c3ecc8c5ac085088b5fde880a3de45def41800d85ad5c6679c589a263e8e3eac2497188d13e26e534d20d2dcdfd665bbd7ead79d3a4')

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
