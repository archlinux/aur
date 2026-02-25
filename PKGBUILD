# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland-git
pkgver=r1424.5293179
pkgrel=9

pkgdesc="A companion for your desktop UX (scratchpads, menus, monitor layout and more)"
arch=(any)
url="https://github.com/hyprland-community/pyprland"
license=('MIT')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pillow')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'gcc')
optdepends=('python-questionary: for pypr-quickstart to work')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"https://github.com/fdev31/pyprland#branch=main")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
    cd client
    ${CC:-gcc} -o pypr-client pypr-client.c
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0755 "client/pypr-client" "$pkgdir/usr/bin/pypr-client"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
