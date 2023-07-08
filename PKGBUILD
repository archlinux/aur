# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=langkit
pkgdesc='Compiler for syntactic and semantic language analysis libraries.'
pkgver=24.0w
pkgrel=1
epoch=1

url=https://github.com/AdaCore/langkit
arch=(i686 x86_64)
license=(Apache)

depends=(gnatcoll-iconv
         gnatcoll-gmp
         python
         python-e3-core
         adasat)

makedepends=(gprbuild
             texlive-bin
             python-sphinx
             python-e3-core
             python-funcy
             python-mako
             python-e3-core
             python-e3-testsuite
             python-pygments
             python-coverage 
             python-docutils
             python-pexpect
             python-ptyprocess
             python-pycodestyle
             python-railroad-diagrams)

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources/$pkgname-$pkgver-20230324-16391-src.tar.gz
        0001-Replace-calls-to-inspect.getargspec-with-getfullargs.patch)
        
sha256sums=(aea03ed51466fdca9bee32274a09a08cce645094da1cabea87a75829eb56491c
            dddf397b5a2de8b0bb45fb4d8cf49d6440911e92594cda8c1af1e045c348c547)


build()
{
    cd $srcdir/$pkgname-$pkgver-20230428-16136-src

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    # Build the Langkit_Support library, used by all Langkit-generated libraries.
    #
    python manage.py build-langkit-support            \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        --gargs="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

    python setup.py build
    make -C doc html
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20230428-16136-src

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    python manage.py install-langkit-support          \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        $pkgdir/usr

    # Install the license.
    #
    install -D -m644 \
       LICENSE.txt   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt

    # Install the documentation.
    #
    pushd doc/_build/html

    for file in $(find . -type f); do
        install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done

    popd
}