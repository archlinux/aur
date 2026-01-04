# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland
pkgver=2.6.0
pkgrel=0
pkgdesc="Customize your Hyprland with scratchpads, menus, easy monitor layout and other extensions"
arch=(any)
url="https://github.com/hyprland-community/pyprland"
license=('MIT')
groups=()
depends=('python' 'python-aiofiles' 'hyprland' 'python-build' 'python-installer' 'python-pillow' 'gcc')
makedepends=('python-poetry' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
noextract=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('45c15df6e790da2edd088664cd32089e585c22967df420d870f39bc67c568262')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
    cd client
    ${CC:-gcc} -o pypr-client pypr-client.c
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0755 "client/pypr-client" "$pkgdir/usr/bin/pypr-client"
    install -Dm0644 "scripts/completions/pypr.bash" "$pkgdir/usr/share/bash-completion/completions/pypr"
    install -Dm0644 "scripts/completions/pypr.zsh" "$pkgdir/usr/share/zsh/site-functions/_pypr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
