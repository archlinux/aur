# Maintainer: Dein Name <deine@email.com>
pkgname=judoshiai
pkgver=4.4
pkgrel=1
pkgdesc="A set of programs to help organize a judo tournament"
arch=('x86_64')
url="https://www.judoshiai.org"
license=('custom')
depends=('gtk3' 'sqlite' 'glib2' 'libpng' 'libjpeg' 'libxml2' 'lua54')
makedepends=('binutils')
source=("judoshiai-latest.deb::https://sourceforge.net/projects/judoshiai/files/latest/download")
sha256sums=('SKIP')

pkgver() {
    ar p "${srcdir}/judoshiai-latest.deb" control.tar.* 2>/dev/null | \
        tar -xO ./control 2>/dev/null | \
        grep '^Version:' | \
        sed 's/Version: //;s/-[0-9]*$//'
}

prepare() {
    cd "${srcdir}"
    ar x "judoshiai-latest.deb"
    data_archive=$(ls data.tar.* 2>/dev/null | head -n1)
    tar -xf "${data_archive}"
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/usr/bin/"

    install -dm755 "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/lib/judoshiai" "${pkgdir}/usr/lib/"

    # Symlinks für Debian-benannte Bibliotheken
    ln -sf /usr/lib/libxml2.so.16 "${pkgdir}/usr/lib/libxml2.so.2"
    ln -sf /usr/lib/liblua5.4.so "${pkgdir}/usr/lib/liblua5.4.so.0"

    if [ -d "${srcdir}/usr/share/applications" ]; then
        install -dm755 "${pkgdir}/usr/share/applications"
        cp "${srcdir}/usr/share/applications/"* "${pkgdir}/usr/share/applications/" 2>/dev/null || true
    fi

    if [ -d "${srcdir}/usr/share/icons" ]; then
        install -dm755 "${pkgdir}/usr/share/icons"
        cp -r "${srcdir}/usr/share/icons/"* "${pkgdir}/usr/share/icons/" 2>/dev/null || true
    fi

    if [ -d "${srcdir}/usr/share/mime" ]; then
        install -dm755 "${pkgdir}/usr/share/mime/packages"
        cp "${srcdir}/usr/share/mime/packages/"* "${pkgdir}/usr/share/mime/packages/" 2>/dev/null || true
    fi

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${srcdir}/usr/lib/judoshiai/licenses/judoshiai-license.txt" \
       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
