# Maintainer: Mete ÇİFTÇİ <e.meteciftci@gmail.com>
pkgname=arksigner-pub
pkgver=2.3.15
pkgrel=2
pkgdesc="ArkSigner e-Imza ve AKİS Akıllı Kart Uygulaması"
arch=('x86_64')
url="https://www.arksigner.com"
license=('custom')

depends=('pcsclite' 'ccid' 'openssl-1.0' 'qt5-base' 'qt5-websockets' 'nss')
install="arksigner-pub.install"

source=("https://downloadark.com/arksigner-pub-${pkgver}.deb"
        "arksigner.service")
sha256sums=('SKIP'
            'SKIP')

package() {
    msg2 "Ubuntu paketinin iç organları Arch'a aktarılıyor..."
    tar -xf data.tar.* -C "${pkgdir}"

    # 1. macOS çöplerini kökünden kazı
    msg2 "Gereksiz macOS artıkları temizleniyor..."
    find "${pkgdir}" -name ".DS_Store" -type f -delete

    # 2. Linux Dosya Sistemi Hiyerarşisi (FHS) Düzeltmesi (Her şeyi /opt içine taşı)
    msg2 "Klasör mimarisi Arch standartlarına (/opt dizinine) çekiliyor..."
    install -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/bin/arksigner" "${pkgdir}/opt/arksigner"

    # 3. Ubuntu'nun init çöpünü sil
    rm -rf "${pkgdir}/etc"

    # 4. Frankenstein kütüphaneleri çöpe at (Arch'ın kendi liblerini kullanması için)
    msg2 "Eski ve bozuk kütüphaneler imha ediliyor..."
    rm -f "${pkgdir}/opt/arksigner/libs"/libQt5*.so*
    rm -f "${pkgdir}/opt/arksigner/libs"/libssl.so*
    rm -f "${pkgdir}/opt/arksigner/libs"/libcrypto.so*

    # 5. Kalan yerel kütüphaneler için wrapper betikler oluştur
    msg2 "Sisteme entegre edici sarmalayıcı betikler yazılıyor..."

    # Servis Kısayolu (/usr/bin/arksigner-service)
    echo '#!/bin/bash' > "${pkgdir}/usr/bin/arksigner-service"
    echo 'export LD_LIBRARY_PATH="/opt/arksigner/libs:$LD_LIBRARY_PATH"' >> "${pkgdir}/usr/bin/arksigner-service"
    echo 'exec /opt/arksigner/arksigner-service "$@"' >> "${pkgdir}/usr/bin/arksigner-service"
    chmod +x "${pkgdir}/usr/bin/arksigner-service"

    # Arayüz Kısayolu (/usr/bin/arksigner)
    echo '#!/bin/bash' > "${pkgdir}/usr/bin/arksigner"
    echo 'export LD_LIBRARY_PATH="/opt/arksigner/libs:$LD_LIBRARY_PATH"' >> "${pkgdir}/usr/bin/arksigner"
    echo 'exec /opt/arksigner/arksigner-universal "$@"' >> "${pkgdir}/usr/bin/arksigner"
    chmod +x "${pkgdir}/usr/bin/arksigner"

    # 6. Systemd servisini pakete gömme
    msg2 "Arka plan servisi (Systemd) sisteme entegre ediliyor..."
    install -Dm644 "${srcdir}/arksigner.service" "${pkgdir}/usr/lib/systemd/system/arksigner.service"

    # 7. Klasör izinlerini düzelt
    chmod -R u=rwX,go=rX "${pkgdir}"
}
