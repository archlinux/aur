# Maintainer: Smoolak <smoolak@gmail.com>
# Based on the official Arch Linux obs-studio package (Christian Heusel, Jonathan Grotelüschen, DeepChirp).

pkgname=obs-studio-nvidia-browser
pkgver=33.0.1
pkgrel=1
pkgdesc="OBS Studio with GPU-rendered browser sources on the NVIDIA driver"
arch=('x86_64')
url="https://obsproject.com"
license=('GPL-2.0-only')
depends=(
  'alsa-lib' 'cef' 'curl' 'ffmpeg' 'fontconfig' 'freetype2' 'glib2'
  'glibc' 'hicolor-icon-theme' 'jack' 'jansson' 'libdatachannel' 'libdrm'
  'libajantv2' 'libfdk-aac' 'libgcc' 'libglvnd' 'libpipewire' 'libpulse'
  'librist' 'libstdc++'
  'libva' 'libvpl' 'libx11' 'libxcb' 'libxkbcommon' 'luajit' 'mbedtls3'
  'pciutils' 'python' 'qrcodegencpp-cmake' 'qt6-base' 'qt6-svg' 'rnnoise'
  'speexdsp' 'srt' 'systemd-libs' 'util-linux-libs' 'v4l-utils' 'wayland' 'x264'
  'zlib'
)
makedepends=(
  'asio' 'cmake' 'extra-cmake-modules' 'ffnvcodec-headers' 'git'
  'libvlc' 'mesa' 'nlohmann-json' 'simde' 'sndio' 'swig' 'uthash' 'websocketpp'
)
checkdepends=('cmocka')
optdepends=(
  'libva-intel-driver: hardware encoding for older Intel GPUs'
  'intel-media-driver: hardware encoding for recent Intel GPUs'
  'libva-mesa-driver: hardware encoding'
  'libvlc: VLC media sources'
  'sndio: Sndio input client'
  'v4l2loopback-dkms: virtual camera support'
  'xdg-desktop-portal-impl: Wayland window/screen capture'
)
provides=("obs-studio=$pkgver" "obs-studio-plugin-browser=$pkgver")
conflicts=('obs-studio' 'obs-studio-plugin-browser')
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio#tag=$pkgver"
  "obs-studio-libdshowcapture::git+https://github.com/obsproject/libdshowcapture.git"
  "obs-studio-obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-studio-obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
  "obs-browser-nvidia-gpu-rendering.patch"
  "obs-unit-tests.patch"
)
sha256sums=('146e64de76ee79a8bc9155a7eb33886ab7b9b3a3de0f275a7ba3ff75ceb2ac74'
            'SKIP'
            'SKIP'
            'SKIP'
            'd120b6a9b42a89170f6c784f03725f7f0565892de3b3087c3b164f7436123795'
            '7368dc7adf4aaee5bb4c24b630f1b2b85b583e0b802c9281cc6676fd5cf963e8')

prepare() {
  cd obs-studio

  git submodule init

  git config submodule."plugins/obs-browser".url "${srcdir}/obs-studio-obs-browser"
  git config submodule."plugins/obs-websocket".url "${srcdir}/obs-studio-obs-websocket"
  git config submodule."plugins/win-dshow/libdshowcapture".url "${srcdir}/obs-studio-libdshowcapture"

  git -c protocol.file.allow=always submodule update --init --recursive

  # NVIDIA driver: render browser sources on the GPU instead of falling back to CPU rendering
  patch -d plugins/obs-browser -Np1 -i "${srcdir}/obs-browser-nvidia-gpu-rendering.patch"
  # The existing CMocka suites are not connected to the current top-level build.
  patch -Np1 -i "${srcdir}/obs-unit-tests.patch"

  # use FindCEF provided by system CEF
  rm cmake/finders/FindCEF.cmake

  # set rpath to /usr/lib/cef for obs-browser plugin
  sed -e 's|INSTALL_RPATH ".*"|INSTALL_RPATH "/usr/lib/cef/"|' -i plugins/obs-browser/cmake/os-linux.cmake
}

build() {
  local _cef_api_version=$(grep -oP 'CEF_API_VERSION_LAST CEF_API_VERSION\_\K[0-9]+' /usr/include/cef/include/cef_api_versions.h)
  echo Setting CEF_API_VERSION to $_cef_api_version

  local cmake_options=(
    -B build
    -S obs-studio
    -DCMAKE_INSTALL_PREFIX="/usr"
    -DCMAKE_COMPILE_WARNING_AS_ERROR=OFF
    -DBUILD_TESTING=OFF
    # mbedtls 4 not supported yet
    # https://github.com/obsproject/obs-studio/issues/13601
    -DMbedTLS_DIR="/usr/lib/mbedtls3/cmake/MbedTLS"
    -DENABLE_BROWSER=ON
    -DCEF_API_VERSION=$_cef_api_version
    -DENABLE_VST=ON
    -DENABLE_VLC=ON
    -DENABLE_NEW_MPEGTS_OUTPUT=ON
    -DENABLE_AJA=ON
    -DENABLE_JACK=ON
    -DENABLE_LIBFDK=ON
    -DENABLE_WEBRTC=ON
    -DOBS_VERSION_OVERRIDE="$pkgver"
    -DENABLE_WEBSOCKET=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  # Run upstream's serializer, array, bitstream and path suites against libobs.
  # Browser rendering is checked separately with the installed package and a GPU.
  cmake -B build -S obs-studio -DBUILD_TESTING=ON
  cmake --build build --target test_serializer test_darray test_bitstream test_os_path
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
