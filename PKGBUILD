# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=upstream
_pkgname=radicle-upstream
pkgver=0.1.6
pkgrel=1
pkgdesc='Desktop client for radicle'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=('upstream')
conflicts=('radicle' 'upstream-bin')
makedepends=('yarn' 'rustup')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/radicle-dev/radicle-upstream/archive/v${pkgver}.tar.gz")
sha256sums=('56ef61c6a1cb2fed31f30bdea830c5b311d0f80c307a6954588e474a600a1b44')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    HUSKY_SKIP_INSTALL=1 yarn install --ignore-optional
    yarn dist
}

package() {
    `${srcdir}/${_pkgname}-${pkgver}/dist/radicle-upstream-${pkgver}.AppImage --appimage-extract &>/dev/null`
    rm -rf "${srcdir}/upstream"
    mv "${srcdir}/squashfs-root" "${srcdir}/upstream"
  
    install -d -m755 "${pkgdir}/opt/"
    cp -a "${srcdir}/upstream/." "${pkgdir}/opt/upstream/"
    find "${pkgdir}/opt/upstream/" -type d -exec chmod 755 {} +
    chmod +rx "${pkgdir}/opt/upstream/radicle-upstream"
  
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/upstream/radicle-upstream" "${pkgdir}/usr/bin/upstream"
  
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  
    install -Dm644 "${srcdir}/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radicle-upstream.png"
    install -Dm644 "${srcdir}/upstream/radicle-upstream.desktop" "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
    sed -e "s/AppRun/upstream/g" -i "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
}

