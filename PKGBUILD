# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
_upstream_ver=2021-20210519-19A69
pkgver=2021
pkgrel=1

pkgdesc="Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub"
url='https://github.com/AdaCore/libadalang-tools'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libadalang')
makedepends=('gprbuild')

_checksum=21b42a7e6ced5c227fa001eff9c9d39c75d3d58f
source=("${pkgname}-${_upstream_ver}-src.tar.gz::https://community.download.adacore.com/v1/${_checksum}?filename=${pkgname}-${_upstream_ver}-src.tar.gz"
        "pp-actions.adb-patch")
sha1sums=("$_checksum"
          "9f0aa925c1af47340dd4b2e86899ec1fb74dde92")

prepare()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    patch -Np0 -i ../pp-actions.adb-patch
}

build() 
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    gprbuild                       \
        -XBUILD_MODE=prod          \
        -XLIBRARY_TYPE=relocatable \
        -XXMLADA_BUILD=relocatable \
        -XLALTOOLS_SET=all         \
        -P src/build.gpr -p -j0    \
        -R -cargs $CFLAGS -largs $LDFLAGS
}

package()
{
    cd "$srcdir/$pkgname-$_upstream_ver-src"

    install -Dm755 -t "$pkgdir/usr/bin/" bin/{gnatpp,gnatmetric,gnatstub}
    
    # Install the license.
    install -D -m644 \
       "COPYING3"    \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"
}
