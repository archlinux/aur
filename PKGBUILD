# Maintainer: colegeming <collegeming@outlook.com>

pkgname=mark-shot-arch-bin
pkgver=0.1.62
pkgrel=3
pkgdesc='Qt 6 Wayland screenshot selection and annotation tool (built against Arch/ALARM)'
arch=('x86_64' 'aarch64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT')
# Runtime deps mirror the generated .PKGINFO. layer-shell-qt is required on both
# arches: our builds compile the optional libmark-shot-layer-shell.so plugin
# (upstream's own aarch64 asset was built without it, see jswysnemc/mark-shot#155).
# ffmpeg is needed by usr/lib/mark-shot/recording/libmark-shot-recording-libav.so;
# the main binary does not link it directly.
depends=('qt6-base' 'qt6-svg' 'qt6-wayland' 'layer-shell-qt' 'pipewire' 'ffmpeg' 'grim' 'wl-clipboard' 'hicolor-icon-theme' 'python')
provides=('mark-shot')
conflicts=('mark-shot' 'mark-shot-bin')
options=('!strip' '!debug')

# The pacman packages below are built by this repository's `build` workflow,
# which compiles upstream against Arch Linux (x86_64) and Arch Linux ARM
# (aarch64). Installing them needs no build toolchain.
#
# They are prebuilt packages, so there is nothing to compile here: unpacking the
# .pkg.tar.zst's payload into $pkgdir is the whole install.
source_x86_64=("mark-shot-arch-bin-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/mark-shot-arch-bin-0.1.62-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('5fc8086c7e7bb72f0e5766cb9a6dec7a175e5bf5778162c54ee80508876121c8')
source_aarch64=("mark-shot-arch-bin-${pkgver}-1-aarch64.pkg.tar.zst::https://github.com/collegeming/aur-release/releases/download/aur-built-latest/mark-shot-arch-bin-0.1.62-1-aarch64.pkg.tar.zst")
sha256sums_aarch64=('403e439b67253d553244ac1e8b91b556cb8e48675f36054ec3b80a3850a00698')

package() {
    # A .pkg.tar.zst is just a zstd-compressed tarball whose first member is
    # .PKGINFO. Extract everything except that metadata file straight into
    # $pkgdir -- usr/bin, usr/share/{applications,icons,licenses,doc} land in
    # the right places.
    local pkg
    case "${CARCH}" in
        x86_64)  pkg="mark-shot-arch-bin-${pkgver}-1-x86_64.pkg.tar.zst" ;;
        aarch64) pkg="mark-shot-arch-bin-${pkgver}-1-aarch64.pkg.tar.zst" ;;
    esac

    bsdtar -xf "${srcdir}/${pkg}" -C "${pkgdir}" --exclude '.PKGINFO' --exclude '.BUILDINFO' --exclude '.MTREE'

    # Both of our builds compile the optional layer-shell plugin; a package
    # without it silently degrades on tiling compositors (hyprland/sway), which
    # is exactly the defect upstream's own aarch64 asset has.
    if [ ! -f "${pkgdir}/usr/lib/mark-shot/libmark-shot-layer-shell.so" ]; then
        echo "error: prebuilt package is missing libmark-shot-layer-shell.so" >&2
        return 1
    fi

    chmod -R u=rwX,go=rX "${pkgdir}"
}

# The package ships the full runtime dependency set in its .PKGINFO, so trust
# the file list rather than re-deriving it.
check() {
    :
}
