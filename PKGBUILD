# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=openfx-io-git
pkgver=0
pkgrel=1
arch=('i386' 'x86_64')
pkgdesc='A set of Readers/Writers plugins written using the OpenFX standard.'
url='https://github.com/MrKepzie/openfx-io'
license=BSD
depends=('opencolorio' 'openexr' 'openimageio' 'ffmpeg' 'boost-libs')
makedepends=('boost')
provides=('openfx-io')
conflicts=('openfx-io')
source=(
  "openfx-io::git://github.com/MrKepzie/openfx-io.git"
  "devernay-openfx::git://github.com/devernay/openfx.git"  # A fork by devernay
  "SequenceParsing::git://github.com/MrKepzie/SequenceParsing.git"
  "tinydir::git://github.com/MrKepzie/tinydir.git"  # Required by SequenceParsing
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
_bits=64
[ "$CARCH" = 'i686' ] && _bits=32

pkgver() {
  cd "$srcdir/openfx-io"
  git log -1 --format="%cd" --date=short | tr -d -
}

prepare() {
  rm -Rf "${srcdir}/openfx-io/openfx" "${srcdir}/openfx-io/IOSupport/SequenceParsing" "${srcdir}/SequenceParsing/tinydir"
  ln -sf "${srcdir}/devernay-openfx" "${srcdir}/openfx-io/openfx"
  ln -sf "${srcdir}/tinydir" "${srcdir}/SequenceParsing/tinydir"
  ln -sf "${srcdir}/SequenceParsing" "${srcdir}/openfx-io/IOSupport/SequenceParsing"
}

build() {
  cd "${srcdir}/openfx-io"
  make BITS=$_bits DEBUGFLAG=-O3
}

package() {
  mkdir -p "${pkgdir}/usr/OFX/Plugins/io"
  cp -r -v "${srcdir}/openfx-io/IO/Linux-$_bits-release/IO.ofx.bundle" "${pkgdir}/usr/OFX/Plugins/io/"
}
