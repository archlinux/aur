# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-beta-bin
pkgver=1.92.117
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
sha512sums_x86_64=('c2700cdc4421932a2df0c5e1ce155ccb5c5d4ce4a77ebed69e0df7a580c182296c7a30b2f051bcd40ac02cdcc8b23997a1844f215f669808b9947c0c4ce3d22c')
sha512sums_aarch64=('338b5908aad1d751c9a45e16c768386febb8a26e73204e350f767f573f0c193e5dd75b36eb39a171d1fd3af8d0f1a2d49f067d76bf9bff83cd70f78cf2ec71b6')

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
