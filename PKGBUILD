# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=cef-minimal-obs-bin
_cefver="127.3.4"
_version=${_cefver//-/_}
_commit="a0ca18e"
_cefbranch="6533"
_chromiumver="127.0.${_cefbranch}.100"
_rebuild="6" # The tarball sometime can get rebuild by OBS Project
pkgver="${_version}+g${_commit}+chromium_${_chromiumver}_${_rebuild}"
pkgrel=1
epoch=2
pkgdesc="Chromium Embedded Framework minimal release needed by OBS Studio release in /opt/cef-obs"
arch=("x86_64" "aarch64")
url="https://github.com/tytan652/cef/tree/6533-fix-stutter-and-osr-extra-info"
license=(BSD-3-Clause)
depends=(
  "alsa-lib" "at-spi2-core" "cairo" "dbus" "expat" "gcc-libs" "glib2"
  "glibc" "libcups" "libdrm" "libx11" "libxcb" "libxcomposite"
  "libxdamage" "libxext" "libxfixes" "libxkbcommon" "libxrandr" "mesa"
  "nspr" "nss" "pango" "wayland"
)
makedepends=("cmake")
provides=("cef-minimal-obs=$pkgver")
conflicts=("cef-minimal-obs")
# Prevent people from using link time optimisation for this package because it make OBS unable to be built against it
options=('!lto' '!strip' 'debug')
source_x86_64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_x86_64_v6.tar.xz")
source_aarch64=("https://cdn-fastly.obsproject.com/downloads/cef_binary_6533_linux_aarch64_v6.tar.xz")
sha256sums_x86_64=("7963335519a19ccdc5233f7334c5ab023026e2f3e9a0cc417007c09d86608146")
sha256sums_aarch64=("642514469eaa29a5c887891084d2e73f7dc2d7405f7dfa7726b2dbc24b309999")

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
}

package() {
    mkdir -p "$pkgdir"/opt/cef-obs/
    cp -a "${srcdir}/cef_binary_${_cefbranch}_linux_${CARCH}"/* "$pkgdir"/opt/cef-obs
    rm -f "$pkgdir"/opt/cef-obs/LICENSE.txt
    rm -rf "$pkgdir"/opt/cef-obs/cmake
    install -Dm644 "${srcdir}/cef_binary_${_cefbranch}_linux_${CARCH}/LICENSE.txt" "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
