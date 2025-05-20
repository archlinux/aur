# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-bin
pkgver=4.14.0
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
sha512sums_x86_64=('f8c294aba9b14f7f12a4d825eca543f0dc99799c05b421702872b089486268cd86ca82d927fe03702a68d0abc9ed83101bae8ad62eaec77ef5077c106faea7d4'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   'dab3f0404526fca532936925a2110cf25e7dc583b7f08584d64a8b358dec72829418334c687791b41d0a14a3cbfeb61493b2456ba075fe0586ab17ae0ef38fec')

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
