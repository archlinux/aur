# Maintainer:
# Contributor: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>

pkgname=zuban
pkgver=0.7.1
pkgrel=1
pkgdesc="A Mypy-compatible Python Language Server built in Rust"
arch=('x86_64')
url="https://zubanls.com"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('git' 'maturin' 'python-installer')
source=("git+https://github.com/zubanls/zuban.git#tag=v${pkgver}"
        "git+https://github.com/python/typeshed.git"
        "git+https://github.com/davidhalter/mypy.git"
        "git+https://github.com/typeddjango/django-stubs.git")
sha256sums=('fb7cf9645d29456692686f951eb42b02e86eabfee589e7797597f4ae0baf8414'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "${pkgname}"
    git submodule init
    git config submodule.typeshed.url "${srcdir}/typeshed"
    git config submodule.crates/zuban_python/tests/mypylike/mypy.url "${srcdir}/mypy"
    git config submodule.third_party/django-stubs.url "${srcdir}/django-stubs"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${pkgname}/deploy/pypi/zuban"
    CFLAGS+=" -ffat-lto-objects"
    ./pre-maturin-build.sh
    maturin build
}

package() {
    cd "${pkgname}/target"
    python -m installer --destdir="${pkgdir}" wheels/*.whl
}
