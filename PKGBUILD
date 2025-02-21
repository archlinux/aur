# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vorbis-tools-git
pkgver=1.4.2.r0.g7168723
pkgrel=2
pkgdesc="Command-line tools for creating and playing Ogg Vorbis files"
arch=('i686' 'x86_64')
url="https://xiph.org/vorbis/"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'libao.so' 'libcurl.so' 'libFLAC.so' 'libvorbis.so' 'libvorbisenc.so' 'libvorbisfile.so')
makedepends=('git' 'curl' 'flac' 'libao' 'libvorbis')
provides=("vorbis-tools=$pkgver")
conflicts=('vorbis-tools')
source=("git+https://gitlab.xiph.org/xiph/vorbis-tools.git"
        "0001-include-utf8.h-for-utf8_decode.patch::https://github.com/xiph/vorbis-tools/pull/33/commits/8a645f78b45ae7e370c0dc2a52d0f2612aa6110b.patch")
sha256sums=('SKIP'
            'cd119e66d6ba91604bb18275f339a2e4467cf2e11756a29584a533b95bb60865')


prepare() {
  cd "vorbis-tools"

  patch -Np1 -i "$srcdir/0001-include-utf8.h-for-utf8_decode.patch"
}

pkgver() {
  cd "vorbis-tools"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "vorbis-tools"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "vorbis-tools"

  make DESTDIR="$pkgdir" install
}
