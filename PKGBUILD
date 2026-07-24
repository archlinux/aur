# Maintainer: GG2R10 <herc2435 at gmail dot com>
pkgname=ucs-git
pkgver=r2.d929acb
pkgrel=1
pkgdesc="Remap colors across your dotfiles from a manual or wallpaper-generated palette"
arch=('any')
url="https://github.com/GG2R10/ultimate-color-switcher"
license=('GPL-2.0-only')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-numpy'
    'python-pillow'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
    'blueprint-compiler'
    'imagemagick'
)
provides=("ucs=${pkgver}")
conflicts=('ucs')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"

    # Pre-compile the GTK Blueprint UI sources at build time, so the
    # installed package never needs blueprint-compiler (it's makedepends
    # only) nor writes into /usr at runtime -- see gui/template_loader.py.
    for blp in color_switcher/gui/blueprints/*.blp; do
        blueprint-compiler compile "$blp" --output "${blp%.blp}.ui"
    done

    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 packaging/ucs.desktop "$pkgdir/usr/share/applications/ucs.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon: generated from the single 1024x1024 master at build time (same
    # convention as the .blp -> .ui blueprints above) instead of committing
    # one PNG per size -- the source has gradients/glow that a real SVG
    # trace wouldn't reproduce, so raster resizing is the faithful option.
    for size in 16 22 24 32 48 64 128 256 512; do
        install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        magick assets/UCS1024x1024.png -resize "${size}x${size}" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/ucs.png"
    done
}
