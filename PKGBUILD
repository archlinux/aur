# Maintainer: Fabien Devaux <fdev31@gmail.com>
# Contributor: Fabien Devaux <fdev31@gmail.com>
pkgname=pyprland-git
pkgver=r1424.5293179
pkgrel=3
pkgdesc="Easy scratchpads, menus, smart monitor placement and more hyprland tweaks (GIT version)"
arch=(any)
url="https://github.com/fdev31/pyprland"
license=('MIT')
groups=()
depends=('python' 'python-aiofiles')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(git+"https://github.com/fdev31/pyprland#branch=main")
noextract=()
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
    install -Dm0644 "scripts/completions/pypr.bash" "$pkgdir/usr/share/bash-completion/completions/pypr"
    install -Dm0644 "scripts/completions/pypr.zsh" "$pkgdir/usr/share/zsh/site-functions/_pypr"
    install -Dm0755 "client/pypr-client" "$pkgdir/usr/bin/pypr-client"
}
