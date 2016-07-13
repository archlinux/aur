# Maintainer: Ilya Kovalenko <agentsib@gmail.com>

pkgname=joxi
pkgver=3.0.9
pkgrel=1
pkgdesc="Easy to use screenshot sharing application (Russian)"
arch=('i686' 'x86_64')
url="http://joxi.net"
license=('unknown')
options=('emptydirs')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base' 'qt5-script' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-quick1' 'libgl' 'libx11' 'libstdc++5' 'libxdamage' 'glib2' 'gtk2' 'libmcrypt' 'libcurl-compat' 'libappindicator-gtk2')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=("5f486dc525c3031a46416194cb1845be" "fa1d9cf5344c0e586d1cf0784713195b" "35fc3adf057a6c83ab216fe76dbe5b9a")
elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
    md5sums=("48327f33e6b055c26d25ba40717e291b" "fa1d9cf5344c0e586d1cf0784713195b" "35fc3adf057a6c83ab216fe76dbe5b9a")
fi

source=(
    "http://dl.joxi.ru/linux/${pkgname}-${pkgver}_${ARCH}.deb"
    "joxi.ld_preload.wrapper"
    "joxi.desktop"
)

package() {
    ar -x "${srcdir}/${pkgname}-${pkgver}_${ARCH}.deb"
    tar -Jxf "${srcdir}/data.tar.xz"
    sed -i -e 's# /opt/joxi/icon_64.png#/usr/share/icons/hicolor/icon_64.png#' "${srcdir}/usr/share/applications/Joxi.desktop"

    # there is no /usr/lib/joxi dir, so this config is pointless
    # install -D -m755 "${srcdir}/etc/ld.so.conf.d/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    install -D -m644 "${srcdir}/opt/${pkgname}/icon_64.png" "${pkgdir}/usr/share/icons/hicolor/icon_64.png"
    install -D -m644 "${srcdir}/opt/${pkgname}/icon_light.png" "${pkgdir}/usr/share/icons/hicolor/icon_light.png"

    install -D -m755 "${srcdir}/usr/bin/joxi" "${pkgdir}/opt/joxi/joxi"

    install -D -m755 "${srcdir}/joxi.ld_preload.wrapper" "${pkgdir}/usr/bin/joxi"

    install -D -m755 "${srcdir}/joxi.desktop" "${pkgdir}/usr/share/applications/Joxi.desktop"
}
