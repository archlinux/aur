# Maintainer: Dicebot <public@dicebot.lv>
pkgname=dstep
pkgver=0.1.0
pkgrel=2
pkgdesc="Automatic C header to D module translator"
arch=('i686' 'x86_64')
groups=('dlang')
url="https://github.com/jacob-carlborg/dstep"
license=('custom')
depends=('clang')
makedepends=('git' 'd-compiler' 'd-stdlib' 'dtools')
source=(
    "git+https://github.com/jacob-carlborg/dstep.git#tag=v$pkgver"
    "tango::git+https://github.com/SiegeLord/Tango-D2.git"
    "git+https://github.com/Dicebot/Arch-PKGBUILDs.git"
    "http://www.boost.org/LICENSE_1_0.txt"
)
sha1sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    '3cba29011be2b9d59f6204d6fa0a386b1b2dbd90'
)

build ()
{
    DMD=`$srcdir/Arch-PKGBUILDs/d-compiler.sh`

    cd $srcdir/tango
    make -f build/Makefile DC=$DMD ARCH=$CARCH COMPILER=$(basedir $DMD) 
    mv libtango-* libtango.a

    cd $srcdir/dstep
    git submodule update --init --recursive
    rdmd --compiler=$DMD --build-only -debug -gc -ofbin/dstep -Idstack/mambo -Idstack -I$srcdir/tango -L-L$srcdir/tango -I/usr/include/dlang -L-lclang -L-ltango dstep/driver/DStep.d
}

package ()
{
    mkdir -p $pkgdir/usr/bin
    install -m755 $srcdir/dstep/bin/dstep $pkgdir/usr/bin/dstep
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -m644 $srcdir/LICENSE_1_0.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
