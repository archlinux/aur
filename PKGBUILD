# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-beta-bin
pkgver=1.92.108
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
sha512sums_x86_64=('b1d37301f222e10775a69fc2ac7847367458831919cdac9dab78967c8d119f1e453c80dc3a6db1a7d3bd04cb46a0b2f371a2007a12693caa5a845eb3b508a7ae')
sha512sums_aarch64=('624afe8e3450dfee21c2a79abff46c65de519e814557a6179703917a091ea8c0aed9aaef7e41672763844d4c614db32c2b20ad06fefbbc60041d24ce471b5481')

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
