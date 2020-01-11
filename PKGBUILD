# Maintainer: Musee Ullah <lae@idolactiviti.es>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=ffmpeg-gl-transition
pkgver=4.2.2
pkgrel=1
epoch=1
pkgdesc='Complete solution to record, convert and stream audio and video, with support for GL-transitions video filters'
arch=(x86_64)
url=https://ffmpeg.org/
license=(GPL3)
depends=(
  alsa-lib
  aom
  bzip2
  fontconfig
  fribidi
  libglvnd
  glew
  glfw-x11
  gmp
  gnutls
  gsm
  intel-media-sdk
  jack
  lame
  libass.so
  libavc1394
  libbluray.so
  libdav1d.so
  libdrm
  libfreetype.so
  libiec61883
  libmodplug
  libomxil-bellagio
  libpulse
  libraw1394
  libsoxr
  libssh
  libtheora
  libva.so
  libva-drm.so
  libva-x11.so
  libvdpau
  libvidstab.so
  libvorbisenc.so
  libvorbis.so
  libvpx.so
  libwebp
  libx11
  libx264.so
  libx265.so
  libxcb
  libxext
  libxml2
  libxv
  libxvidcore.so
  mesa
  opencore-amr
  openjpeg2
  opus
  sdl2
  speex
  v4l-utils
  xz
  zlib
)
makedepends=(
  ffnvcodec-headers
  git
  ladspa
  nasm
)
optdepends=('ladspa: LADSPA filters')
provides=(
  libavcodec.so
  libavdevice.so
  libavfilter.so
  libavformat.so
  libavutil.so
  libpostproc.so
  libswresample.so
  libswscale.so
  ffmpeg
)
conflicts=(ffmpeg)
source=(git+https://git.ffmpeg.org/ffmpeg.git#tag=192d1d34eb3668fa27f433e96036340e1e5077a0
    https://raw.githubusercontent.com/transitive-bullshit/ffmpeg-gl-transition/master/vf_gltransition.c
    ffmpeg_vf_gltransition.patch)
sha256sums=(SKIP
    4d044f161913805236dbf5e78188bb5a17af10a43dbd3269d0284b12f78aee3e
    4853e888cb3fbda247e05faa591d45b640bdadf0115db3669ef08493258a0cb4)

pkgver() {
  cd ffmpeg

  git describe --tags | sed 's/^n//'
}

prepare() {
  cd ffmpeg

  git cherry-pick -n dc0806dd25882f41f6085c8356712f95fded56c7

  cp "${srcdir}/vf_gltransition.c" libavfilter/
  git apply "${srcdir}/ffmpeg_vf_gltransition.patch"
}

build() {
  cd ffmpeg

  export PKG_CONFIG_PATH=/opt/intel/mediasdk/lib/pkgconfig

  ./configure \
    --prefix=/usr \
    --disable-debug \
    --disable-static \
    --disable-stripping \
    --enable-fontconfig \
    --enable-gmp \
    --enable-gnutls \
    --enable-gpl \
    --enable-ladspa \
    --enable-libaom \
    --enable-libass \
    --enable-libbluray \
    --enable-libdav1d \
    --enable-libdrm \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libiec61883 \
    --enable-libjack \
    --enable-libmfx \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopenjpeg \
    --enable-libopus \
    --enable-libpulse \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libtheora \
    --enable-libv4l2 \
    --enable-libvidstab \
    --enable-libvorbis \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxcb \
    --enable-libxml2 \
    --enable-libxvid \
    --enable-nvdec \
    --enable-nvenc \
    --enable-omx \
    --enable-shared \
    --enable-version3 \
    --enable-opengl \
    --enable-filter=gltransition \
    --extra-libs="-lGLEW -lEGL"

  make
  make tools/qt-faststart
  make doc/ff{mpeg,play}.1
}

package() {
  make DESTDIR="${pkgdir}" -C ffmpeg install install-man
  install -Dm 755 ffmpeg/tools/qt-faststart "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
