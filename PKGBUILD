# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=upstream-bin
pkgver=0.1.4
pkgrel=2
pkgdesc='Desktop client for radicle (binary version)'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=('upstream')
conflicts=('radicle' 'upstream')
_package="radicle-upstream-${pkgver}.AppImage"
source=(
    "https://releases.radicle.xyz/${_package}"
    "https://raw.githubusercontent.com/radicle-dev/radicle-upstream/v${pkgver}/LICENSE"
)
sha256sums=('267a567b851c9ec301b0cad517eb1a1fdaf3ed46bf85a85000285b066185c5c6'
            'c82ef66185dd06e8e09cdef263ba06c6140fa78022e3322db193376c98e75a62')

package() {
    chmod +x "${srcdir}/${_package}"
    `${srcdir}/${_package} --appimage-extract &>/dev/null`
    rm -rf "${srcdir}/upstream"
    mv "${srcdir}/squashfs-root" "${srcdir}/upstream"
  
    install -d -m755 "${pkgdir}/opt/"
    cp -a "${srcdir}/upstream/." "${pkgdir}/opt/upstream/"
    find "${pkgdir}/opt/upstream/" -type d -exec chmod 755 {} +
    chmod +rx "${pkgdir}/opt/upstream/radicle-upstream"
  
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/upstream/radicle-upstream" "${pkgdir}/usr/bin/upstream"
  
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  
    install -Dm644 "${srcdir}/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radicle-upstream.png"
    install -Dm644 "${srcdir}/upstream/radicle-upstream.desktop" "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
    sed -e "s/AppRun/upstream/g" -i "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
}
