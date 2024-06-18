# Maintainer: crimist <aur at crim dot ist>

pkgname=jellyfin-ffmpeg-libsvtav1
epoch=1
pkgver=6.0.1p7
pkgrel=2
pkgdesc='Jellyfin fork of ffmpeg, with software av1 encoding (libsvtav1)'
arch=('x86_64')
url='https://github.com/jellyfin/jellyfin-ffmpeg'
license=('GPL3')
conflicts=('jellyfin-ffmpeg')
depends=(
  'glibc'
  'alsa-lib'
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
  'onevpl'
  'opus'
  'shaderc'
  'srt'
  'vulkan-icd-loader'
  'xz'
  'zlib'
  'zvbi'
)
makedepends=(
  'git'
  'nasm'
  'clang'
  'ffnvcodec-headers'
  'amf-headers'
  'opencl-headers'
  'vulkan-headers'
)
optdepends=(
  'intel-media-driver: for Intel VAAPI support (Broadwell and newer)'
  'intel-media-sdk: for Intel Quick Sync Video'
  'onevpl-intel-gpu: for Intel Quick Sync Video (Alder Lake and newer)'
  'intel-compute-runtime: for Intel OpenCL runtime based tonemapping'
  'libva-intel-driver: for Intel legacy VAAPI support (Comet Lake and older)'
  'libva-mesa-driver: for AMD VAAPI support'
  'nvidia-utils: for Nvidia NVDEC/NVENC support'
  'opencl-amd: for AMD OpenCL runtime based Tonemapping'
  'vulkan-radeon: for AMD RADV Vulkan support'
  'vulkan-intel: for Intel ANV Vulkan support'
)
options=('!lto')
_commit='df454b6f2809ad53f80f2c88543fb3922b5dd503'
source=("$pkgname::git+$url#commit=$_commit"
         https://github.com/FFmpeg/FFmpeg/commit/06c2a2c4.patch
         https://github.com/FFmpeg/FFmpeg/commit/43b417d5.patch)
b2sums=('ed07080a4ed1217828a75d548b55bff2899a9029ef2ecb173fb5d712546a094cc18cafa926ba12c5fa6d97fe6616782f4fede8d12340717c01a9ad9917393f1b'
        '044b1c13336a3cec263c17aa6438cd7b8e19ce328e9c8127d3c6d9dcb8dcfacefde713e47b35217c06826f87d00954b5e0a722fb4ab744c625e3d210d418bd77'
        'c8dfbed01442b1173c94ee7f7c7bda59802e86359be7dfcf52e25a05f245deac1ed8f3ca8e43650bef033cbd44c3ac15d32c191d913227da497187fcbbefa954')

pkgver() {
  cd "$pkgname"

  # replace dash with 'p' für point release, to allow transition
  # like 6.0-6 -> 6.0.1-1
  git describe --tags | sed -e 's/^v//' -e 's/-/p/'
}

prepare() {
  cd "$pkgname"

  # apply jellyfin patches to ffmpeg
  for i in debian/patches/*.patch; do
    patch -p1 -i "$i"
  done

  # Fix build with newest nvidia
  patch -p1 -i ../06c2a2c4.patch
  patch -p1 -i ../43b417d5.patch
}

build() {
  cd "$pkgname"

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
    --enable-libopenmpt \
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
    --enable-libvpl \
    --enable-ffnvcodec \
    --enable-cuda \
    --enable-cuda-llvm \
    --enable-cuvid \
    --enable-nvdec \
    --enable-nvenc \
    --enable-libsvtav1

  make
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/lib/$pkgname" ff{mpeg,probe}
}
