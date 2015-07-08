# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Ivan Petruk <localizator@ukr.net>

# Note: For this PKGBUILD, 'makepkg -s' will not build the package if jq is not
# installed on the system. Instead, 'makepkg -s; makepkg'.

_i686_code=XZFLUXZgiFvDjEWrjBd5A0yP6qRvhcw4kAk
_x86_64_code=XZ5LUXZnCaQsycCaLFoymzccM68XFRwXyNX
_api_url="https://api.pcloud.com/getpublinkdownload?code="
pkgname=pcloud
pkgver=3.1.1
pkgrel=1
pkgdesc='A QT-based pcloud sync client'
arch=('i686' 'x86_64')
url="https://www.pcloud.com"
license=('unknown')
makedepends=('jq')
depends=('qt4')
conflicts=('pcloud-git')
replaces=('pcloud-git')
source_i686=() # Placeholder
source_x86_64=() # Placeholder
sha256sums_i686=('3611ae16586358bfd5e7889fa5e5be815fa2a36dcb5e033febb9f4d7205d03b6')
sha256sums_x86_64=('634fcec47799c2c8fd9f7cdf68bd48b135102a81fed51df58161b9984faf75f6')

prepare() {
    cd "${srcdir}"
    bsdtar -xf data.tar.gz
}


package() {
    cd "${srcdir}"
    install -Dm755 usr/bin/psyncgui "${pkgdir}/usr/bin/psyncgui"
    install -Dm644 usr/share/doc/pclsync/copyright "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 usr/share/applications/pclsync.desktop "${pkgdir}/usr/share/applications/pclsync.desktop"
    install -Dm644 usr/share/menu/pclsync "${pkgdir}/usr/share/menu/pclsync"
    install -Dm644 usr/share/pixmaps/pcloud-icon.svg "${pkgdir}/usr/share/pixmaps/pcloud-icon.svg"
}


_get_source() {
    case ${CARCH} in
        i686)
            source_i686=("http://$(curl "${_api_url}${_i686_code}" 2> /dev/null | jq -r '.hosts[0] + .path')") ;;
        x86_64)
            source_x86_64=("http://$(curl "${_api_url}${_x86_64_code}" 2> /dev/null | jq -r '.hosts[0] + .path')") ;;
    esac
}

jq --version &>/dev/null && _get_source || true
