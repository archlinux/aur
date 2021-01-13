# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Kamran Mackey <kamranm1200@gmail.com>
# Contributor: richteer <richteer at lastprime.net>
# Contributor: DrZaius <lou at fakeoutdoorsman.com>

pkgname=ffmpeg-svt-vp9-git
pkgver=4.4.r100616.gca21cb1e36
pkgrel=1
pkgdesc='Complete solution to record, convert and stream audio and video (git version, SVT-VP9 patch applied)'
arch=('x86_64')
url='https://www.ffmpeg.org/'
license=('GPL3')
depends=(
    'alsa-lib'
    'aom'
    'bzip2'
    'fontconfig'
    'fribidi'
    'gmp'
    'gnutls'
    'gsm'
    'jack'
    'lame'
    'libass.so'
    'libavc1394'
    'libbluray.so'
    'libdav1d.so'
    'libdrm'
    'libfreetype.so'
    'libiec61883'
    'libmfx'
    'libmodplug'
    'libomxil-bellagio'
    'libpulse'
    'librav1e.so'
    'libraw1394'
    'libsoxr'
    'libssh'
    'libtheora'
    'libva.so'
    'libva-drm.so'
    'libva-x11.so'
    'libvdpau'
    'libvidstab.so'
    'libvorbisenc.so'
    'libvorbis.so'
    'libvpx.so'
    'libwebp'
    'libx11'
    'libx264.so'
    'libx265.so'
    'libxcb'
    'libxext'
    'libxml2'
    'libxv'
    'libxvidcore.so'
    'opencore-amr'
    'openjpeg2'
    'opus'
    'sdl2'
    'speex'
    'srt'
    'v4l-utils'
    'vmaf'
    'xz'
    'zlib'
	'svt-vp9'
)
makedepends=('git' 'avisynthplus' 'ffnvcodec-headers' 'ladspa' 'nasm')
optdepends=('avisynthplus: for reading AviSynth scripts as input'
            'intel-media-sdk: for Intel Quick Sync Video'
            'ladspa: for LADSPA filters'
            'nvidia-utils: Nvidia NVDEC/NVENC support')
provides=('libavcodec.so' 'libavdevice.so' 'libavfilter.so' 'libavformat.so'
          'libavutil.so' 'libpostproc.so' 'libswresample.so' 'libswscale.so'
          'ffmpeg')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        '010-ffmpeg-fix-vmaf-model-path.patch'
		'0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch::https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/master/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch')
sha256sums=('SKIP'
            '52778c70d9fe6e3a10941b99b96ac7749cec325dc1b9ee11ab75332b5ff68e50'
            'SKIP')

prepare() {
    patch -d ffmpeg -Np1 -i "${srcdir}/010-ffmpeg-fix-vmaf-model-path.patch"
	patch -d ffmpeg -Np1 -i "${srcdir}/0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
}

pkgver() {
    local _version
    local _revision
    local _shorthash
    _version="$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')"
    _revision="$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')"
    _shorthash="$(git -C ffmpeg rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd ffmpeg
    
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    ./configure \
        --prefix='/usr' \
        --disable-debug \
        --disable-static \
        --disable-stripping \
        --enable-avisynth \
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
        --enable-librav1e \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
		--enable-libsvtvp9 \
        --enable-libtheora \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
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
        --enable-version3
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
}
