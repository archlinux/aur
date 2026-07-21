# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Mark Collins

pkgname="handy-bin"
pkgver=0.9.4
pkgrel=1
pkgdesc="A free, open source, and extensible speech-to-text application that works completely offline"
url="https://handy.computer/"
license=("MIT")
arch=("x86_64")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    "alsa-lib"
    "cairo"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "gtk-layer-shell"
    "hicolor-icon-theme"
    "libappindicator-gtk3"
    "libsoup3"
    "openssl"
    "vulkan-icd-loader"
    "webkit2gtk-4.1"
)
source=("${pkgname}-${pkgver}.deb::https://github.com/cjpais/Handy/releases/download/v${pkgver}/Handy_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/cjpais/Handy/refs/heads/main/LICENSE")
b2sums=('39c1a2abd92483e76f00d6fadf722c980a5009a797e72de36b247f3739b955bc117f8565dab26552eeee2e397d8a19c09b16f1b4c8c8671376d92aa4407ee951'
        '48678eca5b87a0b59038c8b343d84073207bca4390ad40ac81f2f96dc553cc66453f0f6331749d4686aa7153875bdaf2e08b2adf2bef023ee6044518955a7950')

package() {
    bsdtar -xf "data.tar.gz" -C "${pkgdir}"

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    sed -i 's/Categories=/Categories=Utility;/g' "${pkgdir}/usr/share/applications/Handy.desktop"

    # Fix non symlinked libs
    libs_to_symlink=(
        libtranscribe.so
        libggml.so
        libggml-base.so
    )

    for lib in "${libs_to_symlink[@]}"; do
        if ! [ -h "$pkgdir/usr/lib/$lib" ]; then
            rm -f "$pkgdir/usr/lib/$lib"
        fi
        if ! [ -h "$pkgdir/usr/lib/$lib.0" ]; then
            rm -f "$pkgdir/usr/lib/$lib.0"
        fi

        versioned_lib=$(find "$pkgdir/usr/lib" -name "$lib.*")

        ln --symbolic --relative "$versioned_lib" "$pkgdir/usr/lib/$lib.0"
        ln --symbolic --relative "$pkgdir/usr/lib/$lib.0" "$pkgdir/usr/lib/$lib"
    done

    # upstream .deb ships duplicate copies instead of proper symlinks
    ln -sf "libonnxruntime.so.1.24.2" "${pkgdir}/usr/lib/libonnxruntime.so.1"
    ln -sf "libonnxruntime.so.1.24.2" "${pkgdir}/usr/lib/libonnxruntime.so"
}
