# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-bin
pkgver=4.13.0
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
sha512sums_x86_64=('f2f1e9f63ab96d8d6e5dc39befab407bb2c0891e0e35f28a266c2d30a257cc8aaca59e94c94f68e4c225795bef7f560ea423f17f33932c8c47e618293d0c45f0'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   'f623b15fb2bba71a15ad65bb95c4badd866cfe02ac8f7d60d196effcc16a58e82e68e95f5d173e3f6ff96fb474559e969d68d3bfdac50e7b666ae016c79af21c')

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
