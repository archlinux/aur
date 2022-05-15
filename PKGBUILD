# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=langkit
pkgver=20211103
_pkgver=22.0.0
pkgrel=3
pkgdesc='Compiler for syntactic and semantic language analysis libraries.'

url='https://github.com/AdaCore/langkit/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('gnatcoll-iconv' 'python')
makedepends=('gprbuild' 'texlive-bin' 'python-sphinx' 'python-e3-core' 'python-funcy' 'python-mako')

source=("https://github.com/AdaCore/langkit/archive/refs/tags/v22.0.0.tar.gz")
sha256sums=("45e9f389827f37eee107d4b7f6115fb4a7cf4d9dfc1214a68081db86d6c5ca74")

build()
{
    cd "$srcdir/$pkgname-$_pkgver"

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
    cd "$srcdir/$pkgname-$_pkgver"

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
