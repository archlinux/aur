# Maintainer: Seu Nome <seuemail@exemplo.com>
# Contributor: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Elizeu Oliveira

pkgname=freedownloadmanager-bin
pkgver=6.31.0.6549
pkgrel=1
pkgdesc="Free Download Manager (FDM) - powerful modern download accelerator and organizer (binary release)."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('custom')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent' 'gst-plugins-base')
makedepends=('desktop-file-utils' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}-amd64.deb::https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=('SKIP')

prepare() {
    mkdir -p "${srcdir}/${pkgname}-${pkgver}"
    # Extrai o .deb baixado
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}-amd64.deb" -C "${srcdir}/${pkgname}-${pkgver}"
    # Extrai o conteúdo principal
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}/data.tar.xz" -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Corrige .desktop para apontar para /usr/bin/fdm
    sed -i 's|/opt/freedownloadmanager/fdm|/usr/bin/fdm|g' usr/share/applications/freedownloadmanager.desktop
    sed -i 's|/opt/freedownloadmanager/icon.png|freedownloadmanager|g' usr/share/applications/freedownloadmanager.desktop
    sed -i '/^Exec=/a StartupWMClass=fdm' usr/share/applications/freedownloadmanager.desktop

    # Instala ícone
    install -Dm644 opt/freedownloadmanager/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Copia arquivos principais
    cp -dpr --no-preserve=ownership opt usr "${pkgdir}"

    # Cria symlink para binário
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/freedownloadmanager/fdm" "${pkgdir}/usr/bin/fdm"
}
