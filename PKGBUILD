# Maintainer: Lara <dev@lara.monster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=3.0.1
pkgrel=2
pkgdesc="Some useful tools for use with steam client or compatible programs, websites"
arch=('any')
url="https://github.com/calendulish/steam-tools-ng"
depends=('python>=3.9' 'python-certifi' 'python-aiohttp' 'python-stlib>=1.3' 'python-stlib-plugins>=1.2' 'python-gobject' 'gtk4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'imagemagick')
license=('GPL')
source=(
    "https://github.com/calendulish/$pkgname/archive/v${pkgver}.tar.gz"
    "steam-tools-ng-3.0.1-pygobject-fix.patch"
)
sha256sums=('c0fa03ec0e9d29aa35efce30fee65fa49e9dd6ae0bda2d289dd96171afca5b01'
            '4817bc7b0e816fa3789f9c960b3351affd73148b839fffaa63ca0537558100f3')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 < "../steam-tools-ng-3.0.1-pygobject-fix.patch"
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    sed -i "s|^Icon=.*|Icon=steam-tools-ng|g" steam-tools-ng.desktop
    install -Dm644 steam-tools-ng.desktop $pkgdir/usr/share/applications/steam-tools-ng.desktop
    convert -resize 512x512 src/steam_tools_ng/icons/stng.png steam-tools-ng.png
    install -Dm644 steam-tools-ng.png  -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps
}


