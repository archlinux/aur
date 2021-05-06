# Maintainer: Sameer Puri <purisame@spuri.io>
pkgname=python-or-tools
pkgver=9.0
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
sha512sums=('7cc453c3d32841232a089a26db6c93003d1254f3929069a4aa58375ecf043edfaf469936ca5793a009530506f0b2dc8d75c62c454a773be416f0dce8de787596')

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
