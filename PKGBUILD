#  Maintainer: Skyler <sm+aur@skym.fi> 
pkgname=discrakt-bin
pkgver=3.4.4
pkgrel=1
pkgdesc="The Trakt/Plex Discord Rich Presence that you didn't know you needed"
arch=('x86_64' 'aarch64')
url="https://github.com/afonsojramos/discrakt"
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('discord: Required to display Rich Presence')
provides=('discrakt')
conflicts=('discrakt' 'discrakt-git')

source_x86_64=("${pkgname}-${pkgver}-amd64.deb::https://github.com/afonsojramos/discrakt/releases/download/v${pkgver}/discrakt_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-arm64.deb::https://github.com/afonsojramos/discrakt/releases/download/v${pkgver}/discrakt_${pkgver}_arm64.deb")

sha256sums_x86_64=('4a85e1e337edd494a70258e4e807ca4963eba03805d0b265425e0aa10c65834a')
sha256sums_aarch64=('1e5f8749fd5bc464be27439c9ec5fae258cf9f5479ba1f1bb6e5daac4bf633a1')

package() {
    cd "${srcdir}"

    # Determine which .deb was downloaded
    local debfile
    if [ "${CARCH}" = "x86_64" ]; then
        debfile="${pkgname}-${pkgver}-amd64.deb"
    else
        debfile="${pkgname}-${pkgver}-arm64.deb"
    fi

    # Extract the .deb archive
    ar x "${debfile}"

    # Extract the data tarball (may be .tar.xz, .tar.zst, or .tar.gz)
    if [ -f data.tar.xz ]; then
        tar xf data.tar.xz
    elif [ -f data.tar.zst ]; then
        tar xf data.tar.zst
    elif [ -f data.tar.gz ]; then
        tar xf data.tar.gz
    fi

    # Install binary
    install -Dm755 usr/bin/discrakt "${pkgdir}/usr/bin/discrakt"

    # Install desktop entry if present
    if [ -f usr/share/applications/discrakt.desktop ]; then
        install -Dm644 usr/share/applications/discrakt.desktop \
            "${pkgdir}/usr/share/applications/discrakt.desktop"
    fi

    # Install icons if present
    if [ -d usr/share/icons ]; then
        cp -r usr/share/icons "${pkgdir}/usr/share/"
    fi

    # Install license
    if [ -f usr/share/doc/discrakt/copyright ]; then
        install -Dm644 usr/share/doc/discrakt/copyright \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
