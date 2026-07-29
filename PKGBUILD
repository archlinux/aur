# Maintainer: Gökhan C. <caygkhan@gmail.com>
pkgname=waykey
pkgver=1.0.5
pkgrel=3
pkgdesc="Next-generation Wayland-compatible automation engine (AutoHotkey alternative)"
arch=('x86_64')
url="https://github.com/gkhanC/Waykey"
license=('MIT')
depends=('nodejs' 'hyprland' 'libevdev' 'polkit')
makedepends=('npm' 'cmake' 'make' 'gcc' 'python')
options=('!strip')
install=waykey.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/gkhanC/Waykey/archive/v$pkgver.tar.gz"
        "waykey.service"
        "waykey.sh"
        "99-waykey-uinput.rules")
sha256sums=('248f6706b07072665ca4718734bfe9916842481b3bcbfbc716d5a0db81f47f40'
            '396f7cc64a1236b9c56c446e8e70ecfed51bcb187c4dbe1fdab5f3c992211760'
            '945fb801ea580b9b2995803d32bf1c62af4fbc3ef7dbee5a088a0cad4618f7e2'
            '7ebfb37b30ee3863184e2b636268f4a5d2a62221504eff652000258781d74277')

build() {
    cd "${srcdir}/Waykey-${pkgver}"
    
    # Bağımlılıkları kur (Husky hatasını önlemek için scriptleri yok sayıyoruz)
    npm install --omit=dev --ignore-scripts
    
    # C++ Eklentisini (addon) derle
    npm run build
}

package() {
    cd "${srcdir}/Waykey-${pkgver}"
    
    # 1. Gerekli dizinleri oluştur
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/systemd/user"
    mkdir -p "${pkgdir}/etc/udev/rules.d"

    # 2. Proje dosyalarını ve derlenmiş klasörleri kopyala
    cp -r package.json src public scripts index.js run.js binding.gyp build node_modules "${pkgdir}/opt/${pkgname}/"
    [ -f package-lock.json ] && cp package-lock.json "${pkgdir}/opt/${pkgname}/"
    
    # Kopyalanan dosyaların izinlerini ayarla (opt/waykey dizini için)
    chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"

    # 3. Yardımcı dosyaları yerleştir (Source listesinden gelen dosyalar $srcdir içindedir)
    install -Dm644 "${srcdir}/waykey.service" "${pkgdir}/usr/lib/systemd/user/waykey.service"
    install -Dm644 "${srcdir}/99-waykey-uinput.rules" "${pkgdir}/etc/udev/rules.d/99-waykey-uinput.rules"
    install -Dm755 "${srcdir}/waykey.sh" "${pkgdir}/usr/bin/waykey"
}
