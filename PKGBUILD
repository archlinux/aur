# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=fblog-bin
pkgver=4.9.0
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
sha512sums_x86_64=('28dd39c7dfc858c92a03d26ae3d010c601d7253a9b738b4ab1950b28bf75c93c6c79459c774a68e95715e0aee062e77a12eb174817914b5168c1f82dbb27d316'
                   '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421'
                   'b18443354a50c2c1650c3a97823693552f47e9dcf77a02bdf96d447e0de34bb697d1976862c7457ec38e16e106a2d0a00f06b176538352cbd379609121329d5e')

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
