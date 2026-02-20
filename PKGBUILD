# Maintainer: Heleno Salgado <heleno@irse.com.br>

pkgname=bereiaverse-bin
_pkgname=bereiaverse
pkgver=1.2.0
pkgrel=1
pkgdesc="Leitor bíblico automático com anotações (ACF)"
arch=('x86_64')
url="https://github.com/Instituto-Reformado-Santo-Evangelho/bereia-verse"
license=('custom:CC-BY-NC-ND-4.0')
depends=('java-runtime-openjdk>=21')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-linux-v${pkgver}.tar.gz::https://github.com/Instituto-Reformado-Santo-Evangelho/bereia-verse/releases/download/master/bereiaverse-linux-${pkgver}.tar.gz"
        "br.com.irse.verse.desktop"
        "br.com.irse.verse.appdata.xml")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    # Cria os diretórios de destino
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/metainfo"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    # Copia os arquivos da aplicação (Eles estão dentro da pasta bereiaverse no srcdir)
    cp -r "${srcdir}/bereiaverse/bin" "${pkgdir}/opt/${_pkgname}/"
    cp -r "${srcdir}/bereiaverse/lib" "${pkgdir}/opt/${_pkgname}/"

    # Garante permissão de execução no binário
    chmod +x "${pkgdir}/opt/${_pkgname}/bin/${_pkgname}"

    # Cria o link simbólico para o executável no sistema
    ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Instala o ícone (Está dentro de lib/ na estrutura do Compose)
    install -Dm644 "${srcdir}/bereiaverse/lib/bereiaverse.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/br.com.irse.verse.png"
    
    # Instala o atalho do menu e metadados (Agora eles são baixados como fonte pelo makepkg)
    install -Dm644 "${srcdir}/br.com.irse.verse.desktop" "${pkgdir}/usr/share/applications/br.com.irse.verse.desktop"
    install -Dm644 "${srcdir}/br.com.irse.verse.appdata.xml" "${pkgdir}/usr/share/metainfo/br.com.irse.verse.appdata.xml"
}
