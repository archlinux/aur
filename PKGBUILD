# Maintainer: Erdener Karacan <erdener.karacan@gmail.com>
# Önceki Maintainer: Mete ÇİFTÇİ <e.meteciftci@gmail.com>

pkgname=arksigner-pub
pkgver=2.3.17.2
pkgrel=1
pkgdesc="ArkSigner e-Imza ve AKİS Akıllı Kart Uygulaması"
arch=('x86_64')
url="https://www.arksigner.com"
license=('custom')

depends=('pcsclite' 'ccid' 'nss')
install="arksigner-pub.install"

source=("https://downloadark.com/arksigner-pub-${pkgver}-portable.deb"
        "arksigner.service")
sha256sums=('SKIP'
            'SKIP')

package() {
    msg2 "DEB paketi açılıyor..."
    cd "${srcdir}"
    ar x "arksigner-pub-${pkgver}-portable.deb"
    tar -xf data.tar.* -C "${pkgdir}"

    # Çakışan /lib dizinini sil (filesystem paketiyle çakışıyor)
    # Debian'ın init.d servisi yerine kendi arksigner.service'imizi kullanacağız
    rm -rf "${pkgdir}/lib"

    # 1. macOS çöplerini temizle
    find "${pkgdir}" -name ".DS_Store" -type f -delete

    # 2. Uygulamayı /opt altına taşı
    install -d "${pkgdir}/opt"
    mv "${pkgdir}/usr/bin/arksigner" "${pkgdir}/opt/arksigner"

    # 3. Boş kalan usr/bin dizinini temizle
    rm -rf "${pkgdir}/usr/bin"

    # 4. Bundled kütüphanelere DOKUNMA!
    msg2 "Bundled kütüphaneler korunuyor..."

    # 5. OpenSSL 1.1 symlink'leri
    msg2 "OpenSSL 1.1 symlink'leri oluşturuluyor..."
    cd "${pkgdir}/opt/arksigner/libs"
    ln -sf libcrypto.so.1.1 libcrypto.so
    ln -sf libssl.so.1.1    libssl.so

    # 6. Wrapper betik
    install -d "${pkgdir}/usr/bin"

    cat > "${pkgdir}/usr/bin/arksigner-service" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/opt/arksigner/libs:/usr/local/lib64:${LD_LIBRARY_PATH}"
export LD_PRELOAD="/opt/arksigner/libs/libssl.so.1.1:/opt/arksigner/libs/libcrypto.so.1.1"
cd /opt/arksigner
exec /opt/arksigner/arksigner-service "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/arksigner-service"

    # 7. Systemd servisi
    install -Dm644 "${srcdir}/arksigner.service" \
        "${pkgdir}/usr/lib/systemd/system/arksigner.service"

    # 8. İzinleri düzelt
    chmod -R u=rwX,go=rX "${pkgdir}"
    chmod +x "${pkgdir}/opt/arksigner/arksigner-service"
}
