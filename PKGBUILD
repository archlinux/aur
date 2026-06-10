# Maintainer: Panda <sato.du@gmail.com>
pkgname=cachyos-store-bin
pkgver=1.1.4
pkgrel=1
pkgdesc="Modern community store for CachyOS and Arch Linux built with NativePHP"
arch=('x86_64')
url="https://github.com/satodu/panda-cachy-store"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'gtk3' 'nss' 'libxcrypt-compat')
provides=('cachyos-store')
conflicts=('cachyos-store')
options=('!strip')

source=(
    "${pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/CachyOS.Store-${pkgver}.AppImage"
    "cachyos-store.desktop"
    "icon.png"
)

sha256sums=('1cd228c199fb554a988c98127c063220245ad21f96a67d640c3a839946446173'
            'a1931a972aef3224086634ab55c6d32fb78a4f6465ab04c6b3ac4d90f357181d'
            '4d815319531044f6a030c7b459e126693a9985f8742ae64011989bec8e551009')

prepare() {
    # 1. Torna o AppImage executável para extração
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    
    # 2. Extrai o conteúdo (cria a pasta squashfs-root)
    # Usamos --appimage-extract para que os arquivos fiquem acessíveis direto no disco
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
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/cachyos-store"

    # 3. Menu Desktop
    install -Dm644 "${srcdir}/cachyos-store.desktop" "${pkgdir}/usr/share/applications/cachyos-store.desktop"

    # 4. Ícone oficial do sistema
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cachyos-store.png"
}
