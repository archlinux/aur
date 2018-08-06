# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.3.14
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=("curl" "fftw" "libgl")
makedepends=("gimp" "git" "opencv" "openexr" "qt5-base")
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-gmic#tag=Natron-$pkgver"
        'git+https://github.com/NatronGitHub/openfx')
sha512sums=('SKIP'
            'SKIP')

# Checks whether the environment is 32-bit or 64-bit
if [ $CARCH == 'x86_64' ]
then
  _BITS=64
else
  _BITS=32
fi

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.openfx.url $srcdir/openfx
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release \
       BITS=$_BITS
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=$_BITS

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 $srcdir/$pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$pkgname/Licence_CeCILL-C_V1-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$pkgname/Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
