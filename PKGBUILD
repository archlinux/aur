# Maintainer: Dein Name <deine@email.com>
pkgname=judoshiai
pkgver=4.4
pkgrel=1
pkgdesc="A set of programs to help organize a judo tournament"
arch=('x86_64')
url="https://www.judoshiai.org"
license=('custom')
depends=('libao' 'cairo' 'curl' 'gdk-pixbuf2' 'gtk3' 'pango' 'librsvg' 'libssh2' 'libuv' 'gnutls' 'mpg123' 'libxml2-legacy')
makedepends=('binutils')
source=("judoshiai-${pkgver}.deb::https://sourceforge.net/projects/judoshiai/files/Linux-x86_64/judoshiai_${pkgver}-1_amd64.deb/download")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"
    ar x "judoshiai-${pkgver}.deb"
    data_archive=$(ls data.tar.* 2>/dev/null | head -n1)
    tar -xf "${data_archive}"
}

package() {
    # Binärdateien installieren
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/usr/bin/"

    # Bibliotheken und Ressourcen installieren
    install -dm755 "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/lib/judoshiai" "${pkgdir}/usr/lib/"

    # Symlinks für Debian-benannte Bibliotheken
    ln -sf /usr/lib/liblua5.4.so "${pkgdir}/usr/lib/liblua5.4.so.0"

    # Desktop-Einträge installieren
    if [ -d "${srcdir}/usr/share/applications" ]; then
        install -dm755 "${pkgdir}/usr/share/applications"
        cp "${srcdir}/usr/share/applications/"* "${pkgdir}/usr/share/applications/" 2>/dev/null || true
    fi

    # Icons installieren
    if [ -d "${srcdir}/usr/share/icons" ]; then
        install -dm755 "${pkgdir}/usr/share/icons"
        cp -r "${srcdir}/usr/share/icons/"* "${pkgdir}/usr/share/icons/" 2>/dev/null || true
    fi

    # Mime-Typen installieren
    if [ -d "${srcdir}/usr/share/mime" ]; then
        install -dm755 "${pkgdir}/usr/share/mime/packages"
        cp "${srcdir}/usr/share/mime/packages/"* "${pkgdir}/usr/share/mime/packages/" 2>/dev/null || true
    fi

    # Lizenz installieren
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${srcdir}/usr/lib/judoshiai/licenses/judoshiai-license.txt" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
