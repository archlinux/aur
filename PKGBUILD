# Maintainer: Rod Kay <rodakay5 at gmail dot com>

# Note: This package will not build correctly if it has already been installed.
#       Use 'sudo pacman -Rsc langkit' before building.

pkgname=langkit
pkgdesc='Compiler for syntactic and semantic language analysis libraries.'
pkgver=26.0w
pkgrel=1
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

source=(https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/langkit-26.0w-20250409-164FD-src.tar.gz
        https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2025/adasat-26.0w-20250407-164DB-src.tar.gz)
        
sha256sums=(1431a98951187465d660d5743089b514b7d58907244debf47e318859c392615e
            2a483826bb98c9350522280e6ae481e8ff4fb01f28f880d45628cc6fa6be9e0c)


prepare()
{
   cd $srcdir/langkit-26.0w-20250417-16252-src
   
   ln -s $srcdir/adasat-26.0w-20250416-164FF-src langkit/adasat
}



build()
{
    cd $srcdir/langkit-26.0w-20250417-16252-src

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"


    # Build the Langkit_Support library, used by all Langkit-generated libraries.
    #
    python manage.py build-langkit-support            \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        --gargs="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"


    python manage.py make --no-mypy --library-types=static,static-pic,relocatable

    python setup.py build
       
    # Building docs are currently broken.
    #
#    make -C doc html
}


package()
{
    cd $srcdir/langkit-26.0w-20250417-16252-src

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    python manage.py install-langkit-support          \
        --library-types=static,static-pic,relocatable \
        --build-mode=prod                             \
        $pkgdir/usr


    python -m langkit.scripts.lkm install                \
           -c lkt/langkit.yaml                           \
           $pkgdir/usr                                   \
           --library-types=static,static-pic,relocatable \
           --disable-all-mains


    mv $pkgdir/usr/python/liblktlang            \
       $pkgdir/usr/lib/python3.13/site-packages
       
    rm -fr $pkgdir/usr/python


    # Install the license.
    #
    install -D -m644 \
       LICENSE.txt   \
       $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt


    # Install the documentation.
    #
#    pushd doc/_build/html
#
#    for file in $(find . -type f); do
#        install -m 644 -D "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
#    done
#
#    popd
}