# Maintainer: colegeming <collegeming@outlook.com>

pkgname=genoffice-arch-bin
pkgver=0.13.615
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
source_x86_64=("genoffice-arch-bin-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/genoffice-arch-bin-0.13.615-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('298101cacb63ac190dfbcf2ec2b3d9fb9a66df3661f4cfb4b1f86edadaf78cf0')
source_aarch64=("genoffice-arch-bin-${pkgver}-1-aarch64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/genoffice-arch-bin-0.13.615-1-aarch64.pkg.tar.zst")
sha256sums_aarch64=('39d4ccbde1822f93f9826710c457ff388889229737874a9c09aea09ca78de49e')

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
