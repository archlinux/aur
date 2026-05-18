# Maintainer: brave-prerelease <aur-prerelease@brave.com>

pkgname=brave-origin-nightly-bin
pkgver=1.92.70
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

sha512sums_x86_64=('5250f4625c8811b5ef8d4411233f49b5f6ff1ba4e539c738654044e9b10cd27d3464a6b19d9cef0de9ab32b3b15f84b713a6fdc0ad5cf8e99d53eb30cddd3d36')
sha512sums_aarch64=('457fde9c0d8c08d5fa6d10523421e9bf24d7076b4ec15b7f4c46f474e69751202d75609017b65ed06627dcd00b6dc9b60b6e73444c7f36b9971da67b7f17d9a2')

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
