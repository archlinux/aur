# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
epoch=1
pkgver=2022
pkgrel=2

pkgdesc='Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('libgpr')
makedepends=('gprbuild' 'texlive-bin' 'python-sphinx' 'texlive-core' 'texlive-latexextra')

source=("https://github.com/AdaCore/gnatcoll-core/archive/refs/tags/v22.0.0.tar.gz")
sha1sums=("ae05bbff3cf066ae0c9fe41f9dd4d29cf8644724")

build()
{
    cd "$srcdir/gnatcoll-core-22.0.0"

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
    make -C docs html latexpdf
}

package()
{
    cd "$srcdir/gnatcoll-core-22.0.0"

    # Make one install at a time to avoid GPRinstall reading/writing to
    # the same installed project files at the same time.
    make -j1 prefix="$pkgdir/usr" install
    
    # Install the license.
    install -D -m644     \
       "COPYING3"        \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING3"

    # Install the custom license.
    install -D -m644     \
       "COPYING.RUNTIME" \
       "$pkgdir/usr/share/licenses/$pkgname/COPYING.RUNTIME"
}
