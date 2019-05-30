# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-io
pkgver=2.3.14
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=("GPL")
depends=("ffmpeg" "libraw" "openimageio" "seexpr")
makedepends=("git")
optdepends=("natron-plugins")
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-io#tag=Natron-$pkgver"
        'git+https://github.com/NatronGitHub/openfx'
        'git+https://github.com/NatronGitHub/SequenceParsing'
        'git+https://github.com/NatronGitHub/openfx-supportext'
        'git+https://github.com/NatronGitHub/tinydir'
        'fix-ocio-oiio-commit-7f24308.patch')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '9a9b268c8d9aa534f47a80d6f8c942bebd3d37f4650f84a1ee241a5477a9d10c922b843e5545b9b6b7f096c8aae9db935ff37ff72dc4350d2146a9450f8a1e40')

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
  git config submodule.IOSupport/SequenceParsing.url $srcdir/SequenceParsing
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update

  cd IOSupport/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update

  # Applying patch created with updates to commit 7f24308, 
  # which solve the problem of compiling with the latest version
  # of the OpenColorIO and OpenImageIO libraries.
  # Solution provided by @FirstAirBender.

  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/fix-ocio-oiio-commit-7f24308.patch"
}

build() {
  cd "$srcdir/$pkgname"
  make CONFIG=release \
       BITS=$_BITS
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=$_BITS
}
