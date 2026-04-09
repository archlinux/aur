# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-nightly-bin
pkgver=1.91.28
pkgrel=1
pkgdesc='The minimalist browser from the makers of Brave (nightly binary release).'
arch=(x86_64 aarch64)
url='https://brave.com/origin/download-nightly'
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
sha512sums=('1cedf14d368cf2fda8cc0036f391b27ff6397128b078d0daebc66ac7ca0033df44d5198fded6cbc5dd5d45b01bf97db7520fd67fe7fd42db8ec0c4051911c0d6')

sha512sums_x86_64=('a71782a0fd3847089161b114a3f77f00c9e2bab7821c310b08c2815365d39deb12d944aaf5a37eb94044dc7a40d85940a697dc80a35612fae31213917491c3d6')
sha512sums_aarch64=('42d8348c519be523bafe8be55326231cb7e6acf73abf76e015731ca75b7feb0ec513404ccf9268316481d846f23639d68bbf8b4f72466b94d87bfa674be0194b')

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
    install -Dm0644 "brave/opt/brave.com/${pkgname%-bin}/product_logo_128.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/${pkgname%-bin}/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/${pkgname%-bin}/chrome-sandbox"
}
