# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=ada_language_server
pkgver=22.0.3
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
        "git+https://github.com/AdaCore/VSS.git#commit=b9c65707a43d747116dad7711d1d026c9b767d41"
        "git+https://github.com/AdaCore/langkit.git#commit=3e376436d169a91bda26ba48ed151acf22bada9a"
        "git+https://github.com/AdaCore/libadalang.git#commit=f95e0161cf0bca8e21c8bc7a8795eb332b153733"
        "git+https://github.com/AdaCore/libadalang-tools.git#commit=9bfbf407d9f376684aafe25797b04cb3fe10ca02"
        "libadalang-tools.patch"
        "VSS.patch"
        "ada_language_server.patch")
sha1sums=('fec24df3cda0ed7a0022a5f09a2ca4194aecb778'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'b1d6d2578ef21d3dd71dee10ed4857a5a4e5f8d5'
          'dcc8be463ad852ea595748b5c3c092fc88f79ae5'
          '23f4f0502d322bda621ad013aab5f45ab20555aa')

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
    # 5. Finally, build ada_language_server
    cd "../$pkgname-$pkgver"
    make BUILD_MODE=prod LIBRARY_TYPE=static-pic
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

	make BUILD_MODE=prod LIBRARY_TYPE=static-pic DESTDIR="$pkgdir/usr" install
}
