# Maintainer: Echo J. <aidas957 at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2164

_pkgname=pcsx2
_git_base="https://github.com/PCSX2/${_pkgname}"
_patch_commit=fbd59c0711fc20db7e0d838e3460c7b962f7f93b # Latest commit on v2.4.0 tag release

declare -gA _ext_deps=(
   [plutovg]="1.1.0"
   [plutosvg]="0.0.7"
   [KDDockWidgets]="2.2.5"
)
_plutovg_ver="${_ext_deps[plutovg]}"
_plutosvg_ver="${_ext_deps[plutosvg]}"
_kddock_ver="${_ext_deps[KDDockWidgets]}"

pkgname=pcsx2-stable
pkgver=2.4.0
pkgrel=1
pkgdesc="PlayStation 2 emulator (latest stable tag)"
arch=('x86_64')
url="https://pcsx2.net"
license=('GPL-3.0-or-later')
depends=('curl' 'dbus' 'freetype2' 'hicolor-icon-theme' 'libbacktrace' 'libjpeg-turbo' 'libpcap'
         'libpng' 'libudev.so' 'libwebp' 'libxi' 'libxrandr' 'lz4' 'qt6-base' 'qt6-declarative'
         'sdl3' 'zlib' 'zstd')
makedepends=('cmake' 'ffmpeg' 'git' 'libx11' 'shaderc' 'wayland' 'vulkan-headers' 'zip')
makedepends+=('linux-api-headers') # Needed for V4L2 headers
optdepends=('libglvnd: OpenGL support'
            'shaderc: Vulkan support'
            'vulkan-icd-loader: Vulkan support'
            'ffmpeg: Game recording support'
            'gst-plugins-good: RetroAchievements sound playback'
            'alsa-utils: RetroAchievements sound playback (legacy)')
conflicts=('pcsx2' 'pcsx2-git' 'pcsx2-latest-bin')
source=("git+${_git_base}.git#tag=v${pkgver}"
        "git+${_git_base}_patches.git#commit=${_patch_commit}"
        "plutovg-${_plutovg_ver}.tar.gz::https://github.com/sammycage/plutovg/archive/v${_plutovg_ver}.tar.gz"
        "plutosvg-${_plutosvg_ver}.tar.gz::https://github.com/sammycage/plutosvg/archive/v${_plutosvg_ver}.tar.gz"
        "KDDockWidgets-${_kddock_ver}.tar.gz::https://github.com/KDAB/KDDockWidgets/releases/download/v${_kddock_ver}/kddockwidgets-${_kddock_ver}.tar.gz")
sha256sums=('2942c8b259796ea39ceb505bf87f31336818ad9546866c22575fafa019979e17'
            'f3095f1ee2dd42956aaa53807ec1ff1e00f9ff169f140d12115ae45274c29d88'
            '8aa9860519c407890668c29998e8bb88896ef6a2e6d7ce5ac1e57f18d79e1525'
            '78561b571ac224030cdc450ca2986b4de915c2ba7616004a6d71a379bffd15f3'
            '1c202d03a0c7018aebcb249b09122d846b34298d88d0bc247a601f48c7513c89')

prepare() {
   cd "${srcdir}/${_pkgname}"

   # Initialize SmallStringBase class in SmallStackString copy constructor (fixes a major warning)
   sed -i 's/SmallStackString(const SmallStackString\& copy)/SmallStackString(const SmallStackString\& copy) : SmallStringBase()/' \
      common/SmallString.h

   # Make the LTO check in a workaround more robust
   sed -i 's/CMAKE_INTERPROCEDURAL_OPTIMIZATION/CMAKE_CXX_FLAGS MATCHES "-flto"/' common/CMakeLists.txt

   # Don't set Devel build type if it's set to None
   sed -i 's@Debug|@None|Debug|@' cmake/BuildParameters.cmake
}

build() {
   ## The external library build mess ##

   export CMAKE_PREFIX_PATH="${srcdir}"/install-ext/usr

   for module in "${!_ext_deps[@]}"; do
      _build_dir="${srcdir}"/build-ext/"${module}"

      cmake -S "${srcdir}/${module}-${_ext_deps[$module]}" -B "${_build_dir}" \
         -D CMAKE_BUILD_TYPE=None \
         -D CMAKE_INSTALL_PREFIX=/usr \
         -D KDDockWidgets_NO_SPDLOG=ON \
         -D KDDockWidgets_QT6=ON \
         -D KDDockWidgets_STATIC=ON \
         -D KDDockWidgets_EXAMPLES=OFF \
         -D PLUTOVG_BUILD_EXAMPLES=OFF \
         -D PLUTOSVG_BUILD_EXAMPLES=OFF

      cmake --build "${_build_dir}"
      DESTDIR="${srcdir}"/install-ext cmake --install "${_build_dir}"
   done

   # Suppress always_inline/offsetof warnings (TODO: Maybe replace __forceinline uses instead?)
   export CXXFLAGS+=" -Wno-attributes -Wno-invalid-offsetof"

   cmake -S "${srcdir}/${_pkgname}" -B build \
      -D CMAKE_BUILD_TYPE=None \
      -D CMAKE_INSTALL_PREFIX=/usr \
      -D PACKAGE_MODE=ON \
      -D DISABLE_ADVANCE_SIMD=ON
   cmake --build build
}

check() {
   cmake --build build --target unittests
}

package() {
   _srcdir="${srcdir}/${_pkgname}"

   DESTDIR="${pkgdir}" cmake --install build

   # Compress the patch files
   zip -j "${pkgdir}"/usr/share/PCSX2/resources/patches.zip "${srcdir}"/pcsx2_patches/patches/*.pnach

   # Install desktop shortcut/icon
   install -Dm644 "${_srcdir}"/.github/workflows/scripts/linux/pcsx2-qt.desktop -t "${pkgdir}"/usr/share/applications
   install -Dm644 "${_srcdir}"/bin/resources/icons/AppIconLarge.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/PCSX2.png
}
