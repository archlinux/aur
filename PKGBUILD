# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

# Peter1000: compile afterwards again x264-git circular dependencies

_srcname=ffmpeg
pkgname=${_srcname}-full-git_p
pkgver=2.7.dev.r3269.ge03cb1e
pkgrel=1
epoch=1
pkgdesc="Record, convert, and stream audio and video (nearly all codecs; git version)"
arch=('i686' 'x86_64')
url="http://ffmpeg.org/"
depends=('celt'
         'faac'
         'gnutls'
         'gsm'
         'jack'
         'lame'
         'libass'
         'libavc1394'
         'libbluray'
         'libcaca'
         'libcdio-paranoia'
         'libdc1394'
         'libfdk-aac-git_p'
         'libiec61883'
         'libmodplug'
#         'libnut-git' # does not build
         'libpulse'
#         'libquvi' # does not build
         'libsoxr-git_p'
         'libssh'
         'libtheora'
         'libva'
         'libvdpau'
         'libvpx-git_p'
         'libxv'
         'openal'
         'opencore-amr'
         'openjpeg'
         'opus'
         'rtmpdump'
         'schroedinger'
         'sdl'
         'speex'
         'twolame'
#         'libutvideo-git'    ffmpeg failed
         'v4l-utils'
         'vo-aacenc_p'
         'vo-amrwbenc_p'
         'libx264-git_p'
         'x265-hg_p'
         'xvidcore'
         'zeromq')
makedepends=('git' 'yasm' 'pkg-config')
conflicts=('ffmpeg' 'ffmpeg-git' 'ffmpeg-full' 'ffmpeg-libfdk_aac')
provides=('ffmpeg' 'ffmpeg-git' 'qt-faststart')
license=('GPL' 'custom:UNREDISTRIBUTABLE')
source=("${_srcname}::git://git.videolan.org/ffmpeg#branch=master"
        'UNREDISTRIBUTABLE.txt')
sha512sums=('SKIP'
            '06b853eff2d43fe437d09649229cd7f7466c0ecc75b324027d68b4fe365e9722a8033b15f4075c2ad4a845c61d21bbe551edfb0efb2e8e0e08d205ebc402164d')

pkgver() {
  cur_prefix='n'
  cd "${srcdir}/${_srcname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    git describe --long | sed 's/^'${cur_prefix}'//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure \
    --prefix=/usr \
    --enable-debug \
    --enable-shared \
    --disable-static \
    \
    --enable-gpl \
    --enable-nonfree \
    --enable-version3 \
    \
    --enable-pic \
    \
    --enable-avresample \
    --enable-bzlib \
    --enable-fontconfig \
    --enable-gnutls \
    --enable-libass \
    --enable-libbluray \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcelt \
    --enable-libdc1394 \
    --enable-libiec61883 \
    --enable-libfaac \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libgsm \
    --enable-libmp3lame \
    --enable-libmodplug \
    --enable-libopenjpeg \
    --enable-libopencore_amrnb \
    --enable-libopencore_amrwb \
    --enable-libopus \
    --enable-libpulse \
    --enable-librtmp \
    --enable-libschroedinger \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libtheora \
    --enable-libssh \
    --enable-libtwolame \
    --enable-libv4l2 \
    --enable-libvorbis \
    --enable-libvo-aacenc \
    --enable-libvo-amrwbenc \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --enable-libxvid \
    --enable-openal \
    --enable-openssl \
    --enable-vaapi \
    --enable-vda \
    --enable-vdpau \
    --enable-x11grab \
    --enable-libzmq \
    --enable-swresample \
    --enable-dxva2 \
    --enable-postproc \
    --enable-runtime-cpudetect

#    --enable-libnut \ # ./configure does not find libnut, tested with libnut-git
#    --enable-libquvi \ # ./configure does not find libquvi also tested with libquvi-git
#    --enable-libutvideo \ ffmpeg compile error: common.mak:60: recipe for target 'libavcodec/libutvideodec.o' failed

  msg "Starting make"
  make
  make tools/qt-faststart
  make doc
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="$pkgdir" install install-man
  install -D -m755 tools/qt-faststart "$pkgdir/usr/bin/qt-faststart"
  install -D -m644 "$srcdir/UNREDISTRIBUTABLE.txt" "$pkgdir/usr/share/licenses/${pkgname}/UNREDISTRIBUTABLE.txt"
}
