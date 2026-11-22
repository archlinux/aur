# Maintainer: TheFeelTrain <the@feeltra.in>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=ffms2-git
pkgver=5.0.32.g3af2ef2
pkgrel=3
pkgdesc="An FFmpeg/Libav based source library and Avisynth/Vapoursynth plugin for easy frame accurate access. (GIT version)"
url='https://github.com/FFMS/ffms2'
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('ffmpeg')
makedepends=(
  'avisynthplus'
  'git'
  'python'
)
optdepends=(
  'avisynthplus: AviSynth plugin'
  'vapoursynth: VapourSynth plugin'
)
provides=(
  'ffms2'
  'libffms2.so'
  'vapoursynth-plugin-ffms2'
  'vapoursynth-plugin-ffms2-git'
)
conflicts=('ffms2')
source=('git+https://github.com/FFMS/ffms2.git')
sha256sums=('SKIP')

pkgver() {
  cd ffms2
  git describe --long --tags | tr - .
}

prepare() {
  cd ffms2
  sed -i -E 's/^(VERSION_INFO=)"[^"]*"$/\1"5:0:0"/' configure.ac
  mkdir -p src/config
  autoreconf -fiv
}

build() {
  cd ffms2
  export CXXFLAGS="$CXXFLAGS $(pkg-config --cflags avisynth) -fpermissive"
  ./configure \
    --prefix=/usr \
    --enable-avisynth \
    --enable-shared \
    --disable-static
  make
}

package() {
  local _plugindir
  _plugindir="$(python3 -c "import sysconfig; print(sysconfig.get_paths()['purelib'])")/vapoursynth/plugins"

  make DESTDIR="${pkgdir}" -C ffms2 install

  install -dm 755 "${pkgdir}${_plugindir}"
  ln -s /usr/lib/libffms2.so "${pkgdir}${_plugindir}/"

  install -dm 755 "${pkgdir}/usr/lib/avisynth"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/avisynth/"

  install -Dm644 ffms2/doc/ffms2-vapoursynth.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/ffms2/ffms2-vapoursynth.md"
  install -Dm644 ffms2/doc/ffms2-avisynth.md "${pkgdir}/usr/share/doc/avisynth/plugins/ffms2/ffms2-avisynth.md"
}