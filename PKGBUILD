# Maintainer: Aditya Hebballe <adityahebbale@gmail.com>

pkgname=brave-origin-bin
pkgver=1.91.167
pkgrel=1
pkgdesc='The minimalist browser from the makers of Brave (stable binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/origin/download'
license=('MPL2')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'ttf-font')
optdepends=('cups: Printer support'
            'mesa: Hardware accelerated rendering'
            'libglvnd: Support multiple different OpenGL drivers at any given time'
            'libgnome-keyring: gnome keyring support')
provides=("${pkgname}" "${pkgname%-bin}")
conflicts=()
source=("$pkgname.sh")
options=(!strip)
source_x86_64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
sha256sums=('9b50a38b3166158ceeb11a30868b422b6c6a004cf0d09ade9426d69fdbff5f4a')
sha256sums_x86_64=('7327872cee5e5c91f7dc2ddbc324e5fa2b282e59e164c84755ee1012f7da60f0')
sha256sums_aarch64=('82ccb2347405c0c32f9457f8b9d92b784e976eeade85ffc463857a9bff0dcdc3')

prepare() {
  mkdir -p brave
  tar -xf data.tar.xz -C brave
  rm -rf "brave/opt/brave.com/${pkgname%-bin}/cron"
}

package() {
    cp -a --no-preserve=ownership --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --no-preserve=ownership --reflink=auto brave/usr "$pkgdir/usr"
    rm -f "$pkgdir/usr/bin/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}-stable"
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/${pkgname%-bin}-stable"
    ln -s "${pkgname%-bin}-stable" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm0644 "brave/opt/brave.com/${pkgname%-bin}/product_logo_128.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/${pkgname%-bin}/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/${pkgname%-bin}/chrome-sandbox"
}
