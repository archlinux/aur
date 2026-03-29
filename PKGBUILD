# Maintainer: Gökhan C. <caygkhan@gmail.com>
pkgname=waykey
pkgver=1.0.4
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
sha256sums=('8e47c6b3779e63cf4b82f4a58473a051b22e95aa39256a4d3f99c03eb9cb1a11'
            '8a82ef6014f989efb9bd3366a58fe43ccd7c4df354bf6139dd45d01ca7316f43'
            '945fb801ea580b9b2995803d32bf1c62af4fbc3ef7dbee5a088a0cad4618f7e2'
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
