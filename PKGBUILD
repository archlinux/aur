# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ffms2-git
pkgver=5.0.32.g3af2ef2
pkgrel=1
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access. (GIT version)"
url='https://github.com/FFMS/ffms2'
arch=('x86_64')
license=('GPL')
depends=('ffmpeg')
makedepends=(
  'git'
  'vapoursynth'
  'avisynthplus'
)
provides=(
  'ffms2'
  'libffms2.so'
  'vapoursynth-plugin-ffms2'
  'vapoursynth-plugin-ffms2-git'
)
conflicts=('ffms2')
optdepends=(
  'vapoursynth: Vapoursynth support'
  'avisynthplus: Avisynth support'
)
source=(
  'git+https://github.com/FFMS/ffms2.git'
  'esee.patch'
)
sha256sums=(
  'SKIP'    
  'c029749df77ba816b43ad06421f7dec9b0b5164984eee6d7984220e231a298c9'
)

pkgver() {
  cd ffms2
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd ffms2

  # use pkg-config for search Avisyhth/Vapoursynth
  rm -fr src/vapoursynth/{Vapoursynth,VSHelper}.h
  patch -p1 -i "${srcdir}/esee.patch"

  mkdir -p src/config
}

build() {
  cd ffms2
  autoreconf -vfi
  cd "${srcdir}/build"

  export CXXFLAGS="$CXXFLAGS $(pkg-config --cflags avisynth) -fpermissive"
  ../ffms2/configure \
    --prefix=/usr \
    --enable-shared=yes \
    --enable-static=no \
    --enable-avisynth

  make
}

package() {
  _plugindir=$(python3 -c "import vapoursynth; print(vapoursynth.get_plugin_dir())")
  make -C build DESTDIR="${pkgdir}" install
  install -d "${pkgdir}${_plugindir}"
  install -d "${pkgdir}/usr/lib/avisynth"
  ln -s /usr/lib/libffms2.so "${pkgdir}${_plugindir}"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/avisynth/"
  install -Dm644 ffms2/doc/ffms2-vapoursynth.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/ffms2/ffms2-vapoursynth.md"
  install -Dm644 ffms2/doc/ffms2-avisynth.md "${pkgdir}/usr/share/doc/avisynth/plugins/ffms2/ffms2-vapoursynth.md"
}