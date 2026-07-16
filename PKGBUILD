# Maintainer: Tiago Silva <tiagolsilva14 at gmail dot com>
#
# Before each release (see also hostkit/packaging/aur/RELEASING.md):
#  - tag v$pkgver upstream in both bincue-studio and hostkit, then push the tags
#  - run `updpkgsums` to fill both sha256sums
#  - regenerate .SRCINFO: makepkg --printsrcinfo > .SRCINFO
pkgname=bincue-studio
pkgver=1.0.0
pkgrel=1
# hostkit is statically vendored into the app, so it is not a runtime dependency;
# bump this to the hostkit release the app should be built against.
_hostkitver=1.0.0
pkgdesc="Audio CD authoring studio — assemble tracks, export BIN/CUE, burn, and design labels (includes cdlabel)"
arch=('x86_64')
_repo_url="https://github.com/TheGameratorT/bincue-studio"
_hostkit_url="https://github.com/TheGameratorT/hostkit"
url="$_repo_url"
license=('GPL-3.0-or-later')
# hostkit links Qt6 Core/Gui/Widgets; folded in here since it is static.
depends=('qt6-base' 'qt6-svg' 'taglib' 'ffmpeg')
makedepends=('cmake')
optdepends=('cdrdao: burn the exported BIN/CUE to disc')
source=("$pkgname-$pkgver.tar.gz::$_repo_url/archive/v$pkgver.tar.gz"
        "hostkit-$_hostkitver.tar.gz::$_hostkit_url/archive/v$_hostkitver.tar.gz")
sha256sums=('ea14e67ef5cca77b11b39e648fc99c9a6fc6c425b9f92b5a3b2c07550fcd5570'
            'decb486c77cc0ad5e243d9eeb9c1fc57b9c95ef79b605c9056d39b0d46112456')
_srcdir="$pkgname-$pkgver"

build() {
    cmake -B build -S "$_srcdir" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBINCUE_USE_SYSTEM_HOSTKIT=OFF \
        -DBINCUE_HOSTKIT_SOURCE_DIR="$srcdir/hostkit-$_hostkitver"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
