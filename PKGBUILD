# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-bin
pkgver=1.91.165
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
sha512sums=('5797cae4e66003d5dfce8e96a03ce8c756e20157e974c0710bfffa273b27008ebafdaf4e7372d23faea705d6a0546d0011e9022402f20124283cfff6164d32e3')
sha512sums_x86_64=('67e6c1a73a05c95dd4b1ec55dc9929cf9c844258bf219439e0a7bd03fc49f15cb44ff46f84edf8a906fb5209fbcb5fb5f092dc025fab80b022eb28fc4be13258')
sha512sums_aarch64=('a184775beb21929d0e92eb387e7fdb89c69b1fd14ee1eb7f215876d16ec50ac107627364900047dc1883386d994a6fe3e69ab50ed8226d88bf42c1f7ec48f6c0')

prepare() {
  mkdir -p brave
  tar -xf data.tar.xz -C brave
  rm -rf "brave/opt/brave.com/${pkgname%-bin}/cron"
}

package() {
    cp -a --no-preserve=ownership --reflink=auto brave/opt "$pkgdir/opt"
    cp -a --no-preserve=ownership --reflink=auto brave/usr "$pkgdir/usr"
    rm -f "$pkgdir/usr/bin/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}-stable"
    install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/${pkgname%-bin}"
    sed -i "s|/usr/bin/${pkgname%-bin}-stable|/usr/bin/${pkgname%-bin}|g" "$pkgdir/usr/share/applications/"*.desktop
    install -Dm0644 "brave/opt/brave.com/${pkgname%-bin}/product_logo_128.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/${pkgname%-bin}/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/${pkgname%-bin}/chrome-sandbox"
}
