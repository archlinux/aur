pkgname=('libx264-142')
pkgdesc='Library for encoding H264/AVC video streams (older version)'
pkgver=142.20140826
pkgrel=1
epoch=1
arch=('i686' 'x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('glibc')
makedepends=('yasm' 'git' 'ffmpeg-compat-54')
provides=('libx264.so.142')
source=(git+https://code.videolan.org/videolan/x264.git#commit=021c0dc6c95c x264.diff configure.diff)
md5sums=('SKIP' d1eb9bb90d4b89aab82d5e1c70161bbd 2039c9c910d4a667cb881e15aebb739f)

pkgver() {
  cd "${srcdir}"/x264
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

build() {
  cd "${srcdir}"
  patch -p1 < ../x264.diff
  patch -p1 < ../configure.diff
  cd "${srcdir}"/x264
  ./configure --prefix=/usr \
    --enable-shared --enable-pic
  make
}

package() {

  cd "${srcdir}"/x264
  install -d "$pkgdir"/usr/lib
  install -Dm755 "./libx264.so.142" "${pkgdir}/usr/lib/libx264.so.142"
}

