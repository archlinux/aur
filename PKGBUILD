# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=langkit
epoch=1
pkgver=23.0.0
pkgrel=2

pkgdesc='Compiler for syntactic and semantic language analysis libraries.'
url='https://github.com/AdaCore/langkit/'
arch=('i686' 'x86_64')
license=('Apache')

depends=('gnatcoll-iconv' 'gnatcoll-gmp' 'python')
makedepends=('gprbuild' 'texlive-bin'
             'python-sphinx' 'python-e3-core' 'python-funcy' 'python-mako'
             'python-e3-testsuite' 'python-pygments' 'python-coverage' 
             'python-docutils' 'python-pexpect' 'python-ptyprocess' 'python-pycodestyle'
             'python-railroad-diagrams')

# 'python-gnatdbg'        'python-autopep8'  'python-flake8' 'python-mypy' 'python-sphinx-rtd-theme'
# 'python-types-docutils' 'python-types-gdb' 'python-yapf'


source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("50cb8b08fc180eab939a5747c52f68c073c7b77e6c12ef5c5aa488845d5c934c")

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    # Build the Langkit_Support library, used by all Langkit-generated libraries.
    python manage.py build-langkit-support            \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        --gargs="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

    python setup.py build
    make -C doc html
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    python manage.py install-langkit-support          \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        "$pkgdir/usr"

    # Install the license.
    install -D -m644 \
       "LICENSE"     \
       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install the documentation.
    pushd doc/_build/html

    for file in $(find . -type f); do
        install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done

    popd
}
