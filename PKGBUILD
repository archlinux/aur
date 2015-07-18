# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_srcname=ffms2
pkgname=${_srcname}-git_p
pkgver=2.21.r11.g08838b2
pkgrel=1
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access (GIT version)"
url="https://github.com/FFMS/ffms2"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ffmpeg-full-git_p')
makedepends=('git')
provides=('ffms2' 'ffms2-git' 'vapoursynth-plugin-ffms2-git', 'libffms2.so')
conflicts=('ffms2' 'ffms2-git' 'vapoursynth-plugin-ffms2-git')
replaces=('ffmpegsource')
source=("${_srcname}::git+https://github.com/FFMS/ffms2")
sha256sums=('SKIP')

pkgver() {
  cur_prefix=''
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_srcname}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr --enable-shared=yes --enable-static=no --enable-avresample
  make
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/lib/vapoursynth"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/vapoursynth/libffms2.so"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
