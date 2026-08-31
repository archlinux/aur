# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Lubosz Sarnecki < lubosz at gmail dot com >

pkgname=compressonator-git
pkgdesc='Tool suite for Texture and 3D Model Compression, Optimization and Analysis.'
pkgver=4.5.52.r21.gf4b53d79
pkgrel=1
url='https://github.com/GPUOpen-Tools/Compressonator'
arch=(x86_64)
license=('MIT')
makedepends=(
  'cmake'
  'git'
  'python'
  'vulkan-headers'
)
depends=(
  'opencv'
)
provides=('compressonator')
conflicts=('compressonator')
source=("git+${url}.git"
        'git+https://github.com/g-truc/glm.git'
        'git+https://github.com/discord/rapidxml.git'
        'git+https://github.com/ocornut/imgui.git'
        'glfw::git+https://github.com/glfw/glfw.git')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd Compressonator
  # shellcheck disable=SC2312 # will render pkgver invalid on fail
  git describe --long --tags | sed 's/^V//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Compressonator

  local sed_options=(
    # use sources fetched with makepkg
    -e 's,https://github.com/g-truc/glm(\.git)?,../glm,g'
    -e 's,https://github.com/discord/rapidxml(\.git)?,../rapidxml,g'
    -e 's,https://github.com/ocornut/imgui(\.git)?,../imgui,g'
    -e 's,https://github.com/glfw/glfw(\.git)?,../glfw,g'
    # sources not used for Linux build
    -e '/common_lib_ext_openexr/ d'
    -e '/download.savannah.nongnu.org/ d'
  )
  sed -E "${sed_options[@]}" -i build/fetch_dependencies.py
  python build/fetch_dependencies.py
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_INSTALL_SBINDIR=bin
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D BUILD_SHARED_LIBS=ON
    -D OPTION_ENABLE_ALL_APPS=OFF
    -D OPTION_BUILD_APPS_CMP_CLI=ON
  )
  export QT_DIR=/usr
  cmake -B build -S Compressonator "${cmake_options[@]}"
  cmake --build build
}

package() {
  install -vD -m644 build/bin/compressonatorcli-bin \
    -T "${pkgdir}/usr/bin/compressonatorcli"

  install -vD -m644 Compressonator/license/clilicense.txt \
    -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
