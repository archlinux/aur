# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-beta-bin
pkgver=1.93.110
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
sha512sums_x86_64=('d3621c304840bdf7c891c4885479bd1f29a96cb1026c70985ceef501e4e6f7d6d1f2190d2f5cfc71cb61e45c06533ef65d1833807300cf1f43807967c7ab9f30')
sha512sums_aarch64=('101d93eadc4a2270d12a93459c75f5e28c20f888cc5f4d3e5f1b3f91bb6fe84fbd89c9e5ef83d06bb845d1506a721f83838d4ef5419c72025b9f72a2a5cbe735')

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
