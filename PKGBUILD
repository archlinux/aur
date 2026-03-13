# Maintainer: Gökhan C. <caygkhan@gmail.com>
pkgname=waykey
pkgver=1.0.2
pkgrel=1
pkgdesc="Next-generation Wayland-compatible automation engine (AutoHotkey alternative)"
arch=('x86_64')
url="https://github.com/gkhanC/Waykey"
license=('MIT')
depends=('nodejs' 'hyprland' 'libevdev' 'polkit')
makedepends=('npm' 'cmake' 'make' 'gcc')
install=waykey.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/gkhanC/Waykey/archive/v$pkgver.tar.gz"
        "waykey.service"
        "waykey.sh"
        "99-waykey-uinput.rules")
sha256sums=('f69bfb3f1ab295c82123797812d22cc9f33f2299e9747f71a93e070449e16565'
            'b2bcf29e55b7036351d63c803cfa3ab395e0f6af983783fa6ea0900d54969045'
            '61623bca691d4a81407c401bd29ebd791d377a33f75eb2c5f2921c376956c516'
            '7ebfb37b30ee3863184e2b636268f4a5d2a62221504eff652000258781d74277')

package() {
    # 1. Gerekli dizinleri oluştur
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/systemd/user"
    mkdir -p "${pkgdir}/etc/udev/rules.d"

    # 2. Arşivden çıkan dizine gir
    cd "${srcdir}/Waykey-${pkgver}"
    
    # 3. Proje dosyalarını kopyala
    cp -r package.json src public scripts index.js run.js "${pkgdir}/opt/${pkgname}/"
    [ -f package-lock.json ] && cp package-lock.json "${pkgdir}/opt/${pkgname}/"
    
    # 4. Bağımlılıkları kur (Husky hatasını önlemek için scriptleri yok sayıyoruz)
    cd "${pkgdir}/opt/${pkgname}"
    npm install --omit=dev --ignore-scripts

    # 5. Yardımcı dosyaları yerleştir (Source listesinden gelen dosyalar $srcdir içindedir)
    install -Dm644 "${srcdir}/waykey.service" "${pkgdir}/usr/lib/systemd/user/waykey.service"
    install -Dm644 "${srcdir}/99-waykey-uinput.rules" "${pkgdir}/etc/udev/rules.d/99-waykey-uinput.rules"
    install -Dm755 "${srcdir}/waykey.sh" "${pkgdir}/usr/bin/waykey"
}
