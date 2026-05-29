# Maintainer: Ondrej Polak <ondrej.polak@cloudylake.io>
pkgname=nook-beta-bin
pkgver=0.1.23
pkgrel=1
pkgdesc="Nook beta desktop app"
arch=('x86_64')
url="https://nook.cloudylake.io"
license=('proprietary')
depends=('alsa-lib' 'gtk3' 'libayatana-appindicator' 'libxss' 'libxtst' 'nss')
optdepends=('libpulse: PulseAudio audio support')
provides=('nook')
conflicts=('nook' 'nook-bin')
source=("nook-${pkgver}-${pkgrel}.deb::https://nook.cloudylake.io/download/nook-0.1.23-linux.deb")
sha256sums=("91bac005aedb534344d442a767763a92d10a2449c5770824029a872ba44d0b26")

package() {
    bsdtar -xf "nook-${pkgver}-${pkgrel}.deb" -C "${srcdir}"

    local data_archive
    data_archive="$(find "${srcdir}" -maxdepth 1 -type f -name 'data.tar*' | head -n 1)"
    if [ -z "${data_archive}" ]; then
        echo "Unable to find data archive in extracted .deb" >&2
        return 1
    fi

    bsdtar -xf "${data_archive}" -C "${pkgdir}"

    # Normalize desktop filename for AUR consumers.
    if [ -f "${pkgdir}/usr/share/applications/Nook.desktop" ]; then
        mv "${pkgdir}/usr/share/applications/Nook.desktop" "${pkgdir}/usr/share/applications/nook.desktop"
    fi
}

options=(!strip)
