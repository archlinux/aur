# Maintainer: boreq <boreq@0x46.net>
pkgname=nah-git
_pkgname=nah
pkgver=0.7.1.r0.g0000000
pkgrel=1
pkgdesc="Context-aware safety guard for Claude Code (git version)"
arch=('any')
url="https://github.com/manuelschipper/nah"
license=('MIT')
depends=('python')
optdepends=('python-yaml: YAML config file support')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/manuelschipper/nah.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
