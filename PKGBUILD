# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-nightly-bin
pkgver=1.94.52
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
sha512sums=('a9366d90e0e23cb098cae6a86fdd2ef102677df96a6caff27af8f48e7ddb3175829c8dbf32ef55cf6a13383aad9d3d9302826062d7e5743a8ac83960ec175e69')

sha512sums_x86_64=('39fa9f74fa4320dc7c99a3424cea9c3a2ee0d1340449856529e21b4170666d1e6d11172be2794d82ace9b3e487e5f5e806b09a2bde16517fe36a13deaa5b93fe')
sha512sums_aarch64=('74efebc36ccc38e51b46d553cb3f007ada323ca030b35fb1e37266a8f19b6c35dff5539c25eec505e320257835091ac4fe0196562bad5bb8cdc4b0b0d6cac89c')

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
    install -Dm0644 "brave/opt/brave.com/${pkgname%-bin}/product_logo_128_nightly.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm0664 -t "$pkgdir/usr/share/licenses/$pkgname" "brave/opt/brave.com/${pkgname%-bin}/LICENSE"
    chmod 4755 "$pkgdir/opt/brave.com/${pkgname%-bin}/chrome-sandbox"
}
