# Maintainer: Sameer Puri <purisame@spuri.io>
pkgname=python-or-tools
pkgver=8.1
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.5' 'swig' 'python-protobuf')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip' 'git')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('a42a075761ee4411e5d3d55eff36c4e01b1e3a9f6bcca720c2189c9fb5181ee48b3d18a0424a304ef70a6f289f6d1bee')

build() {
    cd "${srcdir}/or-tools-${pkgver}"
    make third_party
    pacman -Qi cplex &> /dev/null && echo 'UNIX_CPLEX_DIR = /usr/lib' >> Makefile.local
    make python
    make pypi_archive
}

package() {
    cd "${srcdir}/or-tools-${pkgver}"
    /usr/bin/pip --quiet install --root="$pkgdir" \
        --no-deps --ignore-installed --no-warn-script-location \
        "$(find -name 'ortools*whl')"
}
