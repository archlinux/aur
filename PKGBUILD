# Maintainer: niyanhhhhh <2093615664@qq.com>

pkgname=cajviewer-bin
pkgver=1.0.3.0
pkgrel=1
pkgdesc="Document Viewer for CAJ, KDH, NH, TEB and PDF format"
arch=("x86_64")
url="http://cajviewer.cnki.net"
license=(custom)
depends=('avahi'
         'shared-mime-info'
         'libcups'
         'libgcrypt'
         'gmp'
         'gnutls'
         'krb5'
         'libidn11'
         'xz'
         'libpng12'
         'qt5-base'
         'qt5-declarative'
         'qt5-virtualkeyboard'
         'libselinux'
         'systemd-libs'
         'libtasn1'
         'libx11'
         'libxau'
         'libxcb'
         'libxdmcp'
         'libxkbcommon'
         'libxrender')
provides=('cajviewer')
conflicts=('cajviewer' 'cajviewer-appimage' 'cajviewer-app-image')
install=${pkgname}.install
source=("https://download.cnki.net/net.cnki.cajviewer_${pkgver}_amd64.deb")
sha256sums=('7f23605532a6e0efbe48eb98c05a76e1f768f871a5af34b7d1fe9e6b2ad7aa5b')

package() {
    cd ${srcdir}
    tar -xJf data.tar.xz
    cd ${srcdir}/opt/apps/net.cnki.cajviewer/files

    install -d ${pkgdir}/opt/${pkgname}/lib/
    mv lib/libdouble-conversion.so* ${pkgdir}/opt/${pkgname}/lib/
    mv lib/libffi.so* ${pkgdir}/opt/${pkgname}/lib/
    mv lib/libhogweed.so* ${pkgdir}/opt/${pkgname}/lib/
    mv lib/libnettle.so* ${pkgdir}/opt/${pkgname}/lib/
    mv lib/libpcre.so* ${pkgdir}/opt/${pkgname}/lib/
    mv lib/libreaderex_x64.so* ${pkgdir}/opt/${pkgname}/lib/

    mv bin ${pkgdir}/opt/${pkgname}/bin/
    mv {plugins,translations} ${pkgdir}/opt/${pkgname}/

    sed -i "2c export LD_LIBRARY_PATH=/usr/local/lib:/opt/${pkgname}/lib:\$LD_LIBRARY_PATH" ${pkgdir}/opt/${pkgname}/bin/start.sh
    sed -i "4c\ \t/opt/${pkgname}/bin/cajviewer" ${pkgdir}/opt/${pkgname}/bin/start.sh
    sed -i "6c\ \t/opt/${pkgname}/bin/cajviewer \"\$1\"" ${pkgdir}/opt/${pkgname}/bin/start.sh

    install -d ${pkgdir}/usr/bin/
    ln -s /opt/${pkgname}/bin/start.sh ${pkgdir}/usr/bin/cajviewer

    install -d ${pkgdir}/usr/share/mime/packages/
    mv share/{applications,icons} ${pkgdir}/usr/share/
    install -Dm644 cnki-caj.xml ${pkgdir}/usr/share/mime/packages/cnki-caj.xml
}
