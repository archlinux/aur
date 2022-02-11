# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=langkit
pkgver=20211103
pkgrel=2
pkgdesc='Compiler for syntactic and semantic language analysis libraries.'

url='https://github.com/AdaCore/langkit/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gnatcoll-iconv' 'python')
makedepends=('gprbuild' 'texlive-bin' 'python-sphinx' 'python-e3-core' 'python-funcy' 'python-mako')

source=("https://github.com/AdaCore/langkit/archive/refs/tags/v22.0.0.tar.gz")
sha1sums=("24ed555520e8789b6a0a828605e8d42eac9caf38")

build()
{
    cd "$srcdir/langkit-22.0.0"

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
    cd "$srcdir/langkit-22.0.0"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    python manage.py install-langkit-support          \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
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
    pushd doc/_build/html
    for file in $(find . -type f); do
        install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done
    popd
}
# vim: set et ts=4:
