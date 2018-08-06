# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.3.14
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=("GPL")
makedepends=("git" "openmp")
depends=("libgl")
optdepends=("natron-plugins")
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-misc#tag=Natron-$pkgver"
        "git+https://github.com/NatronGitHub/openfx"
        "git+https://github.com/NatronGitHub/openfx-supportext")
sha512sums=('SKIP'
            'SKIP'
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
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release \
       CXXFLAGS_ADD=-fopenmp \
       LDFLAGS_ADD=-fopenmp \
       BITS=$_BITS
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=$_BITS
}
