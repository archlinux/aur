# Maintainer: steffeno <steffeno dash etc at protonmail dot com>
#
pkgname=python-randcrack-git
_pkgname=randcrack
pkgver=0.3.0.r45.dc94a3c
pkgrel=1
pkgdesc="Python random module cracker / predictor"
arch=('any')
url='https://github.com/tna0y/Python-random-module-cracker'
license=('MIT')

depends=('python')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/$pkgname"

    local version
    version=$(python -c '
from pathlib import Path
import tomllib
print(tomllib.loads(Path("pyproject.toml").read_text())["project"]["version"])
')

    printf "%s.r%s.%s" \
        "$version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname"
    pytest
}

package() {
    cd "$srcdir/$pkgname"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    install -Dm644 LICENSE.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
