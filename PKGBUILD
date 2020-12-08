# Maintainer: Jan-Henrik Bruhn <aur@jhbruhn.de> 
pkgname=upstream-electron-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Desktop client for radicle (binary version, system electron)'
arch=('x86_64')
url='https://github.com/radicle-dev/radicle-upstream'
license=('GPL' 'custom')
provides=('upstream')
conflicts=('radicle' 'upstream')
depends=('electron')
_package="radicle-upstream-${pkgver}.AppImage"
source=(
    "https://releases.radicle.xyz/${_package}"
    "https://raw.githubusercontent.com/radicle-dev/radicle-upstream/v${pkgver}/LICENSE"
    "radicle-launcher.sh"
)
sha256sums=('267a567b851c9ec301b0cad517eb1a1fdaf3ed46bf85a85000285b066185c5c6'
            'd1bb5e1a4cd3774790ae7024904d572c27267857ed004a062416d520bf4230ad'
            'ca84ffe5cda88ad75fa3aa95c9f100768eff2ea91b977235418ef74ec1f37ac4')

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
    install -Dm755 "${srcdir}/radicle-launcher.sh" "${pkgdir}/usr/bin/upstream"
  
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  
    install -Dm644 "${srcdir}/upstream/usr/share/icons/hicolor/0x0/apps/radicle-upstream.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/radicle-upstream.png"
    install -Dm644 "${srcdir}/upstream/radicle-upstream.desktop" "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
    sed -e "s/AppRun/upstream/g" -i "${pkgdir}/usr/share/applications/radicle-upstream.desktop"
}

