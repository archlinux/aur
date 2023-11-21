# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=python-aioserial-git
_gitname=python-aioserial
pkgver=r52.b47fce3
pkgrel=1
pkgdesc='pyserial-asyncio for humans'
url='https://github.com/mrjohannchang/aioserial.py'
arch=('any')
license=('custom')
depends=('python-pyserial')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-poetry')
conflicts=('python-aioserial' 'python-aioserial-git')
provides=('python-aioserial')
source=('python-aioserial::git+https://github.com/mrjohannchang/aioserial.py.git')
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$_gitname"

    # Change build system to Poetry Core
    sed -i 's/poetry>=0.12/poetry-core/g' pyproject.toml
    sed -i 's/poetry.masonry/poetry.core.masonry/g' pyproject.toml
}

pkgver() {
    cd "$srcdir/$_gitname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_gitname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_gitname"
}
