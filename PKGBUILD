# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_openfx_gmic_commit=c3933ea
_openfx_commit=c70de42

pkgname=openfx-gmic
pkgver=2.3.15_pre4
pkgrel=1
arch=("i686" "pentium4" "x86_64")
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=("curl" "fftw" "libgl" "libpng")
makedepends=("gimp" "opencv" "openexr" "qt5-base")
source=("openfx_$_openfx_gmic_commit.tar.gz::https://github.com/NatronGitHub/openfx-gmic/tarball/$_openfx_gmic_commit"
        "openfx_$_openfx_commit.tar.gz::https://github.com/NatronGitHub/openfx/tarball/$_openfx_commit")
sha512sums=('SKIP'
            'SKIP')

_pkgname="NatronGitHub-$pkgname-$_openfx_gmic_commit"

# Checks whether the environment is 32-bit or 64-bit
if [ $CARCH == 'x86_64' ]
then
  _BITS=64
else
  _BITS=32
fi

prepare() {
  tar -xzf "$srcdir/openfx_$_openfx_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/openfx/"
}

build() {
  cd "$srcdir/$_pkgname"
  make CONFIG=release \
       BITS=$_BITS
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=$_BITS

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 $srcdir/$_pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$_pkgname/Licence_CeCILL-C_V1-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$_pkgname/Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
