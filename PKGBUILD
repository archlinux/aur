# Maintainer: Good Vibes <good_vibes@fastmail.com>
pkgname=anyps5-git
pkgver=0.1.1.r4590.g1e8fff68c
pkgrel=1
pkgdesc='Tool for porting PS5 executables to Linux and Windows (Git version)'
arch=('x86_64')
url='https://github.com/boykopovar/AnyPS5'
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'libx11' 'libxext' 'libxcursor' 'libxi' 'libxfixes' 'libxrandr' 'libxss'
         'alsa-lib' 'libpulse' 'systemd-libs' 'dbus' 'vulkan-icd-loader')
makedepends=('git' 'cmake' 'ninja' 'python')
optdepends=('vulkan-driver: Vulkan GPU driver for running converted applications')
provides=('anyps5')
conflicts=('anyps5')
options=('!strip' '!debug' '!lto')
source=('README.md'
        '9ac4cfd195f1-ffmpeg-linux-x64.zip::https://github.com/KytyPS5/ext-ffmpeg-core/releases/download/9ac4cfd195f1/ffmpeg-linux-x64.zip'
        'AnyPS5::git+https://github.com/boykopovar/AnyPS5.git#branch=main'
        'SDL2::git+https://github.com/libsdl-org/SDL.git'
        'Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
        'SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git'
        'SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git'
        'glslang::git+https://github.com/KhronosGroup/glslang.git'
        'VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git'
        'LibAtrac9::git+https://github.com/shadps4-emu/ext-LibAtrac9.git'
        'ffmpeg-core::git+https://github.com/KytyPS5/ext-ffmpeg-core.git'
        'freetype::git+https://github.com/freetype/freetype.git'
        'stb::git+https://github.com/nothings/stb.git'
        'libjpeg-turbo::git+https://github.com/libjpeg-turbo/libjpeg-turbo.git'
)
noextract=('9ac4cfd195f1-ffmpeg-linux-x64.zip')
sha256sums=('f84d1fbac69e1e252dc30e90227b2d9c3cc3e99a2e2f81e493d9a9829cd96126'
            'f4659ad09e6f2b99ecf0227ca56fe4bbb34572cdd8d85ff85384f74ba38f23ef'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
)

pkgver() {
  cd AnyPS5
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p ffmpeg-prebuilt
  bsdtar -xf "$srcdir/9ac4cfd195f1-ffmpeg-linux-x64.zip" -C ffmpeg-prebuilt
  cd AnyPS5
  git config submodule.3rdparty/SDL2.url "$srcdir/SDL2"
  git config submodule.3rdparty/Vulkan-Headers.url "$srcdir/Vulkan-Headers"
  git config submodule.3rdparty/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
  git config submodule.3rdparty/SPIRV-Tools.url "$srcdir/SPIRV-Tools"
  git config submodule.3rdparty/glslang.url "$srcdir/glslang"
  git config submodule.3rdparty/VulkanMemoryAllocator.url "$srcdir/VulkanMemoryAllocator"
  git config submodule.3rdparty/LibAtrac9.url "$srcdir/LibAtrac9"
  git config submodule.3rdparty/ffmpeg-core.url "$srcdir/ffmpeg-core"
  git config submodule.3rdparty/freetype.url "$srcdir/freetype"
  git config submodule.3rdparty/stb.url "$srcdir/stb"
  git config submodule.3rdparty/libjpeg-turbo.url "$srcdir/libjpeg-turbo"
  git -c protocol.file.allow=always submodule update --init -- \
    3rdparty/{SDL2,Vulkan-Headers,SPIRV-Headers,SPIRV-Tools,glslang,VulkanMemoryAllocator,LibAtrac9,ffmpeg-core,freetype,stb,libjpeg-turbo}
}

build() {
  cmake -S AnyPS5 -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DFFMPEG_PREBUILT_DIR="$srcdir/ffmpeg-prebuilt" \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DSDL_JACK=OFF \
    -DSDL_PIPEWIRE=OFF \
    -DSDL_SNDIO=OFF \
    -DSDL_LIBSAMPLERATE=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build --target relinker libs
}

check() {
  local test
  for test in optional_plt empty_tls tls_function_coverage linux_load_alignment windows_gui; do
    python "AnyPS5/core/relinker/relinker/tests/test_${test}.py" \
      "$srcdir/build/core/relinker/relinker"
  done
}

package() {
  install -Dm755 build/core/relinker/relinker "$pkgdir/usr/bin/relinker"
  install -dm755 "$pkgdir/usr/lib/anyps5"
  install -m755 build/core/libs/libs/*.prx "$pkgdir/usr/lib/anyps5/"
  install -Dm644 ffmpeg-prebuilt/share/ffmpeg/copyright "$pkgdir/usr/share/licenses/$pkgname/ffmpeg/copyright"
  install -Dm644 ffmpeg-prebuilt/share/ffmpeg/SOURCE.txt "$pkgdir/usr/share/licenses/$pkgname/ffmpeg/SOURCE.txt"
  install -Dm644 AnyPS5/README.md "$pkgdir/usr/share/doc/anyps5/README.upstream.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/anyps5/README.md"
}
