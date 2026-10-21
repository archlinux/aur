# Maintainer: SteamedFish <steamedfish@hotmail.com>
#
# DRA/DRA+ audio decoder add-on for OnAir (CDR radio sound).
#
# OnAir ships no DRA decoder (patent/licence status unverified, see
# docs/CODECS.md "DRA+ (CDR sound)") but dlopens libonair_dra.so at
# runtime when found. This package builds it from the MIT-licensed
# decoder in maliwen2015/ffmpeg_cavs_dra using OnAir's own
# tools/addons/dra, and installs it where OnAir looks for it
# (/usr/lib/onair = <bindir>/../lib/onair, searched before the user
# codecs folder ~/.local/share/onair/codecs).
#
# Whether you may use this decoder depends on the patent rules where
# you live; check them first (as upstream notes).

pkgname=onair-dra
pkgver=0.2.8
pkgrel=2
pkgdesc="DRA/DRA+ audio decoder add-on for OnAir (CDR sound)"
arch=('x86_64' 'aarch64')
url="https://github.com/adswill/OnAir"
license=('MIT')  # the decoder (dradec.c, from maliwen2015/ffmpeg_cavs_dra); OnAir's build glue is GPL-3.0-or-later
depends=('glibc')
makedepends=('cmake' 'python')
source=("OnAir-$pkgver.tar.gz::https://github.com/adswill/OnAir/archive/refs/tags/v$pkgver.tar.gz"
        "ffmpeg-7.1.2_cavs_dra.patch::https://raw.githubusercontent.com/maliwen2015/ffmpeg_cavs_dra/eb94ceb887b47b6ecfbda9da43273dd65246df1e/ffmpeg-7.1.2_cavs_dra.patch"
        "LICENSE::https://raw.githubusercontent.com/maliwen2015/ffmpeg_cavs_dra/eb94ceb887b47b6ecfbda9da43273dd65246df1e/LICENSE")
sha256sums=('31526fc45e3b359572993b88ab5448b4cba298d2226befec9934de0e2410a62a'
            '1d1cac53cc2d19af39de854db186985fb653e820b0d071844a1e529550c08e40'
            'cac0ae34bd88bc4347c3901c3d6e9715ee64ae9b2ec8e027b0892ecd67db98f4')

build() {
    cd "OnAir-$pkgver/tools/addons/dra"
    # extract_dra.py normally downloads the patch itself; point it at the
    # pinned copy from source[] instead. It verifies the patch is the
    # version it knows and refuses anything else.
    python3 extract_dra.py "$srcdir/ffmpeg-7.1.2_cavs_dra.patch"
    cmake -S . -B build -DDRA_SRC=dra_src -DCMAKE_BUILD_TYPE=None
    cmake --build build
}

package() {
    install -Dm755 "OnAir-$pkgver/tools/addons/dra/build/libonair_dra.so" "$pkgdir/usr/lib/onair/libonair_dra.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
