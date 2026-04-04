# Maintainer: P4ndaShi <p4ndab3y@proton.me>
pkgname=anizium-desktop-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Anizium için modern, sade ve Discord destekli Linux masaüstü uygulaması"
arch=('x86_64')
url="https://github.com/P4ndaShi/Anizium-Desktop-Linux"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libsecret' 'at-spi2-core')
makedepends=('npm' 'nodejs' 'git')
provides=('anizium-desktop')
conflicts=('anizium-desktop-bin')
source=("${pkgname}::git+https://github.com/P4ndaShi/Anizium-Desktop-Linux.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  npm install
  npm run build
}

package() {
  cd "${srcdir}/${pkgname}"
  
  # 1. Ana dizini oluştur ve dosyaları kopyala
  install -dm755 "${pkgdir}/opt/Anizium"
  cp -r dist/linux-unpacked/* "${pkgdir}/opt/Anizium/"

  # 2. Çalıştırılabilir link oluştur
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Anizium/anizium-desktop" "${pkgdir}/usr/bin/anizium-desktop"

  # 3. İkonları sistem dizinlerine yerleştir
  for size in 48 64 128 256 512; do
    install -Dm644 "icons/${size}x${size}/com.anizium.desktop.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/anizium-desktop.png"
  done

  # 4. Desktop Entry (Masaüstü Dosyası) kurulumu
  install -Dm644 "dist/linux-unpacked/resources/anizium-desktop.desktop" \
    "${pkgdir}/usr/share/applications/anizium-desktop.desktop"
  
  # Desktop entry düzeltmeleri (icon ve exec yolları)
  sed -i "s|Exec=.*|Exec=/usr/bin/anizium-desktop|g" "${pkgdir}/usr/share/applications/anizium-desktop.desktop"
  sed -i "s|Icon=.*|Icon=anizium-desktop|g" "${pkgdir}/usr/share/applications/anizium-desktop.desktop"
}
