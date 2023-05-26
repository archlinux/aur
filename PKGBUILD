# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=cef-minimal-obs-bin
_cefver="103.0.0-5060-shared-textures_143.2591"
_version=${_cefver//-/_}
_commit="4204d54"
_cefbranch="5060"
_chromiumver="103.0.${_cefbranch}.134"
_rebuild="1" # The tarball sometime can get rebuild by OBS Project
pkgver="${_version}+g${_commit}+chromium_${_chromiumver}_${_rebuild}"
pkgrel=5
pkgdesc="Chromium Embedded Framework minimal release needed by OBS Studio release in /opt/cef-obs"
arch=("x86_64" "aarch64")
url="https://github.com/obsproject/cef/tree/5060-shared-textures"
license=("BSD")
depends=(
  "alsa-lib" "at-spi2-core" "dbus" "expat" "gcc-libs" "glib2"
  "glibc" "libcups" "libdrm" "libx11" "libxcb" "libxcomposite"
  "libxdamage" "libxext" "libxfixes" "libxkbcommon" "libxrandr" "mesa"
  "nspr" "nss" "wayland"
)
makedepends=("cmake")
provides=("cef-minimal-obs=$pkgver")
conflicts=("cef-minimal-obs")
# Prevent people from using link time optimisation for this package because it make OBS unable to be built against it
options=('!lto' '!strip' 'debug')
source_x86_64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cefbranch}_linux_x86_64.tar.xz")
source_aarch64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_${_cefbranch}_linux_aarch64.tar.xz")
sha256sums_x86_64=("bf4aa9388bab7e94fa945cc3bba16b6da63b6a30f9c0342d42235468b39d84bf")
sha256sums_aarch64=("68d915c9ba2639cba762a54cd3430fce2527aa6355d831d3cfcb6157664206b0")

prepare() {
  cd "${srcdir}/cef_binary_${_cefbranch}_linux_${CARCH}"

  # Fix directories permissions
  chmod 755 Release
  chmod 755 Resources
  chmod 755 Resources/locales
  chmod 755 include
  chmod 755 include/base
  chmod 755 include/base/internal
  chmod 755 include/capi
  chmod 755 include/capi/test
  chmod 755 include/capi/views
  chmod 755 include/internal
  chmod 755 include/test
  chmod 755 include/views
  chmod 755 include/wrapper
  chmod 755 libcef_dll
  chmod 755 libcef_dll/base
  chmod 755 libcef_dll/cpptoc
  chmod 755 libcef_dll/cpptoc/test
  chmod 755 libcef_dll/cpptoc/views
  chmod 755 libcef_dll/ctocpp
  chmod 755 libcef_dll/ctocpp/test
  chmod 755 libcef_dll/ctocpp/views
  chmod 755 libcef_dll/wrapper

  # Remove pre-built wrapper
  rm -rf build
}

build() {
  cd "${srcdir}/cef_binary_${_cefbranch}_linux_${CARCH}"

  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DPROJECT_ARCH=$CARCH .

  make libcef_dll_wrapper

  # Remove unneeded files
  rm -f CMakeLists.txt CMakeCache.txt Makefile cmake_install.cmake README.txt libcef_dll/CMakeLists.txt
  rm -rf CMakeFiles
    
  cd libcef_dll_wrapper
  rm -f Makefile cmake_install.cmake
  rm -rf CMakeFiles
}

package() {
    mkdir -p "$pkgdir"/opt/cef-obs/
    cp -a "${srcdir}/cef_binary_${_cefbranch}_linux_${CARCH}"/* "$pkgdir"/opt/cef-obs
    rm -f "$pkgdir"/opt/cef-obs/LICENSE.txt
    rm -rf "$pkgdir"/opt/cef-obs/cmake
    install -Dm644 "${srcdir}/cef_binary_${_cefbranch}_linux_${CARCH}/LICENSE.txt" "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
