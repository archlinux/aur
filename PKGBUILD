# Maintainer : nyanmisaka <nst799610810@gmail.com>

pkgname=jellyfin-ffmpeg5
pkgver=5.1.3
pkgrel=1
pkgdesc='FFmpeg5 for Jellyfin'
arch=('x86_64')
url='https://github.com/jellyfin/jellyfin-ffmpeg'
license=('GPL3')
depends=(
    'bzip2'
    'fontconfig'
    'fribidi'
    'gmp'
    'gnutls'
    'lame'
    'libass.so'
    'libbluray.so'
    'libchromaprint.so'
    'libdav1d.so'
    'libdrm'
    'libfreetype.so'
    'libmfx'
    'libopenmpt.so'
    'libplacebo.so'
    'libtheora'
    'libva.so'
    'libva-drm.so'
    'libvdpau'
    'libvorbisenc.so'
    'libvorbis.so'
    'libvpx.so'
    'libwebp'
    'libx11'
    'libx264.so'
    'libx265.so'
    'libxext'
    'libxml2'
    'libzimg.so'
    'ocl-icd'
    'opus'
    'shaderc'
    'srt'
    'vulkan-icd-loader'
    'xz'
    'zlib'
    'zvbi'
)
makedepends=('git' 'nasm' 'clang' 'ffnvcodec-headers' 'amf-headers' 'opencl-headers' 'vulkan-headers')
optdepends=('intel-media-driver: for Intel VAAPI support (Broadwell and newer)'
            'intel-media-sdk: for Intel Quick Sync Video'
            'onevpl-intel-gpu: for Intel Quick Sync Video (12th Gen and newer)'
            'intel-compute-runtime: for Intel OpenCL runtime based Tonemapping'
            'libva-intel-driver: for Intel legacy VAAPI support (10th Gen and older)'
            'libva-mesa-driver: for AMD VAAPI support'
            'nvidia-utils: for Nvidia NVDEC/NVENC support'
            'opencl-amd: for AMD OpenCL runtime based Tonemapping'
            'vulkan-radeon: for AMD RADV Vulkan support'
            'vulkan-intel: for Intel ANV Vulkan support')
conflicts=('jellyfin-ffmpeg')
source=("git+https://github.com/jellyfin/jellyfin-ffmpeg.git#tag=v${pkgver}-${pkgrel}")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}/jellyfin-ffmpeg
    git reset --hard v${pkgver}-${pkgrel} && git clean -qfdx
    cat debian/patches/*.patch | patch -Nsp1 -d .
}

build() {
    cd jellyfin-ffmpeg

    printf '%s\n' '  -> Running jellyfin-ffmpeg5 configure script...'

    ./configure \
        --prefix="/usr/lib/jellyfin-ffmpeg" \
        --target-os=linux \
        --extra-version=Jellyfin \
        --disable-doc \
        --disable-ffplay \
        --disable-ptx-compression \
        --disable-shared \
        --disable-libxcb \
        --disable-sdl2 \
        --disable-xlib \
        --enable-gpl \
        --enable-version3 \
        --enable-static \
        --enable-gmp \
        --enable-gnutls \
        --enable-chromaprint \
        --enable-libfontconfig \
        --enable-libass \
        --enable-libbluray \
        --enable-libdrm \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libmp3lame \
        --enable-libopus \
        --enable-libtheora \
        --enable-libvorbis \
        --enable-libdav1d \
        --enable-libwebp \
        --enable-libvpx \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libzvbi \
        --enable-libzimg \
        --enable-libshaderc \
        --enable-libplacebo \
        --enable-vulkan \
        --enable-opencl \
        --enable-vaapi \
        --enable-amf \
        --enable-libmfx \
        --enable-ffnvcodec \
        --enable-cuda \
        --enable-cuda-llvm \
        --enable-cuvid \
        --enable-nvdec \
        --enable-nvenc

    make -j$(nproc)
}

package() {
    install -Dm 755 jellyfin-ffmpeg/ffmpeg ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffmpeg
    install -Dm 755 jellyfin-ffmpeg/ffprobe ${pkgdir}/usr/lib/jellyfin-ffmpeg/ffprobe
}
