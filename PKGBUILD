# Maintainer: Berk Küçük <dev.berkkucukk@gmail.com>
pkgname=hazedrop
pkgver=1.0.0
pkgrel=1
pkgdesc="Anonymous encrypted file transfer over Tor — Haze Protocol v2"
arch=('x86_64' 'aarch64')
url="https://github.com/berk-kucuk/HazeDrop"
license=('GPL-3.0-only')
depends=(
    'python'
    'tor'
    'libgl'
)
makedepends=('python-pip')
optdepends=(
    'xdg-utils: open download folder after transfer'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/HazeDrop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('22552d068128ed185252a9a8a09d5d43bfef6010321ce3d87b520730942c68f1')

_venvdir="/opt/$pkgname"

package() {
    cd "HazeDrop-$pkgver"

    # Create virtual environment at the real install path
    install -dm755 "$pkgdir$_venvdir"
    python -m venv "$pkgdir$_venvdir"

    # Install HazeDrop and all Python dependencies into the venv
    "$pkgdir$_venvdir/bin/pip" install \
        --quiet \
        --no-warn-script-location \
        .

    # Strip the fakeroot $pkgdir prefix from shebangs and venv config
    find "$pkgdir$_venvdir/bin" -type f \
        -exec sed -i "s|$pkgdir||g" {} +
    sed -i "s|$pkgdir||g" "$pkgdir$_venvdir/pyvenv.cfg"

    # Symlink launcher into /usr/bin
    install -dm755 "$pkgdir/usr/bin"
    ln -sf "$_venvdir/bin/hazedrop" "$pkgdir/usr/bin/hazedrop"

    # Desktop entry
    install -Dm644 hazedrop.desktop \
        "$pkgdir/usr/share/applications/hazedrop.desktop"

    # Application icon
    install -Dm644 hazedrop/assets/logo.png \
        "$pkgdir/usr/share/pixmaps/hazedrop.png"
}
