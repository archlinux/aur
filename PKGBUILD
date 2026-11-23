# Maintainer: Kaz Walker <me@kaz.codes>
pkgname=filmcraft-auto-bin
_pkgname=filmcraft
pkgver=0.20.1
pkgrel=1
pkgdesc='Open-source non-linear video editor written in pure Rust (official binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/storytold/filmcraft'
license=('MIT OR Apache-2.0' 'OFL-1.1')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'dbus' 'libglvnd' 'wayland'
         'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme')
optdepends=('libva: VA-API hardware video acceleration'
            'nvidia-utils: NVENC hardware encoding on NVIDIA GPUs')
provides=('filmcraft')
conflicts=('filmcraft')
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('3e4fea3cb8d473e68f189a0a8792ba46160fab507adab3ab8920073fd41f24fa')
sha256sums_aarch64=('cdce3d832620c7cf7150e6609fd98ad9702e7d4c57f827aab562e87d816ea13f')

package() {
    cd "${_pkgname}-${pkgver}-linux-${CARCH}"

    # GUI and CLI binaries
    install -Dm755 bin/filmcraft bin/filmcraft-cli -t "$pkgdir/usr/bin/"

    # Desktop entry, AppStream metadata and MIME type (Exec=filmcraft already
    # resolves via PATH, so these install unmodified)
    install -Dm644 share/applications/*.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 share/metainfo/*.xml -t "$pkgdir/usr/share/metainfo/"
    install -Dm644 share/mime/packages/*.xml -t "$pkgdir/usr/share/mime/packages/"

    # Icons (whichever sizes upstream ships), minus the per-file
    # .attribution sidecars that don't belong in an icon theme
    local icon
    for icon in share/icons/hicolor/*/apps/*; do
        [[ $icon == *.attribution ]] && continue
        install -Dm644 "$icon" "$pkgdir/usr/$icon"
    done

    # Licenses (app is MIT OR Apache-2.0; bundled fonts are OFL-1.1)
    install -Dm644 share/doc/filmcraft/LICENSE-* share/doc/filmcraft/NOTICE \
        share/doc/filmcraft/OFL-*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 share/doc/filmcraft/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
