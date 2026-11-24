# Maintainer: colegeming <collegeming@outlook.com>

pkgname=kimi-code-desktop-bin
pkgver=1.4.3
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
source_x86_64=("KimiCode-${pkgver}-linux-amd64.deb::https://code.kimi.com/kimi-code/desktop/binaries/1.4.3/KimiCode-1.4.3-linux-amd64.deb")
sha512sums_x86_64=('521b50fcd589f41a3820d3c11fc63d26a01c2f6388ff15235bfcd09cea1f91d4652bb1891083cd5300cf8217231715a5056191ab0e1ec84aa6a30c42a52fe3e4')
# Keep makepkg from unpacking the .deb itself (bsdtar would scatter its ar
# members across $srcdir); package() unpacks data.tar deliberately.
noextract=("KimiCode-${pkgver}-linux-amd64.deb")

source_aarch64=("kimi-code-desktop-bin-${pkgver}-1-aarch64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/kimi-code-desktop-bin-1.4.3-1-aarch64.pkg.tar.zst")
sha256sums_aarch64=('946bdec8c4b64a39ea3c7f81da632aacc0079a25e55249cae1433abbea751c2e')

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
