# Maintainer: Mehmet Samet Duman <yongdohyun@projecttick.org>

pkgname=meshmc
pkgver=7.19.0
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances"
arch=(x86_64)
url='https://projecttick.org/p/meshmc'
license=('GPL-3.0-or-later AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  mesa-utils
  libarchive
  libgl
  pciutils
  qt6-base
  qt6-imageformats
  qt6-networkauth
  qt6-svg
  zlib-ng
  qrencode
  hicolor-icon-theme
  cmark
  libstdc++
  libgcc
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  jdk17-openjdk
  ninja
  scdoc
  vulkan-headers
)
optdepends=(
  'glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'orca: minecraft screen reader'
  'flite: minecraft voice narration'
  'java-runtime: use system java versions'
)
source=("https://ftp.projecttick.org/Project-Tick/meshmc/releases/download/meshmc-v$pkgver/meshmc-meshmc-v$pkgver.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/classparser/releases/download/classparser-v1.0.0/classparser-classparser-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/cmark/releases/download/cmark-v0.31.2/cmark-cmark-v0.31.2.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/ganalytics/releases/download/ganalytics-v1.0.0/ganalytics-ganalytics-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/iconfix/releases/download/iconfix-v1.0.0/iconfix-iconfix-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/javacheck/releases/download/javacheck-v1.0.0/javacheck-javacheck-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/javalauncher/releases/download/javalauncher-v1.0.0/javalauncher-javalauncher-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/libnbtplusplus/releases/download/libnbtplusplus-v3.2/libnbtplusplus-libnbtplusplus-v3.2.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/katabasis/releases/download/katabasis-v1.0.0/katabasis-katabasis-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/localpeer/releases/download/localpeer-v1.0.0/localpeer-localpeer-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/neozip/releases/download/neozip-v10.1.0/neozip-neozip-v10.1.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/optional-bare/releases/download/optional-bare-v1.0.0/optional-bare-optional-bare-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/rainbow/releases/download/rainbow-v1.0.0/rainbow-rainbow-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/systeminfo/releases/download/systeminfo-v1.0.0/systeminfo-systeminfo-v1.0.0.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/tomlplusplus/releases/download/tomlplusplus-v10.0.3/tomlplusplus-tomlplusplus-v10.0.3.tar.gz"
        "https://ftp.projecttick.org/Project-Tick/xz-embedded/releases/download/xzembedded-v1.0.0/xz-embedded-xzembedded-v1.0.0.tar.gz"
        {lionshead,batch,mdi}.license)
b2sums=('SKIP'
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
  'SKIP'
  'SKIP'
  'SKIP'
  'be4289832af95b1cd6e721dc16b84a034533de9718d9b43a49bd08dd6fe4e28eaa15228bfb311867b18fddbda1c9fc4c91f04c6d5c1a3bcc39aaa5161425e3ba'
  '356248a6b86f06d260e0920b49d34034f79f9bc504c7fdc1849d929d2ff9b169e693a8269a2c0b34656b3802970d9b8be41a92b35177eaa3c4ccc89a702f5c9d'
  'b35c447cd9223e096a2bb75e0741a7d0a3a1606af54c957e4f276f4e6861a9b3f06ae1d646137e8d2f24ba2238c9967c76eff8cc631a68d7e48e376056982cc6')

cmake_options_deps() {
    local _dep_source="$1"
    local _dep_build="$2"

    local cmake_config_options=(
        -D CMAKE_BUILD_TYPE=RelWithDebInfo
        -D CMAKE_INSTALL_PREFIX="${_faketarget}"
        -S "${_dep_source}"
        -B "${_dep_build}"
    )

    cmake "${cmake_config_options[@]}"

    cmake --build "${_dep_build}"
}

build() {

  local _faketarget="${srcdir}/fake-root"
  mkdir -p "${_faketarget}"

  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  local cmake_options_meshmc=(
    -B build
    -S "meshmc-meshmc-v$pkgver"
    -G Ninja
    -D CMAKE_CXX_FLAGS="-Wall -pedantic -Wno-deprecated-declarations -fstack-protector-strong --param=ssp-buffer-size=4 -O3"
    -D MeshMC_BUILD_PLATFORM=archlinux
    -D MeshMC_DISABLE_JAVA_DOWNLOADER=OFF
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_PREFIX_PATH="${_faketarget}"
  )


  cmake_options_deps "neozip-neozip-v10.1.0" "neozip-neozip-v10.1.0/build"
  cmake --install "neozip-neozip-v10.1.0/build"

  cmake_options_deps "cmark-cmark-v0.31.2" "cmark-cmark-v0.31.2/build"
  cmake --install "cmark-cmark-v0.31.2/build"

  cmake_options_deps "libnbtplusplus-libnbtplusplus-v3.2" "libnbtplusplus-libnbtplusplus-v3.2/build"
  cmake --install "libnbtplusplus-libnbtplusplus-v3.2/build"

  cmake_options_deps "optional-bare-optional-bare-v1.0.0" "optional-bare-optional-bare-v1.0.0/build"
  cmake --install "optional-bare-optional-bare-v1.0.0/build"

  cmake_options_deps "xz-embedded-xzembedded-v1.0.0" "xz-embedded-xzembedded-v1.0.0/build"
  cmake --install "xz-embedded-xzembedded-v1.0.0/build"

  cmake_options_deps "systeminfo-systeminfo-v1.0.0" "systeminfo-systeminfo-v1.0.0/build"
  cmake --install "systeminfo-systeminfo-v1.0.0/build"

  cmake_options_deps "ganalytics-ganalytics-v1.0.0" "ganalytics-ganalytics-v1.0.0/build"
  cmake --install "ganalytics-ganalytics-v1.0.0/build"

  cmake_options_deps "rainbow-rainbow-v1.0.0" "rainbow-rainbow-v1.0.0/build"
  cmake --install "rainbow-rainbow-v1.0.0/build"

  cmake_options_deps "iconfix-iconfix-v1.0.0" "iconfix-iconfix-v1.0.0/build"
  cmake --install "iconfix-iconfix-v1.0.0/build"

  cmake_options_deps "localpeer-localpeer-v1.0.0" "localpeer-localpeer-v1.0.0/build"
  cmake --install "localpeer-localpeer-v1.0.0/build"

  cmake_options_deps "classparser-classparser-v1.0.0" "classparser-classparser-v1.0.0/build"
  cmake --install "classparser-classparser-v1.0.0/build"

  cmake_options_deps "katabasis-katabasis-v1.0.0" "katabasis-katabasis-v1.0.0/build"
  cmake --install "katabasis-katabasis-v1.0.0/build"

  cmake_options_deps "javacheck-javacheck-v1.0.0" "javacheck-javacheck-v1.0.0/build"
  cmake --install "javacheck-javacheck-v1.0.0/build"

  cmake_options_deps "javalauncher-javalauncher-v1.0.0" "javalauncher-javalauncher-v1.0.0/build"
  cmake --install "javalauncher-javalauncher-v1.0.0/build"

  cmake "${cmake_options_meshmc[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/

  DESTDIR="$pkgdir" cmake --install build
}

# mnv:set ts=2 sw=2 et:
# vim:set ts=2 sw=2 et:
