# Maintainer: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: picard <picard at fr32k dot de>

pkgname=twonky
pkgver=8.3.0
_pkgver=8.3
pkgrel=1
pkgdesc="A DLNA-compliant UPnP AV server software from PacketVideo."
arch=('i686' 'x86_64')
url="http://twonky.com/"
license=('custom')
depends=('imagemagick')
optdepends=('ffmpeg: video transcoding'
            'mencoder: video transcoding')
backup=('etc/twonky.ini')
install="${pkgname}.install"
noextract=("twonky-${CARCH}-${pkgver}.zip")
options=('!strip')
source=("twonky.service"
        "twonky.ini")
source_i686=("twonky-i686-${_pkgver}.zip::http://www.twonkyforum.com/downloads/${_pkgver}/twonky-i686-glibc-2.9-${_pkgver}.zip")
source_x86_64=("twonky-x86_64-${_pkgver}.zip::http://www.twonkyforum.com/downloads/${_pkgver}/twonky-x86-64-glibc-2.9-${_pkgver}.zip")
md5sums=('4c89bcaef67cc11f02dca29aea10de1e'
         '0c06f9de4f2510186dc50e548bb1e760')
md5sums_i686=('dc7a3670ed5410266b8b7db7884d5b90')
md5sums_x86_64=('8b44636a71dd8b923e5e05d1c245663f')

package() {
    # twonky base install
    msg2 "Extracting twonky-${CARCH}-${_pkgver}.zip..."
    install -d "${pkgdir}/usr/lib/twonky"
    unzip -q -d "${pkgdir}/usr/lib/twonky" "${srcdir}/twonky-${CARCH}-${_pkgver}.zip"

    msg2 "Moving parts in place..."

    # twonky config file (including defaults for appdata dir)
    install -Dm644 "${srcdir}/twonky.ini" "${pkgdir}/etc/twonky.ini"

    # twonky appdata dir (as defined in twonky.ini)
    install -d "${pkgdir}/var/twonky/share/"{music,pictures,videos}

    # systemd unit file
    install -Dm644 "${srcdir}/twonky.service" "${pkgdir}/usr/lib/systemd/system/twonky.service"

    # license files
    cd "${pkgdir}/usr/lib/twonky"
    for _lic in NOTICES*.txt Terms*; do
        install -Dm644 "${_lic}" "${pkgdir}/usr/share/licenses/twonky/${_lic}"
    done
}

# vim:set ts=4 sw=4 et:
