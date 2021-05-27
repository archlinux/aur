# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgver=22.0.6
pkgrel=1

pkgdesc='High performance syntactic and semantic engine for the Ada programming language'
url='https://github.com/AdaCore/ada_language_server/'
arch=('x86_64')
license=('GPL3')

depends=('gnatcoll-iconv' 'gnatcoll-gmp' 'ada-libfswatch-git')
makedepends=('gcc-ada' 'gprbuild-git' 'autopep8' 'python-coverage'
             'python-docutils' 'python-funcy' 'python-mako' 'python-psutil'
             'python-sphinx_rtd_theme' 'yapf' 'python-pycodestyle' 'mypy' 'flake8' 'python-jsonschema'
             'python-e3-core' 'python-e3-testsuite' 'git')

provides=('ada_language_server')
conflicts=('ada_language_server-git' 'libvss' 'libadalang')
_upstream_ver=2020-20200429-1998C
_pkgname=libadalang-tools
_pkgver=2020
_checksum=740372d8ffb1e4755a99bead2d78dace904235c0
source=("$pkgname-$pkgver.tar.gz::https://github.com/AdaCore/ada_language_server/archive/$pkgver.tar.gz"
        "git+https://github.com/AdaCore/VSS.git#commit=d6c6024"
        "git+https://github.com/AdaCore/langkit.git#commit=80d6e2c"
        "git+https://github.com/AdaCore/libadalang.git#commit=56616cc"
        "git+https://github.com/AdaCore/libadalang-tools.git#commit=479382d"
        "git+https://github.com/AdaCore/spawn.git#commit=e57c59d"
        "libadalang-tools.patch"
        "VSS.patch"
        "ada_language_server.patch")
sha1sums=('14aa85d349d9b0837fb5295f92cfa8a130946afc'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          '1eb931d9aea713d3d553d9f6ebc44e5bce58f551'
          'dcc8be463ad852ea595748b5c3c092fc88f79ae5'
          'ee3bc8ed18ef9f1c94361aa91acae4f6c1364a25')

prepare() {
    cd "$srcdir/libadalang-tools"
    git apply "$srcdir/libadalang-tools.patch"
    cd "$srcdir/VSS"
    git apply "$srcdir/VSS.patch"
    cd "$srcdir/$pkgname-$pkgver"
    git apply "$srcdir/ada_language_server.patch"
}

build() {
    # Manually handle dependencies since we have to use specific versions that don't match version in the AUR
    # 1. Build VSS
    cd "$srcdir/VSS"
    make BUILD_MODE=prod all
    # 2. Build langkit
    cd ../langkit
    python manage.py build-langkit-support --library-types=static-pic
    # 3. Build libadalang
    cd ../libadalang
    PYTHONPATH="../langkit"
    export PYTHONPATH
    python manage.py generate
    # 4. Build libadalang-tools
    cd ../libadalang-tools
    make BUILD_MODE=prod LIBRARY_TYPE=static-pic
    # 5. Build spawn
    cd ../spawn
    make all
    # 6. Finally, build ada_language_server
    cd "../$pkgname-$pkgver"
    make BUILD_MODE=prod LIBRARY_TYPE=static-pic
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

	make BUILD_MODE=prod LIBRARY_TYPE=static-pic DESTDIR="$pkgdir/usr" install
}
