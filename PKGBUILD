# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.3.13
pkgrel=1
arch=("x86_64")
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=("curl" "fftw" "libgl")
makedepends=("gimp" "git" "opencv" "openexr" "qt5-base")
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-gmic#tag=Natron-$pkgver"
        'git+https://github.com/NatronGitHub/openfx')
sha512sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.openfx.url $srcdir/openfx
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release \
       BITS=64
}

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=64

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 $srcdir/$pkgname/COPYING "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$pkgname/Licence_CeCILL-C_V1-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 $srcdir/$pkgname/Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
