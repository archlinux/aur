# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.14.3
pkgrel=3
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
checkdepends=('python-pytest')
depends=(
    'git-filter-repo'
    'patatt'
    'python'
    'python-requests'
)
optdepends=('python-dkim: for dkim signature verification')
source=(
    "git+https://github.com/mricon/b4.git#tag=v${pkgver}?signed"
)
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E')
sha256sums=('b2cd2a6da3e3d84cf2a7060cffc0786f4381d8d2f46c65fd2c58306eca1ed6a5')

build() {
    cd "$pkgname"

    python -m build --wheel --no-isolation

    misc/tc-generate.sh bash > _bash
    misc/tc-generate.sh zsh > _zsh
}

check() {
    cd "$pkgname"/src/tests
    pytest
}

package() {
    cd "$pkgname"
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm 644 src/b4/man/b4.5 "$pkgdir/usr/share/man/man1/b4.1"
    rm -rf "$pkgdir/usr/lib/python$python_version/site-packages/b4/man/"

    install -Dm 644 _bash "$pkgdir/usr/share/bash-completion/completions/b4"
    install -Dm 644 _zsh "$pkgdir/usr/share/zsh/site-functions/_b4"
}
