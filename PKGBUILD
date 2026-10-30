# Maintainer: colegeming <collegeming@outlook.com>

pkgname=kimi-code-desktop-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Kimi Code Desktop - GUI client for the Kimi Code agent (prebuilt binary)'
arch=('x86_64')
url='https://kimi.com/code'
license=('LicenseRef-proprietary')
# The vendor's Debian Depends/Recommends, translated to Arch names. libuuid1
# maps to util-linux, which is in base, so it is left out.
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'libsecret'
         'at-spi2-core' 'xdg-utils')
optdepends=('libappindicator-gtk3: tray icon')
options=('!strip')
# Repackaged, not rebuilt: packaging the app is the vendor's job, and it loads
# its bundled Electron runtime from this exact /opt path. The local filename is
# version-tagged so makepkg's SRCDEST cannot hand back the previous version's
# .deb under a version-independent vendor name.
source_x86_64=("KimiCode-${pkgver}-linux-amd64.deb::https://code.kimi.com/kimi-code/desktop/binaries/1.2.1/KimiCode-1.2.1-linux-amd64.deb")
sha512sums_x86_64=('218addcfc4064513c93ea29e3a1d10a549909971cd196539c94362881a35cefda60a598b9e8c04345e270b26ece7a56cb31a7389fca6441bff962e403d91298c')
# Keep makepkg from unpacking the .deb itself (bsdtar would scatter its ar
# members across $srcdir); package() unpacks data.tar deliberately.
noextract=("KimiCode-${pkgver}-linux-amd64.deb")
# The .deb also carries an AppArmor profile that exists to re-enable user
# namespaces under Ubuntu's restriction; Arch has no such restriction, so
# shipping it would only confuse apparmor_parser.

package() {
    install -d "${srcdir}/deb"
    bsdtar -xf "${srcdir}/KimiCode-${pkgver}-linux-amd64.deb" -C "${srcdir}/deb"
    bsdtar -xf "${srcdir}/deb/"data.tar.* -C "${pkgdir}"

    # `/opt/Kimi Code` (space included) is where the bundled Electron looks for
    # its resources. Electron refuses to start unless the sandbox helper is
    # root-owned setuid when user namespaces are unavailable -- the vendor's
    # postinst sets 4755 for exactly that case, and the bit is simply unused
    # where namespaces do work.
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
}
