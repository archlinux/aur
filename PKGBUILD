# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=gnatcoll-core
epoch=2
pkgver=23.0.0
pkgrel=1

pkgdesc='Gnat components collection - Core packages.'
url='https://github.com/AdaCore/gnatcoll-core/'
arch=('i686' 'x86_64')
license=('GPL3' 'custom')

depends=('libgpr')
makedepends=('gprbuild' 'texlive-bin' 'python-sphinx' 'python-sphinx_rtd_theme' 'texlive-core' 'texlive-latexextra')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("a9e57bfaeaa24c23a738e1d60e0c3b775dc9845c9694c8271efca43381fee85f")

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    ADA_FLAGS="$CFLAGS"
    ADA_FLAGS="${ADA_FLAGS//-Wformat}"
    ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

    make setup BUILD=PROD prefix=/usr
    make -j1 GPRBUILD_OPTIONS="-R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
    make -C docs html latexpdf
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

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
