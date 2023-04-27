# Maintainer: Lara <dev@lara.monster
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Acidhub <dev@acidhub.click>

pkgname=steam-tools-ng
pkgver=3.1.1
pkgrel=2
pkgdesc="Some useful tools for use with steam client or compatible programs, websites"
arch=('any')
url="https://github.com/calendulish/steam-tools-ng"
depends=('python>=3.9' 'python-certifi' 'python-aiohttp' 'python-stlib>=2.0' 'python-stlib-plugins>=1.2.3' 'python-gobject' 'gtk4')
makedepends=('python-build' 'python-installer' 'python-wheel' 'imagemagick')
license=('GPL')
source=(
    "https://github.com/calendulish/$pkgname/archive/v${pkgver}.tar.gz"
    "https://github.com/calendulish/$pkgname/commit/b49deac04211c6c010a6db0f3b9cc06a646fd0c1.patch"
)
sha256sums=('4af918fd74c020451eef29375781c6bb2cb7a05afba4e64f05a886b3fe84ca89'
            '6433d67ca6a0a4555cbff98314ff5c196f32ca8dcf6519cf86a093269da322cc')

prepare() {
    cd $pkgname-$pkgver
    patch -Np1 < "../b49deac04211c6c010a6db0f3b9cc06a646fd0c1.patch"
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


