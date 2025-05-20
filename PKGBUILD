# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=langkit
pkgdesc='Compiler for syntactic and semantic language analysis libraries.'
pkgver=25.0w
pkgrel=2
epoch=1

url=https://github.com/AdaCore/langkit
arch=(i686 x86_64)
license=(Apache)

depends=(gnatcoll-iconv
         gnatcoll-gmp
         python
         adasat
         prettier-ada)

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

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/main/gnatstudio-sources-2024/$pkgname-$pkgver-20240411-1627B-src.tar.gz
        0001-Replace-calls-to-inspect.getargspec-with-getfullargs.patch
        rid_pipes_import.patch
        rid_pipes_import_2.patch
        rid_pipes_import_3.patch)
        
sha256sums=(175a54d50c427198e5e2f2644907f952d17e99fe17846a22c594b1ec81ce46e3
            dddf397b5a2de8b0bb45fb4d8cf49d6440911e92594cda8c1af1e045c348c547
            45fa992c40577a9f523ec9427faf9f6021cd391fdb42dcf701e096355923cb04
            3b24fde60aa485c1bf90645f0285c323070df3864ab7a29191379f0ae87d3ea4
            513fe19703c01f16e62ef0dd1574f1845decaeb9f868b58583be6b0bf8606430)


build()
{
    cd $srcdir/$pkgname-$pkgver-20240506-161EA-src

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    patch -Np0 -i $srcdir/rid_pipes_import.patch
    patch -Np0 -i $srcdir/rid_pipes_import_2.patch
    patch -Np0 -i $srcdir/rid_pipes_import_3.patch

    # Build the Langkit_Support library, used by all Langkit-generated libraries.
    #
    python manage.py build-langkit-support            \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        --gargs="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"

    python setup.py build
    #make -C doc html
}


package()
{
    cd $srcdir/$pkgname-$pkgver-20240506-161EA-src

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