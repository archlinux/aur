# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-bin
pkgver=4.8.0
pkgrel=1
pkgdesc="Small command-line JSON log viewer"
arch=('x86_64')
url="https://github.com/brocode/fblog"
license=('custom:WTFPL')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/${pkgname%-bin}"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('ea53452cfba028f24b39115c11b69e0c06aef5a3409eb990f1524332a034d2b073e52c9083f685f283a663aa7f8253a8dcae0d25e6c5aa9d6a74eac834aae458'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   '6c84cef0d1b7db12294a45e3a0e71bb00603213de7598a641fda150c6f027d6cfd4d61e4f3a76f432d531f1fd6b01b99564fa6005a0997267e82612c6f0da37c')

prepare() {
  chmod +x $pkgname-$pkgver
  mkdir -p completions
}

build() {
  local compgen="./$pkgname-$pkgver --generate-completions"
  $compgen bash > "completions/${pkgname%-bin}"
  $compgen fish > "completions/${pkgname%-bin}.fish"
  $compgen zsh  > "completions/_${pkgname%-bin}"
}

package() {
  install -Dm 755 "$pkgname-$pkgver" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "completions/${pkgname%-bin}" -t "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm 644 "completions/_${pkgname%-bin}" -t "$pkgdir/usr/share/zsh/site-functions/"
}
