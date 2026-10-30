# Maintainer: MrQuantumOFF <me@mrquantumoff.dev>

# GitHub slug the release .deb is downloaded from. The release pipeline rewrites
# this line to ${{ github.repository }} at publish time.
_ghrepo="mrquantumoff/audioclock"

pkgname=audioclock-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Inspect and manage PipeWire and WirePlumber audio clock and format settings (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_ghrepo}"
license=('MIT')
# The prebuilt binary hard-links libpipewire/libxkbcommon and dlopens the
# Wayland/GL/Vulkan client libraries at runtime; list both sets.
depends=('pipewire' 'wireplumber' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'libglvnd')
provides=('audioclock')
conflicts=('audioclock')
# Repackages the Debian build for the matching arch (Debian calls them amd64 /
# arm64). It is compiled on an older glibc than Arch ships, so it runs here via
# forward compatibility; no rebuild happens.
_rel="https://github.com/${_ghrepo}/releases/download/v${pkgver}"
source_x86_64=("${_rel}/audioclock_${pkgver}-1_amd64.deb")
source_aarch64=("${_rel}/audioclock_${pkgver}-1_arm64.deb")
sha256sums_x86_64=('cc1782774ad28bcbf3883758c02e2f417b792683bbb5afb54d83b944c4140686')
sha256sums_aarch64=('2cd07cc4ddefe5ab9a3846d5e1e0837aa1073992373a7086d10c95bd203c81b7')

package() {
    cd "$srcdir"
    # Only the source for the building arch is fetched, so glob the one .deb.
    # A .deb is an `ar` archive; libarchive's bsdtar reads it and unpacks the
    # inner data member (data.tar.{zst,xz}) straight into the package root.
    bsdtar -xf audioclock_"${pkgver}"-1_*.deb
    bsdtar -xpf data.tar.* -C "$pkgdir/"

    # cargo-deb ships the license as a Debian copyright file; move it to the
    # Arch-conventional location.
    if [[ -f "$pkgdir/usr/share/doc/audioclock/copyright" ]]; then
        install -Dm644 "$pkgdir/usr/share/doc/audioclock/copyright" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        rm -f "$pkgdir/usr/share/doc/audioclock/copyright"
    fi
}
