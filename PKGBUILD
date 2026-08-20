# Maintainer: FrogSnot
_pkgauthor=FrogSnot
_pkgname=Sunder
pkgname=sunder-bin
pkgver=1.4.10
pkgrel=1
pkgdesc="A desktop YouTube music client that doesn't spy on you (prebuilt binary)"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'cairo'
         'libayatana-appindicator' 'librsvg' 'libsoup3' 'hicolor-icon-theme' 'yt-dlp' 'ffmpeg')
provides=('sunder')
conflicts=('sunder')
# NOTE: GitHub release assets use the upstream productName (capital S
# `Sunder`) from tauri.conf.json, NOT pkgname-stripped lowercase. The
# previous version had `${pkgname%-bin}` here, which expanded to
# `sunder_…_amd64.deb`, returning 404 and producing a sha256 of the
# GitHub 404 HTML page. AUR users then failed validity check on install.
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE"
        "README-$pkgver.md::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/README.md"
        "${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0' 'c0c2af790b62a2b5d253f2b5db95d74404bfafb8e3464ada5ddaa1c15f58d3d4' '0424cf57972b90e03a551592ad6dcf82b4589cab35a725d2441d1534eb2f0760')

package() {
    cd "$srcdir"

    # Auto-detect the data tarball compression. Upstream Tauri builds may
    # emit .gz, .xz, or .zst depending on the toolchain version. bsdtar
    # auto-detects all three from the extension/magic bytes, so we don't
    # have to hardcode a decompression flag.
    local data_tar
    data_tar=$(printf '%s\n' data.tar.* | head -n1)
    if [ -z "$data_tar" ] || [ ! -f "$data_tar" ]; then
        error "data tarball not found in srcdir (looked for data.tar.*)"
        return 1
    fi
    bsdtar -xf "$data_tar" -C "$pkgdir"

    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
    install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
