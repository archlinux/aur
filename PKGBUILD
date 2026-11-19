# Maintainer: colegeming <collegeming@outlook.com>

pkgname=kimi-code-desktop-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Kimi Code Desktop - GUI client for the Kimi Code agent (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://kimi.com/code'
license=('LicenseRef-proprietary')
# The vendor's Debian Depends/Recommends, translated to Arch names. libuuid1
# maps to util-linux, which is in base, so it is left out.
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'libsecret'
         'at-spi2-core' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon')
options=('!strip')

# x86_64 forwards the vendor's own .deb straight from its update feed. aarch64
# is built by this repository (see [build] in metadata.toml): the same app
# payload with the official Electron arm64 runtime and a rebuilt node-pty.
source_x86_64=("KimiCode-${pkgver}-linux-amd64.deb::https://code.kimi.com/kimi-code/desktop/binaries/1.4.0/KimiCode-1.4.0-linux-amd64.deb")
sha512sums_x86_64=('85aaa38bc21435b772c7c2a705e66ffc743a14730904a86b60c1822e8f4444448d074b41dac0feeb666de3abdc65c97c55be29a29914cd9f824d18458c49ece2')
# Keep makepkg from unpacking the .deb itself (bsdtar would scatter its ar
# members across $srcdir); package() unpacks data.tar deliberately.
noextract=("KimiCode-${pkgver}-linux-amd64.deb")

source_aarch64=("kimi-code-desktop-bin-${pkgver}-1-aarch64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/kimi-code-desktop-bin-1.4.0-1-aarch64.pkg.tar.zst")
sha256sums_aarch64=('206d13abcf8d4bd275f85d6b6fbab256418c6e96b4d506abd58a8f5274f413d5')

package() {
    if [ "${CARCH}" = "x86_64" ]; then
        install -d "${srcdir}/deb"
        bsdtar -xf "${srcdir}/KimiCode-${pkgver}-linux-amd64.deb" -C "${srcdir}/deb"
        bsdtar -xf "${srcdir}/deb/"data.tar.* -C "${pkgdir}"

        # `/opt/Kimi Code` (space included) is where the bundled Electron looks
        # for its resources. Electron refuses to start unless the sandbox helper
        # is root-owned setuid when user namespaces are unavailable -- the
        # vendor's postinst sets 4755 for exactly that case, and the bit is
        # simply unused where namespaces do work.
        install -d "${pkgdir}/usr/bin"
        ln -s "/opt/Kimi Code/kimi-code" "${pkgdir}/usr/bin/kimi-code"
        chmod 4755 "${pkgdir}/opt/Kimi Code/chrome-sandbox"

        # The Electron/Chromium notices ship inside the app directory; link them
        # rather than duplicating 20 MB under /usr/share/licenses.
        install -d "${pkgdir}/usr/share/licenses/${pkgname}"
        ln -s "/opt/Kimi Code/LICENSE.electron.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
        ln -s "/opt/Kimi Code/LICENSES.chromium.html" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    else
        # Our aarch64 artifact is already a pacman package with the launcher,
        # license links and sandbox permissions in place.
        bsdtar -xf "${srcdir}/kimi-code-desktop-bin-${pkgver}-1-aarch64.pkg.tar.zst" \
            -C "${pkgdir}" \
            --exclude '.PKGINFO' --exclude '.BUILDINFO' --exclude '.MTREE'
        chmod 4755 "${pkgdir}/opt/Kimi Code/chrome-sandbox"
    fi
}
