# Maintainer: Piotr Balwierz <github.com/balwierz>
#
# Split package: `vv` (the CLI/TUI, lean deps) and `vv-gui` (the Qt6/KDE
# desktop viewer + Dolphin thumbnailer / metadata plugins). One build with
# -DVV_BUILD_GUI=ON produces both; install whichever you want.
#
# Not the terminal image viewer: until October 2026 the AUR package `vv` was
# wolfpld's image viewer (https://github.com/wolfpld/vv, last version 3.2-1).
# This `vv` is a different program, the data / genomic file viewer from
# https://github.com/balwierz/vv. vv.install says so on install, and warns
# when it replaces the image viewer. No epoch: 1.x sorts below 3.2, so an AUR
# helper does not offer this package as an upgrade of the image viewer.
pkgbase=vv
pkgname=('vv' 'vv-gui')
pkgver=1.34.0
pkgrel=1
pkgdesc="Universal data/genomic file viewer (Parquet, Arrow, HDF5, BAM, VCF, BED, …)"
arch=('x86_64' 'aarch64')
url="https://github.com/balwierz/vv"
license=('MIT')
# expat + minizip + xlsxio are linked directly (.ods/.xlsx + NPZ/zip); xlsxio is
# from the AUR. zlib is also linked directly (pulled transitively by arrow /
# htslib / sqlite, but kept explicit for the build).
# `htslib` and `xlsxio` are AUR packages (an AUR helper
# builds them first). DuckDB support is off (-DVV_WITH_DUCKDB=OFF): .duckdb
# files are refused, as in the static binary.
makedepends=('cmake' 'arrow' 'htslib' 'ncurses' 'hdf5' 'sqlite' 'xz' 'bzip2' 'blosc'
             'expat' 'minizip' 'xlsxio' 'zlib'
             'qt6-base' 'extra-cmake-modules' 'kio' 'kcoreaddons' 'kfilemetadata' 'kparts')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/balwierz/$pkgbase/archive/refs/tags/v$pkgver.tar.gz")
# Regenerate after every pkgver bump — `updpkgsums` (from pacman-contrib)
# rewrites this line in place. Do NOT use SKIP: this is a network-fetched
# release tarball, and the checksum is the only thing pinning it.
sha256sums=('a483bf9bf5a464ee0ca77cf1d80fa40bcb72fd54532cee15a1c08b3515793390')

build() {
    cmake -S "$pkgbase-$pkgver" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DVV_BUILD_GUI=ON \
        -DVV_WITH_DUCKDB=OFF
    cmake --build build -j"$(nproc)"
}

package_vv() {
    pkgdesc="Universal data/genomic file viewer — CLI + ncurses TUI"
    depends=('arrow' 'htslib' 'ncurses' 'hdf5' 'sqlite' 'xz' 'bzip2' 'blosc'
             'expat' 'minizip' 'xlsxio' 'zlib')
    install=vv.install
    cd "$pkgbase-$pkgver"
    install -Dm755 ../build/vv "$pkgdir/usr/bin/vv"
    ln -s vv "$pkgdir/usr/bin/vh"
    [ -f man/vv.1 ] && install -Dm644 man/vv.1 "$pkgdir/usr/share/man/man1/vv.1"
    install -Dm644 completions/vv.bash "$pkgdir/usr/share/bash-completion/completions/vv"
    install -Dm644 completions/vv.fish "$pkgdir/usr/share/fish/vendor_completions.d/vv.fish"
    install -Dm644 completions/_vv "$pkgdir/usr/share/zsh/site-functions/_vv"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vv/LICENSE"
}

package_vv-gui() {
    pkgdesc="Qt6/KDE desktop viewer for vv — windowed table view + Dolphin integration"
    # vvg and the plugins link the reader core themselves; `vv` is for the
    # command lines vvg copies (Copy as vv Command).
    depends=('vv' 'qt6-base' 'arrow' 'htslib' 'hdf5' 'sqlite' 'xz' 'bzip2' 'blosc'
             'expat' 'minizip' 'xlsxio' 'zlib' 'kio' 'kcoreaddons' 'kfilemetadata'
             'kparts' 'hicolor-icon-theme')
    cd "$pkgbase-$pkgver"
    install -Dm755 ../build/gui/vvg "$pkgdir/usr/bin/vvg"
    # KF6 plugins.
    install -Dm755 ../build/gui/kde/vvthumbnail.so \
        "$pkgdir/usr/lib/qt6/plugins/kf6/thumbcreator/vvthumbnail.so"
    install -Dm755 ../build/gui/kde/vvextractor.so \
        "$pkgdir/usr/lib/qt6/plugins/kf6/kfilemetadata/vvextractor.so"
    install -Dm755 ../build/gui/kde/vvpart.so \
        "$pkgdir/usr/lib/qt6/plugins/kf6/parts/vvpart.so"
    install -Dm755 ../build/gui/kde/vvproperties.so \
        "$pkgdir/usr/lib/qt6/plugins/kf6/propertiesdialog/vvproperties.so"
    # Desktop integration.
    install -Dm644 gui/kde/org.vv.Viewer.desktop \
        "$pkgdir/usr/share/applications/org.vv.Viewer.desktop"
    install -Dm644 gui/kde/org.vv.Viewer.metainfo.xml \
        "$pkgdir/usr/share/metainfo/org.vv.Viewer.metainfo.xml"
    install -Dm644 gui/kde/vv-formats.xml \
        "$pkgdir/usr/share/mime/packages/vv-formats.xml"
    install -Dm644 gui/kde/icons/vv.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/vv.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vv-gui/LICENSE"
}
