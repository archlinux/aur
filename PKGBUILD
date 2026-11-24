# Maintainer: colegeming <collegeming@outlook.com>

pkgname=genoffice-arch-bin
pkgver=0.13.886
pkgrel=1
pkgdesc='Free, open-source AI office suite: docs, sheets, slides, PDF and markdown editors (built from source)'
arch=('x86_64' 'aarch64')
url='https://genoffice.ai/'
license=('Apache-2.0')
# Electron runtime dependencies: the deb's Depends (mapped to Arch names) plus
# libasound, which the Electron binary links directly. The tray icon library is
# dlopen'ed, so it stays optional. The bundled CLI runs through the packaged
# Electron binary with ELECTRON_RUN_AS_NODE=1 -- no system nodejs is needed.
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libcups' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator: tray icon support')
provides=('genoffice')
conflicts=('genoffice' 'genoffice-bin')
options=('!strip' '!debug')

# Built by this repository's build workflow on Arch (x86_64) and a native arm64
# runner (aarch64); see [build] in metadata.toml. Installing needs no toolchain.
source_x86_64=("genoffice-arch-bin-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/genoffice-arch-bin-0.13.886-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('acc7e3bbe1ad17e2023200ea6b70048b4aa8e2d0b43265f1f7eeba9589416a0a')
source_aarch64=("genoffice-arch-bin-${pkgver}-1-aarch64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/genoffice-arch-bin-0.13.886-1-aarch64.pkg.tar.zst")
sha256sums_aarch64=('8f2913d7c1f9007d4caa3c67d60a52c03722cb74baec9415e3c523a002aa2341')

package() {
    local pkg
    case "${CARCH}" in
        x86_64)  pkg="genoffice-arch-bin-${pkgver}-1-x86_64.pkg.tar.zst" ;;
        aarch64) pkg="genoffice-arch-bin-${pkgver}-1-aarch64.pkg.tar.zst" ;;
    esac

    # The source is already a pacman package: unpack its payload (minus the
    # metadata files) straight into $pkgdir -- /opt/GenOffice, usr/bin, the
    # desktop entry, icons and mime data all land in the right places.
    bsdtar -xf "${srcdir}/${pkg}" -C "${pkgdir}" --exclude '.PKGINFO' --exclude '.BUILDINFO' --exclude '.MTREE'
    chmod -R u=rwX,go=rX "${pkgdir}"
}
