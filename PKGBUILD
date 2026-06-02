# Maintainer: Aditya Hebballe <adityahebbale@gmail.com>

pkgname=brave-origin-bin
pkgver=1.91.166
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
sha256sums_x86_64=('5dee5fa8ff3151a10e2ad0d536f1955d029a1d72837607610676f4b6e754b06f')
sha256sums_aarch64=('358c2de8e55a317b9c823db1702cd7f74a211e1656c1f269a041933c4b314da8')

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
