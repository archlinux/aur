# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=draquet-polyglot-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="PolyGlot is a conlang construction toolkit"
arch=('x86_64' 'aarch64')
url="https://github.com/DraqueT/PolyGlot"
license=('MIT')
depends=('alsa-lib' 'bash' 'freetype2' 'gcc-libs' 'giflib' 'glibc' 'harfbuzz' 'hicolor-icon-theme'
         'lcms2' 'libjpeg-turbo' 'libpng' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
provides=('draquet-polyglot')
conflicts=('draquet-polyglot')
noextract=("${pkgname}-${pkgver}.deb")
source=("draquet-polyglot.desktop")
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/DraqueT/PolyGlot/releases/download/v${pkgver}/polyglot-linear-a_${pkgver}-1_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}.deb::https://github.com/DraqueT/PolyGlot/releases/download/v${pkgver}/polyglot-linear-a_${pkgver}-1_arm64.deb")
sha256sums=('92b10fc2c60fcdbcc9d9880891b51a02eebe1c49e3baf56b8cbe187e34832944')
sha256sums_x86_64=('7f534c534bdeb82b2a4abc42428612342dc04c28d0980d1faf517bf771eb5c46')
sha256sums_aarch64=('d9f1bbfe6309588bf7a76591f035026fe3a6115423c99fd41c65ef74960a70fe')

prepare() {
    ar x "${pkgname}-${pkgver}.deb"
    tar -xf data.tar.zst
}

package() {
    local instdir="$pkgdir/usr/lib/draquet-polyglot"
    install -dm755 "$instdir"

    # Install full app tree (includes bundled JRE — no java-runtime dep needed)
    cp -r opt/polyglot-linear-a/. "$instdir"

    # Launcher symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/draquet-polyglot/bin/PolyGlot "$pkgdir/usr/bin/PolyGlot"

    # Icon
    install -Dm644 opt/polyglot-linear-a/lib/PolyGlot.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/draquet-polyglot.png"

    # Desktop entry
    install -Dm644 draquet-polyglot.desktop "$pkgdir/usr/share/applications/draquet-polyglot.desktop"

    # License
    install -Dm644 opt/polyglot-linear-a/share/doc/copyright \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
