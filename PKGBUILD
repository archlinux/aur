# Maintainer: xi-ve <zunavs@gmail.com>
pkgname=openvr-space-calibrator-linux
pkgver=1.5.1
pkgrel=2
pkgdesc="Linux port of OpenVR-SpaceCalibrator - synchronize multiple VR playspaces in SteamVR. Requires SteamVR to be installed (provides OpenVR headers)."
arch=('x86_64')
url="https://github.com/xi-ve/openvr-space-calibrator-linux"
license=('MIT')
install="${pkgname}.install"
depends=('glfw-x11' 'mesa' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi')
makedepends=('cmake' 'base-devel' 'eigen' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xi-ve/openvr-space-calibrator-linux/archive/main.tar.gz"
        "openvr-headers.tar.gz::https://github.com/ValveSoftware/openvr/archive/master.tar.gz"
        "imgui.tar.gz::https://github.com/ocornut/imgui/archive/refs/heads/master.tar.gz"
        "eigen.tar.gz::https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-main"
  
  if [ -d "build" ]; then
    rm -rf build
  fi
  
  if [ ! -d "../lib/openvr/headers" ]; then
    echo "Extracting OpenVR headers..."
    mkdir -p ../lib/openvr
    tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr --strip-components=1 openvr-master/headers 2>/dev/null || true
  fi
  
  if [ ! -d "../WindowsEdition/OpenVR-SpaceCalibrator/lib/imgui" ]; then
    echo "Extracting ImGui..."
    mkdir -p ../WindowsEdition/OpenVR-SpaceCalibrator/lib
    if [ -d "${srcdir}/imgui-master" ]; then
      mv "${srcdir}/imgui-master" ../WindowsEdition/OpenVR-SpaceCalibrator/lib/imgui
    else
      tar -xzf "${srcdir}/imgui.tar.gz" -C ../WindowsEdition/OpenVR-SpaceCalibrator/lib --strip-components=1 imgui-master 2>/dev/null || \
      tar -xzf "${srcdir}/imgui.tar.gz" -C ../WindowsEdition/OpenVR-SpaceCalibrator/lib --strip-components=0 2>/dev/null && \
      mv ../WindowsEdition/OpenVR-SpaceCalibrator/lib/imgui-master ../WindowsEdition/OpenVR-SpaceCalibrator/lib/imgui 2>/dev/null || true
    fi
  fi
  
  if [ ! -d "../WindowsEdition/OpenVR-SpaceCalibrator/lib/Eigen" ]; then
    echo "Extracting Eigen..."
    mkdir -p ../WindowsEdition/OpenVR-SpaceCalibrator/lib
    if [ -d "${srcdir}/eigen-3.4.0" ]; then
      mv "${srcdir}/eigen-3.4.0/Eigen" ../WindowsEdition/OpenVR-SpaceCalibrator/lib/Eigen
    else
      tar -xzf "${srcdir}/eigen.tar.gz" -C ../WindowsEdition/OpenVR-SpaceCalibrator/lib --strip-components=1 eigen-3.4.0/Eigen 2>/dev/null || \
      tar -xzf "${srcdir}/eigen.tar.gz" -C ../WindowsEdition/OpenVR-SpaceCalibrator/lib --strip-components=0 2>/dev/null && \
      mv ../WindowsEdition/OpenVR-SpaceCalibrator/lib/eigen-3.4.0/Eigen ../WindowsEdition/OpenVR-SpaceCalibrator/lib/Eigen 2>/dev/null || true
    fi
  fi
}

build() {
  cd "${srcdir}/${pkgname}-main"
  
  export CFLAGS="${CFLAGS//-ffile-prefix-map=* /} -Wno-format-security"
  export CXXFLAGS="${CXXFLAGS//-ffile-prefix-map=* /} -Wno-format-security"
  
  mkdir -p build
  cd build
  
  OPENVR_HEADERS=""
  PROJECT_ROOT="${srcdir}/${pkgname}-main"
  
  for path in \
    "${PROJECT_ROOT}/../lib/openvr/headers" \
    "${PROJECT_ROOT}/../lib/openvr" \
    "${PROJECT_ROOT}/../WindowsEdition/OpenVR-SpaceCalibrator/lib/openvr/headers" \
    "${HOME}/.local/share/Steam/steamapps/common/SteamVR/headers" \
    "${HOME}/.steam/steam/steamapps/common/SteamVR/headers" \
    "${HOME}/.steam/root/steamapps/common/SteamVR/headers" \
    "/usr/include/openvr" \
    "/usr/local/include/openvr"; do
    if [ -n "$path" ] && [ -f "$path/openvr.h" ] 2>/dev/null; then
      OPENVR_HEADERS="$path"
      break
    fi
  done
  
  CMAKE_ARGS=""
  if [ -n "$OPENVR_HEADERS" ]; then
    echo "Using OpenVR headers from: $OPENVR_HEADERS"
    CMAKE_ARGS="-DOPENVR_INCLUDE_DIR=\"$OPENVR_HEADERS\""
  else
    echo "OpenVR headers not found in standard locations."
    echo "CMake will attempt to find them using its own detection logic."
  fi
  
  eval "cmake .. $CMAKE_ARGS"
  
  make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}-main"
  
  # Install space-calibrator binary to /usr/bin
  install -Dm755 build/bin/space-calibrator "${pkgdir}/usr/bin/space-calibrator"
  
  # Install driver files to /usr/lib/openvr-space-calibrator-linux (as expected by install script)
  install -Dm755 build/lib/driver_01spacecalibrator.so "${pkgdir}/usr/lib/openvr-space-calibrator-linux/driver_01spacecalibrator.so"
  install -Dm644 build/manifest.vrmanifest "${pkgdir}/usr/lib/openvr-space-calibrator-linux/manifest.vrmanifest"
  install -Dm644 driver_01spacecalibrator/driver.vrdrivermanifest "${pkgdir}/usr/lib/openvr-space-calibrator-linux/driver.vrdrivermanifest"
  cp -r driver_01spacecalibrator/resources "${pkgdir}/usr/lib/openvr-space-calibrator-linux/"
  
  # Install README
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
  # Install LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install install script
  install -Dm755 openvr-space-calibrator-install.sh "${pkgdir}/usr/bin/openvr-space-calibrator-install"
}

