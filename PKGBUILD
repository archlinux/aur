# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

pkgname="opencomposite-git"
pkgver=r1232.cff07db
pkgrel=1
pkgdesc="Reimplementation of OpenVR, translating calls to OpenXR."
arch=("x86_64")
url="https://gitlab.com/znixian/OpenOVR"
license=("GPL-3.0-or-later")
depends=(
  "glibc"
  "gcc-libs"
  "vulkan-icd-loader"
  "libgl"
  "libx11"
)
makedepends=(
  "git"
  "cmake"
  "make"
  "vulkan-headers"
  "python"
)
provides=("opencomposite")
conflicts=("opencomposite")
source=(
  "${pkgname}::git+${url}.git#branch=openxr"
  "git+https://github.com/KhronosGroup/OpenXR-SDK.git"
  "git+https://github.com/g-truc/glm.git"
  "git+https://github.com/libunwind/libunwind.git"
  "openvrpaths.vrpath"
)
sha1sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
options=("!lto")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.libs/openxr-sdk.url "${srcdir}/OpenXR-SDK"
  git config submodule.libs/glm.url "${srcdir}/glm"
  git config submodule.libs/libunwind.url "${srcdir}/libunwind"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake \
    -B build \
    -S . \
    -DOC_BACKTRACE=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

package() {
  install -Dm644 \
    "${srcdir}/openvrpaths.vrpath" \
    "${pkgdir}/opt/opencomposite/openvrpaths.vrpath"
  install -Dm644 \
    /dev/null \
    "${pkgdir}/opt/opencomposite/bin/version.txt"
  install -Dm755 \
    "${srcdir}/${pkgname}/build/bin/linux64/vrclient.so" \
    "${pkgdir}/opt/opencomposite/bin/linux64/vrclient.so"
}
