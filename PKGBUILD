# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-espeakng-loader
_name=${pkgname#python-}
pkgver=0.2.4
pkgrel=1
epoch=
pkgdesc="A Python package that provides shared library loader for eSpeak NG"
arch=(x86_64)
url="https://github.com/thewh1teagle/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    gcc-libs
    glibc
    python
)
makedepends=(
    git
    cmake
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=(
    "${_name}::git+${url}.git"
    "https://github.com/thewh1teagle/espeakng-loader/releases/download/v0.1.0/espeak-ng-data.tar.gz"
    "https://github.com/thewh1teagle/espeakng-loader/releases/download/v0.1.0/espeak-ng-libs-linux-x86_64.tar.gz"
)
noextract=()
sha256sums=('SKIP'
            '38896a06fde172b57828e6877a2dbf6d278590f7f6ef6007a155b4049891f650'
            '6063b265c00e56ef3951b3baa12e7494c62b8025c98d225c7fe9fcf7970f48da')

build() {
    cp -rv ${srcdir}/espeak-ng-data "${srcdir}/${_name}"/src/espeakng_loader/
    extracted_dir="${srcdir}/espeak-ng-libs"
    find -L "$extracted_dir" -type f \( -name "*.dll*" -o -name "*.dylib*" -o -name "*.so*" \) -exec cp -P {} ${srcdir}/${_name}/src/espeakng_loader/ \;

    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
