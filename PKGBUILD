# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_openfx_io_commit=a36e8a2
_openfx_commit=c70de42
_openfx_supportext_commit=9fa7ca1
_SequenceParsing_commit=6441ec7
_tinydir_commit=3aae922

pkgname=openfx-io
pkgver=2.3.15_pre4
pkgrel=1
arch=("i686" "pentium4" "x86_64")
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=("GPL")
depends=("ffmpeg" "libraw" "openimageio" "seexpr")
optdepends=("natron-plugins")
source=("openfx-io_$_openfx_io_commit.tar.gz::https://github.com/NatronGitHub/openfx-io/tarball/$_openfx_io_commit"
        "openfx_$_openfx_commit.tar.gz::https://github.com/NatronGitHub/openfx/tarball/$_openfx_commit"
        "openfx-supportext_$_openfx_supportext_commit.tar.gz::https://github.com/NatronGitHub/openfx-supportext/tarball/$_openfx_supportext_commit"
        "SequenceParsing_$_SequenceParsing_commit.tar.gz::https://github.com/NatronGitHub/SequenceParsing/tarball/$_SequenceParsing_commit"
        "tinydir_$_tinydir_commit.tar.gz::https://github.com/NatronGitHub/tinydir/tarball/$_tinydir_commit")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_pkgname="NatronGitHub-$pkgname-$_openfx_io_commit"

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
  tar -xzf "$srcdir/openfx-supportext_$_openfx_supportext_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/SupportExt/"

  tar -xzf "$srcdir/SequenceParsing_$_SequenceParsing_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/IOSupport/SequenceParsing/"
  tar -xzf "$srcdir/tinydir_$_tinydir_commit.tar.gz" --strip 1 \
      -C   "$srcdir/$_pkgname/IOSupport/SequenceParsing/tinydir/"
}

build() {
  cd "$srcdir/$_pkgname"
  make CONFIG=release \
       BITS=$_BITS
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               BITS=$_BITS
}
