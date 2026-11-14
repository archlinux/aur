# Maintainer: colegeming <collegeming@outlook.com>

pkgname=solomd-arch-bin
pkgver=5.1.0
pkgrel=1
pkgdesc='Lightweight Markdown and plain text editor (Tauri 2; upstream .deb repackaged for Arch and Arch Linux ARM)'
arch=('x86_64' 'aarch64')
url='https://solomd.app'
license=('MIT')
# The sonames the binary actually needs (read from DT_NEEDED):
# webkit2gtk-4.1 supplies libwebkit2gtk-4.1.so.0 and
# libjavascriptcoregtk-4.1.so.0, libsoup3 supplies libsoup-3.0.so.0. The rest
# come in transitively, but are listed so a partial system fails at install
# time instead of at startup.
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'gdk-pixbuf2' 'cairo' 'glib2' 'dbus' 'wayland' 'xz' 'zlib')
optdepends=(
    'wl-clipboard: clipboard image support on Wayland'
    'xclip: clipboard image support on X11'
)
provides=('solomd')
conflicts=('solomd' 'solomd-bin')
options=('!strip' '!debug')

# The package payload is the upstream .deb; only the license text comes from
# the repo at the release tag (see [extras.license] in metadata.toml).
source=("LICENSE::https://raw.githubusercontent.com/zhitongblog/solomd/v5.1.0/LICENSE")
sha256sums=('abe8ac7178f2d3e51647e58039cda0bb74ca8661f126108acc2fa57bf9c76dce')
source_x86_64=("SoloMD_${pkgver}_amd64.deb::https://github.com/zhitongblog/solomd/releases/download/v${pkgver}/SoloMD_5.1.0_amd64.deb")
sha256sums_x86_64=('9694acd493cab2b8e46808bf54aed50749740aef42797fed736975716b9cb0b9')
source_aarch64=("SoloMD_${pkgver}_arm64.deb::https://github.com/zhitongblog/solomd/releases/download/v${pkgver}/SoloMD_5.1.0_arm64.deb")
sha256sums_aarch64=('1214097ed9665c67ca97e91fe94cb48be79ab3b25b376343375a7e758fafd6f0')

package() {
    local deb
    case "${CARCH}" in
        x86_64)  deb="SoloMD_${pkgver}_amd64.deb" ;;
        aarch64) deb="SoloMD_${pkgver}_arm64.deb" ;;
        *) echo "unsupported architecture: ${CARCH}" >&2; return 1 ;;
    esac

    # A .deb is an ar container (debian-binary, control.tar.*, data.tar.*).
    # libarchive reads the container but does not recurse into its members, so
    # unpack the container once and then extract the payload tarball into
    # $pkgdir. The deb layout (usr/bin/SoloMD, usr/lib/SoloMD/resources) is
    # what the binary expects at runtime.
    local work="${srcdir}/deb-${CARCH}"
    rm -rf "${work}"
    mkdir -p "${work}"
    bsdtar -xf "${srcdir}/${deb}" -C "${work}"
    bsdtar -xf "${work}"/data.tar.* -C "${pkgdir}"

    chmod 755 "${pkgdir}/usr/bin/SoloMD" "${pkgdir}/usr/bin/solomd-mcp"
    ln -s SoloMD "${pkgdir}/usr/bin/solomd"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
