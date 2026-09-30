# Maintainer: Maple <maple@localhost>
pkgname=cutwire-drift-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="Beginner-friendly open-source video editor built with Qt 6, QML and FFmpeg (prebuilt binary)"
arch=('x86_64')
url="https://github.com/CutWire-Studios/Drift"
license=('GPL-3.0-or-later')
provides=('drift')
options=('!strip' '!debug')
depends=(
    'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'qt6-multimedia-ffmpeg'
    'qt6-imageformats'
    'ffmpeg' 'zstd' 'openssl' 'soundtouch' 'zlib'
    'harfbuzz' 'icu' 'expat' 'libpng' 'fontconfig' 'freetype2'
)
# El upstream publica un paquete de pacman completo en releases; solo se reempaqueta.
# El nombre del artefacto lleva el pkgrel ("-1"), por eso se compone abajo.
source=("$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.zst::https://github.com/CutWire-Studios/Drift/releases/download/v$pkgver/drift-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha256sums=('dc7f3c15db9008f29a96a9d69ba966ee1b07fb9abdba43658331c3e91ec18954')

package() {
    bsdtar -xf "$srcdir/$pkgname-$pkgver-$pkgrel-$arch.pkg.tar.zst" \
        --exclude '.PKGINFO' --exclude '.MTREE' --exclude '.BUILDINFO' \
        -C "$pkgdir"

    # El upstream usa "drift" como dirname de licencia; se renombra al de este paquete.
    if [[ -d "$pkgdir/usr/share/licenses/drift" ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        mv "$pkgdir/usr/share/licenses/drift/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
        rmdir "$pkgdir/usr/share/licenses/drift"
    fi
}
