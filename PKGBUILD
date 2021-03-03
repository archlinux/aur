# Maintainer: Sameer Puri <purisame@spuri.io>
pkgname=python-or-tools
pkgver=8.2
pkgrel=1
pkgdesc="Google's Operations Research tools"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/google/or-tools"
license=('Apache2')
depends=('python>=3.6' 'swig' 'python-protobuf')
makedepends=('cmake' 'wget' 'lsb-release' 'automake' 'python-wheel' 'python-pip' 'git')
optdepends=('cplex: CPLEX solver support')
options=(!emptydirs)
source=("https://github.com/google/or-tools/archive/v${pkgver}.tar.gz")
sha384sums=('e5fdd4b5a40442fdafe48e677d8c45dc27d64f70bb42d508dd90e4ca64fed54be5954b3a29b9c460552287911d45bacd')

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
