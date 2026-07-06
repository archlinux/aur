# Maintainer: Panda <satodu@github.com>
pkgname=bamboo-end-store-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Modern community store for EndeavourOS and Arch Linux built with NativePHP"
arch=('x86_64')
url="https://github.com/satodu/bamboo-end-store"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
provides=('bamboo-end-store')
conflicts=('bamboo-end-store')
options=('!strip')

source=(
    "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Bamboo-End-Store-${pkgver}.AppImage"
    "bamboo-end-store.desktop"
    "icon.png"
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    # 1. Torna o AppImage executável para extração
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    
    # 2. Extrai o conteúdo (cria a pasta squashfs-root)
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # 1. Cria a pasta em /opt e copia os arquivos extraídos
    install -d "${pkgdir}/opt/${pkgname}"
    cp -rp "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"

    # 2. Corrige permissões (essencial para que o usuário consiga ler recursos e bibliotecas)
    chmod -R u+rwX,go+rX "${pkgdir}/opt/${pkgname}"

    # 3. Corrige o bug no AppRun que quebra o APPDIR quando argumentos são passados
    sed -i 's/! -e "$path\/$1"/! -e "$path\/AppRun"/' "${pkgdir}/opt/${pkgname}/AppRun"

    # 4. Cria o link simbólico para o executável no /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/bamboo-end-store"

    # 5. Menu Desktop
    install -Dm644 "${srcdir}/bamboo-end-store.desktop" "${pkgdir}/usr/share/applications/bamboo-end-store.desktop"

    # 6. Ícone oficial do sistema
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bamboo-end-store.png"
}
