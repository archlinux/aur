# Maintainer: ewgsta <ewgsta@proton.me>
pkgname=animely
pkgver=2.0.0
pkgrel=1
pkgdesc="Terminal üzerinden anime izleme ve indirme CLI aracı"
arch=('any')
url="https://github.com/ewgsta/animely"
license=('custom:CC-BY-NC-ND-4.0')
depends=('nodejs>=18' 'npm')
optdepends=(
    'mpv: video oynatıcı (önerilen, kaldığı yerden devam desteği)'
    'vlc: alternatif video oynatıcı'
    'aria2: hızlı indirme için'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ewgsta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Node modüllerini kur
    npm install --production --ignore-scripts
    
    # Uygulama dizini oluştur
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    
    # Dosyaları kopyala
    cp -r src package.json node_modules "${pkgdir}/usr/lib/${pkgname}/"
    
    # Çalıştırılabilir script oluştur
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
exec node /usr/lib/animely/src/index.js "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # Lisans dosyası
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
