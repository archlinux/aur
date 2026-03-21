# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.15.0
pkgrel=1
pkgdesc='Helper utility to work with patches made available via a public-inbox archive like lore.kernel.org.'
license=('GPL-2.0-or-later')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
makedepends=(
    'git'
    'python-build'
    'python-docutils'
    'python-installer'
    'python-setuptools'
    'python-shtab'
    'python-wheel'
)
checkdepends=(
    'python-pytest'
    'python-pytest-asyncio'
)
depends=(
    'git-filter-repo'
    'patatt'
    'python'
    'python-requests'
    'python-textual'
)
optdepends=('python-dkim: for dkim signature verification')
source=(
    "git+https://github.com/mricon/b4.git#tag=v${pkgver}?signed"
)
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E')
sha256sums=('f98b75f08bf7371adba6a49a637546a829c3c62b52da0b76df4260a3b25fc49f')

build() {
    cd "$pkgname"

    python -m build --wheel --no-isolation

    misc/tc-generate.sh bash > _bash
    misc/tc-generate.sh zsh > _zsh
}

check() {
    cd "$pkgname"/src/tests
    pytest -k 'not test_trailers'
}

package() {
    cd "$pkgname"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 src/b4/man/b4.1 "$pkgdir/usr/share/man/man1/b4.1"
    rm -rf "$pkgdir/usr/lib/python$python_version/site-packages/b4/man/"

    install -Dm 644 _bash "$pkgdir/usr/share/bash-completion/completions/b4"
    install -Dm 644 _zsh "$pkgdir/usr/share/zsh/site-functions/_b4"
}
