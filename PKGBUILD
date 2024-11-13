# Maintainer: Ash <xash at riseup d0t net>
# Contributor: bemxio <bemxiov at protonmail dot com>
# Contributor: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: James Groom <OSSYoshiRulz at gmail dot com>

pkgname="bizhawk-preview-latest-bin"
_pkgname="bizhawk"
pkgdesc="A multi-platform emulator with full re-recording support and Lua scripting (Nightly build)"
pkgver=2.9.1
pkgrel=1
arch=(x86_64)
url="https://tasvideos.org/BizHawk"
license=("LicenseRef-BizHawk" "MIT")
depends=(glibc mono openal "lua>=5.4" lsb-release)
makedepends=(gendesk icoutils)
provides=(bizhawk)

source=(
    "https://nightly.link/TASEmulators/BizHawk/workflows/ci/master/BizHawk-dev-linux.zip"
    "https://raw.githubusercontent.com/TASEmulators/BizHawk/master/LICENSE"
)
md5sums=("SKIP" "2d15d8df1b4ec039a8fac3202a418a3c")

prepare() {
    # Extract the icon out of the executable if it exists
    wrestool -x -R -n 6 "EmuHawk.exe" -o logo.png

    # Generate a .desktop file
    gendesk -f -n \
        --pkgname BizHawk \
        --pkgdesc "${pkgdesc}" \
        --exec bizhawk \
        --icon bizhawk \
        --categories "Game;Emulator"
}

package() {
    # Copy all files to the package directory under /opt/bizhawk
    find . -type d -exec install -Dm775 -ggames -d "${pkgdir}/opt/bizhawk/{}" \;
    find . -type f \
        -regextype egrep -not -regex "./(EmuHawkMono.sh|BizHawk.desktop|logo.png|LICENSE)" \
        -exec install -Dm664 -ggames "{}" "${pkgdir}/opt/bizhawk/{}" \;

    install -Dm774 -ggames EmuHawkMono.sh "${pkgdir}/opt/bizhawk/EmuHawkMono.sh"

    # Copy the icon and the .desktop file
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/bizhawk.png"
    install -Dm644 BizHawk.desktop "${pkgdir}/usr/share/applications/bizhawk.desktop"

    # Create a symlink to the executable
    mkdir -p "${pkgdir}/usr/bin" && ln -s /opt/bizhawk/EmuHawkMono.sh "${pkgdir}/usr/bin/bizhawk"

    # Copy the license file
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
