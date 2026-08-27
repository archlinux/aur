# Maintainer:  yjun <jerrysteve1101 at gmail dot com>
# Maintainer: taotieren <admin@taotieren.com>
# based on the PKGBUILD of dsview
# Origin Contributor: Anatol Pomozov
# Origin Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Origin Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=pxview-git
pkgver=1.5.8.r210.d8fb12c
pkgrel=1
epoch=1
pkgdesc='GUI program for supporting various instruments from PXLogic, including logic analyzers, oscilloscopes, etc.'
arch=($CARCH)
url='https://github.com/PXLogic/PXView'
license=(GPL-3.0-or-later)
depends=(
  sh
  hicolor-icon-theme 
  glib2
  nettle 
  python 
  fftw
  libgcc
  libftdi
  libstdc++
  libusb
  libzip
  zlib 
  qt6-base
  qt6-multimedia
  qt6-websockets
)
makedepends=(
  boost
  boost-libs
  cmake
  ninja
  npm
  git
  librsvg
  nlohmann-json
  minizip
  qt6-svg
  qt6-tools
  pkgconf
  sdcc
  vulkan-headers
)
source=(
  "${pkgname}::git+${url}.git"
  "sigrok-firmware::git+https://github.com/sigrokproject/sigrok-firmware.git"
  "sigrok-firmware-fx2lafw::git+https://github.com/sigrokproject/sigrok-firmware-fx2lafw.git"
  "sigrok-util::git+https://github.com/sigrokproject/sigrok-util.git"
  "libsigrok::git+https://github.com/haikumuse/libsigrok.git#branch=pxview-fork"
  "libsigrokdecode::git+https://github.com/haikumuse/libsigrokdecode.git#branch=pxview-fork"
  "libusb::git+https://github.com/haikumuse/libusb.git#branch=event-abstraction-v4"
  "mimalloc::git+https://github.com/microsoft/mimalloc.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  px_version="$(grep -oP 'DS_VERSION_MAJOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'DS_VERSION_MINOR \K[0-9]+' CMakeLists.txt).$(grep -oP 'DS_VERSION_MICRO \K[0-9]+' CMakeLists.txt)"

  printf "%s.r%s.%s" "${px_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/
  git submodule init
  git config submodule.sigrok-firmware.url "$srcdir/sigrok-firmware"
  git config submodule.sigrok-firmware-fx2lafw.url "$srcdir/sigrok-firmware-fx2lafw"
  git config submodule.sigrok-util.url "$srcdir/sigrok-util"
  git config submodule.libsigrok.url "$srcdir/libsigrok"
  git config submodule.libsigrokdecode.url "$srcdir/libsigrokdecode"
  git config submodule.libusb.url "$srcdir/libusb"
  git config submodule.mimalloc.url "$srcdir/mimalloc"
  git -c protocol.file.allow=always submodule update

  sed -i 's#MODE="0666"#TAG+="uaccess"#' PXView/px.rules

  sed -i \
    -e 's|\(DESTINATION \${MAC_RES_PREFIX}share\)/libsigrokdecode|\1/PXView/libsigrokdecode|g' \
    -e 's|\(DESTINATION \)share/sigrok-firmware|\1share/PXView/sigrok-firmware|g' \
    CMake/install_packaging.cmake
  
  sed -i \
    -e 's|//if (dir.cd("\.\.) && dir.cd("share")&& dir.cd("PXView")  && dir.cd("libsigrokdecode") && dir.cd("decoders"))|if (dir.cd("..") && dir.cd("share")&& dir.cd("PXView")  && dir.cd("libsigrokdecode") && dir.cd("decoders"))|' \
    -e 's|if (dir.cd("\.\.) && dir.cd("share") && dir.cd("libsigrokdecode") && dir.cd("decoders"))|//if (dir.cd("..") && dir.cd("share") && dir.cd("libsigrokdecode") && dir.cd("decoders"))|' \
    PXView/pv/config/appconfig.cpp
}
 
build() {
  # npm 12 默认 allow-remote=none，会拒绝 lockfile 中 resolved 为完整 URL 的“远程”tarball（如 npmmirror 镜像），需显式放开
  export npm_config_allow_remote=all
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -B build \
    -G Ninja

  ninja -C build
  ninja -C build webui
}

check() {
  cd "${srcdir}"/${pkgname}/
  ctest --test-dir build --output-on-failure
}

package() {
  cd "${srcdir}"/${pkgname}/

  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: set sw=2 ts=2 et:
