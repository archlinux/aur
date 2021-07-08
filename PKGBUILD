# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=langkit
pkgver=20210518
pkgrel=1
pkgdesc='Compiler for syntactic and semantic language analysis libraries.'

url='https://github.com/AdaCore/langkit/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gnatcoll-iconv' 'python')
makedepends=('gprbuild' 'texlive-bin' 'python-sphinx' 'python-e3-core' 'python-funcy' 'python-mako')

_extract_dir="$pkgname-2021-$pkgver-19B8E-src"
_hash=709e5ffa66fd8181655951e0ec8ed04e1d2977e2

source=("$pkgname-$pkgver.tar.gz::https://community.download.adacore.com/v1/$_hash?filename=$_extract_dir.tar.gz&rand=280")
sha1sums=("$_hash")

build()
{
    cd "$srcdir/$_extract_dir"

    # Make the Langkit Python package tree available for import.
    export PYTHONPATH="$srcdir/$_extract_dir"

    # Build the Langkit_Support library, used by all Langkit-generated libraries.
    python manage.py build-langkit-support \
        --library-types=relocatable        \
        --build-mode=prod                  \
        --gargs="-R"

    make -C doc html
}

package()
{
    cd "$srcdir/$_extract_dir"

    python setup.py install --root="$pkgdir"

    python manage.py install-langkit-support \
        --library-types=relocatable          \
        --build-mode=prod                    \
        "$pkgdir/usr"

    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"

    # Install the documentation.
    cd doc/_build/html
    
    for file in $(find . -type f); do
        install -m 644 -D ${file} "$pkgdir/usr/share/doc/$pkgname"/${file#source/}
    done
}
