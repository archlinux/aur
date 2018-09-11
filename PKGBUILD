# Maintainer: Rod Kay <charlie5 on #ada at freenode.net>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgver=2018
pkgrel=2

pkgdesc="Libadalang-based tools: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang>=2018')
makedepends=("gprbuild>=2018")

source=('http://mirrors.cdn.adacore.com/art/5b0819dfc7a447df26c27a59'
        'workaround-gnat-bug.patch')
sha1sums=('034e5443a94336f6aca020c916ddf8f30598f8bf'
          '366bc80b768bbb15993b3e896c7aa28ee6f8b2da')

prepare()
{
    cd "$srcdir/libadalang-tools-src"
    patch -Np0 -i "$srcdir/workaround-gnat-bug.patch"
}

build() 
{
    cd "$srcdir/libadalang-tools-src"

    # In order to build the generated library, Langkit expects the QUEX_PATH to
    # be set.
    source /etc/profile.d/quex.sh

    make -j1 BUILD_MODE=prod LIBRARY_TYPE=relocatable
}

package()
{
    cd "$srcdir/libadalang-tools-src"

    mkdir -p "$pkgdir/usr/bin"
    for program in gnatpp gnatmetric gnatstub
    do
        install -m755 bin/$program "$pkgdir/usr/bin/"
    done
}
