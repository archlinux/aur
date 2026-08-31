# Maintainer: T4toh <https://github.com/T4toh>
pkgname=twriter-bin
_pkgname=tWriter
pkgver=0.8.2
pkgrel=1
pkgdesc="Editor de novelas en ES/EN con conversor RAE de diálogos, gramática vía LanguageTool, export EPUB"
arch=('x86_64')
url="https://github.com/T4toh/tWriter"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'librsvg'
    'libayatana-appindicator'
)
optdepends=(
    'pandoc: importar archivos .docx/.odt'
    'docker: correr LanguageTool local'
)
provides=('twriter')
conflicts=('twriter')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::https://github.com/T4toh/tWriter/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('0cf9d992a824dae56bfdfcf1758f67742ab0f874a247460a955caaaf78b5c71f')

package() {
    cd "${srcdir}"
    bsdtar -xf "${pkgname}-${pkgver}.deb"
    bsdtar -xf data.tar.* -C "${pkgdir}"
    # .deb instala a /usr/, queda como está

    # Ícono en Wayland (KWin / super+alt+tab): KWin matchea el .desktop por
    # filename == app_id y es case-sensitive. webkit2gtk-4.1 es GTK3, que setea
    # el app_id Wayland desde g_get_prgname() = nombre del binario = "twriter"
    # (minúscula). El bundler de Tauri nombra el archivo según productName →
    # "tWriter.desktop" (mayúscula) y el match primario falla → ícono default.
    # Renombrar a minúscula. Name=tWriter (display) e Icon=twriter quedan igual.
    local _apps="${pkgdir}/usr/share/applications"
    if [ -f "${_apps}/tWriter.desktop" ]; then
        mv "${_apps}/tWriter.desktop" "${_apps}/twriter.desktop"
    fi
}
