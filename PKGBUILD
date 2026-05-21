# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-beta-bin
pkgver=1.91.158
pkgrel=1
pkgdesc='The minimalist browser from the makers of Brave (beta binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/origin/download-beta'
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
source_aarch64=("https://github.com/brave/brave-browser/releases/download/v${pkgver}/${pkgname%-bin}-beta_${pkgver}_arm64.deb")
sha512sums=('d29202fe9c1433cc70f2f8032c1d3c8d61d4eac88324c4ddd475f59ce9198e1ff6b6ec2c6005e932960dda83439aae5092251c7dd90321c91b9775b31c4f5d51')
sha512sums_x86_64=('25840e69d12fee7a9cddff25eb0bbcf91860b89ac76b4a8f1e3e9c1bc0aba2f92f71b82ff40b71d3fdd588436e3a51ade9929a2a96757c469bb852996a3f9844')
sha512sums_aarch64=('12c6763b206bd49a37c90b6bd8e730e9f08922db3580d8d5c8b35ea425f13edf7d86795269ee9e516a03c20454f17966c7cb7e1ddad2a0ab37ef5824c8b0d3c4')

prepare() {
  mkdir -p brave
  tar -xf data.tar.xz -C brave
  rm -rf "brave/opt/brave.com/${pkgname%-bin}/cron"
}

package() {
    cp -a --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --reflink=auto brave/usr "$pkgdir/usr"
    rm -f "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm0644 "brave/opt/brave.com/${pkgname%-bin}/product_logo_128_beta.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/${pkgname%-bin}/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/${pkgname%-bin}/chrome-sandbox"
}
