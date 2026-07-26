# Maintainer: 9M2PJU <9M2PJU@users.noreply.github.com>
# Contributor: 9M2PJU <9M2PJU@users.noreply.github.com>
#
# Binary package: downloads the prebuilt .pkg.tar.zst from the upstream
# GitHub release so users do not have to compile from source.
#
# The binary is built natively inside an archlinux:latest container in CI,
# so it links against Arch's system Qt6 (not Ubuntu's), avoiding the
# protected-symbol ABI crash (GNU_PROPERTY_1_NEEDED_INDIRECT_EXTERN_ACCESS).
#
# All credit for the original DroidStar software goes to Doug McLain AD8DP.
# Original project: https://github.com/nostar/DroidStar

pkgname=droidstar-9m2pju-bin
pkgver=1.0.79a957f
pkgrel=1
pkgdesc="DroidStar-9M2PJU - amateur radio digital modes client (binary release, Arch-native)"
arch=('x86_64')
url="https://github.com/9M2PJU/DroidStar-Linux"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-declarative' 'qt6-multimedia' 'qt6-serialport'
         'qt6-shadertools' 'hicolor-icon-theme')
provides=('droidstar-9m2pju')
conflicts=('droidstar-9m2pju' 'droidstar' 'droidstar-git' 'droidstar-9m2pju-git')
options=('!strip' '!debug')

_release_tag="DroidStar-9M2PJU-79a957f"
_pkgbase="DroidStar-9M2PJU-1.0.79a957f"

source_x86_64=("${_pkgbase}-x86_64.pkg.tar.zst::${url}/releases/download/${_release_tag}/${_pkgbase}-x86_64.pkg.tar.zst")
sha256sums_x86_64=('468b30be5999d8572993446abd05d418e486436425e219e9601dde863f863ab2')

# The downloaded artifact is itself an Arch package archive. We unpack it
# and re-stage the payload into $pkgdir, preserving the desktop entry, icon
# and binary layout produced by the upstream CI.
package() {
    cd "${srcdir}"

    # Locate the downloaded package archive (the only source file). makepkg
    # stores it under the renamed source name as a symlink to the real file,
    # so resolve it with readlink -f before piping to tar.
    local archive
    archive="$(find . -maxdepth 1 -type l -name "*.pkg.tar.zst" -printf '%f\n' | head -n1)"
    if [ -z "${archive}" ]; then
        archive="$(find . -maxdepth 1 -type f -name "*.pkg.tar.zst" -printf '%f\n' | head -n1)"
    fi
    if [ -z "${archive}" ]; then
        error "Could not find downloaded .pkg.tar.zst in ${srcdir}"
        return 1
    fi
    archive="$(readlink -f "${archive}")"

    # Decompress and extract the upstream package payload into $pkgdir.
    # We skip the .PKGINFO / .INSTALL control files from the upstream pkg
    # because makepkg generates its own from this PKGBUILD.
    msg2 "Extracting $(basename "${archive}") into pkgdir"
    bsdtar -xf "${archive}" -C "${pkgdir}" \
        --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.MTREE' --exclude='.BUILDINFO'
}
