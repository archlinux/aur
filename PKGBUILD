# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.14.1
pkgrel=1
pkgdesc='Helper utility to work with patches made available via a public-inbox archive like lore.kernel.org.'
license=('GPL-2.0-or-later')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
makedepends=(
    'git'
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-docutils'
)
checkdepends=('python-pytest')
depends=(
    'python-requests'
    'git-filter-repo'
    'patatt'
    'python'
)
optdepends=('python-dkim: for dkim signature verification')
source=(
    "https://mirrors.edge.kernel.org/pub/software/devel/b4/${pkgname}-${pkgver}.tar."{xz,sign}
)
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E')
sha256sums=('29ebbc8a2facc5cc858ce3cc11e452724f27911bccff33f81b69f87f2be1c894'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    rst2man src/b4/man/b4.5.rst src/b4/man/b4.1
    gzip src/b4/man/b4.1
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"/src/tests
    pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 src/b4/man/b4.1.gz "$pkgdir/usr/share/man/man1/b4.1.gz"
    rm -rf "$pkgdir/usr/lib/python3.12/site-packages/b4/man/"
}
