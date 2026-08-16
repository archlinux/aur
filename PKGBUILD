# Maintainer: agentjp <agent at fastmail dot jp>
# SPDX-License-Identifier: 0BSD (this PKGBUILD; the packaged software is LGPL-2.1-or-later)
#
# Template for the AUR `bdinfo-rs-gui-bin` package. The `gui-publish.yml` aur leg
# replaces 4.0.0 / 172c01e521f835d1bf5ea26b7060b45692e8e7d90abe89f570e4790459b70ab6 / c1ea7234dde3f773dd56e5e0e9f4d433d69d247002ab535f05571158af821587 from the release's
# verified SHA256SUMS, validates the result in an Arch container (`makepkg
# --printsrcinfo` + `--verifysource`), and KSXGitHub/github-actions-deploy-aur
# pushes it to the AUR. Repackages the prebuilt release `.deb`: the gui-v*
# release ships no Linux tarball, and the `.deb` already lays out the desktop
# file, metainfo, and icon set at their installed paths.
pkgname=bdinfo-rs-gui-bin
_pkgname=bdinfo-rs-gui
# The AppStream component id, which names the installed desktop file, metainfo
# file, and icons inside the .deb.
_appid=io.github.agentjp.bdinfo-rs
pkgver=4.0.0
pkgrel=1
pkgdesc='Native desktop GUI for bdinfo-rs, the memory-safe Blu-ray disc analyzer'
arch=('x86_64' 'aarch64')
url='https://github.com/agentjp/bdinfo-rs'
license=('LGPL-2.1-or-later')
# The libraries the release binary links dynamically (built on glibc 2.35);
# everything GPU/dialog-adjacent is loaded at runtime instead — see optdepends.
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libx11' 'libxkbcommon' 'wayland')
optdepends=('vulkan-icd-loader: GPU rendering via wgpu; without it the app falls back to its built-in tiny-skia software renderer'
            'vulkan-driver: a Vulkan implementation for the GPU in use'
            'xdg-desktop-portal: native file-open dialogs (with a desktop portal backend, e.g. xdg-desktop-portal-gtk)')
provides=('bdinfo-rs-gui')
conflicts=('bdinfo-rs-gui')
# The release binary is prebuilt and already stripped (cargo profile
# strip=true) — don't re-strip it, and don't emit an (empty) -debug package on
# hosts whose makepkg.conf enables the `debug` option.
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/gui-v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/gui-v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.deb")
sha256sums_x86_64=('172c01e521f835d1bf5ea26b7060b45692e8e7d90abe89f570e4790459b70ab6')
sha256sums_aarch64=('c1ea7234dde3f773dd56e5e0e9f4d433d69d247002ab535f05571158af821587')

# No .install file: pacman's desktop-file-utils and hicolor-icon-theme hooks
# refresh the desktop database and icon cache on install/remove; calling those
# tools from a package function is against the Arch packaging guidelines.

package() {
    # makepkg has already unpacked the outer .deb (an ar archive bsdtar
    # recognizes) into $srcdir; unpack the payload tar it contains.
    tar -xf "${srcdir}"/data.tar.* -C "${srcdir}"

    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appid}.desktop" \
        "${pkgdir}/usr/share/applications/${_appid}.desktop"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appid}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${_appid}.metainfo.xml"
    local size
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_appid}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_appid}.png"
    done
    # The .deb's DEP-5 copyright doubles as the license document.
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
