# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Mark Collins

pkgname="handy-bin"
pkgver=0.9.2
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
b2sums=('422255af26a126e6a12a77e9b1b5edb7b1487eda8b2cb8ccf7236fa6f3e628760e5baab294ad85fa95e0381289edd0dfa02e27acb579774a207d9af847916dff'
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
