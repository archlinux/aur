# Maintainer: colegeming <collegeming@outlook.com>

pkgname=mark-shot-arch-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Native screenshot, annotation and recording tool (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jswysnemc/mark-shot'
license=('Apache-2.0' 'MIT')
# Copied from the upstream Arch package's .PKGINFO. The 0.2.x Rust rewrite no
# longer links FFmpeg via sonames -- media support is bundled in the payload.
depends=('glibc' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'openssl' 'pipewire' 'libpulse' 'libva' 'libdrm' 'mesa')
optdepends=(
    'noto-fonts: fallback fonts'
    'noto-fonts-cjk: CJK fonts'
    'xdg-desktop-portal: portal capture'
)
provides=('mark-shot')
conflicts=('mark-shot' 'mark-shot-bin')
options=('!strip' '!debug')

# Upstream publishes real Arch and Arch Linux ARM packages since 0.2.0; this
# package only repackages them (see metadata.toml).
source_x86_64=("mark-shot-bin-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/jswysnemc/mark-shot/releases/download/v${pkgver}/mark-shot-bin-0.2.0-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('38ba68d76229152cd566ac607f1a64a2bb4938300099b1f261adab5d96782f87')
source_aarch64=("mark-shot-bin-${pkgver}-1-aarch64.pkg.tar.zst::https://github.com/jswysnemc/mark-shot/releases/download/v${pkgver}/mark-shot-bin-0.2.0-1-aarch64.pkg.tar.zst")
sha256sums_aarch64=('9a2a987e6ee8c1f3f3141db547bce9d4200790982d84df9db0357d9ef43ce12c')

check() {
    :
}

package() {
    local pkg
    case "${CARCH}" in
        x86_64)  pkg="mark-shot-bin-${pkgver}-1-x86_64.pkg.tar.zst" ;;
        aarch64) pkg="mark-shot-bin-${pkgver}-1-aarch64.pkg.tar.zst" ;;
        *) echo "unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac

    # The source is already a pacman package: unpack its payload (minus the
    # metadata files) straight into $pkgdir.
    bsdtar -xf "${srcdir}/${pkg}" -C "${pkgdir}" \
        --exclude '.PKGINFO' --exclude '.BUILDINFO' --exclude '.MTREE'
    chmod -R u=rwX,go=rX "${pkgdir}"
}
