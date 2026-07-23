# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-beta-bin
pkgver=1.94.94
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
sha512sums_x86_64=('e3a2c93c21b9be7b43a1da0c6dadb57987979074cdd684001953c145b8c42109f564784ece1ff0e50e6e6fc2d6f317802813414f8913b0c3bb680f1000178e1a')
sha512sums_aarch64=('cfae128f1a8189295538767f0aa9a9b032f38cb6331d04605c5ae9fd0ef2a442156796cfb099587bf56c71a23dfd8cb6893e64585f2b8bbe87afb42860eefe21')

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
