# Maintainer: xi-ve <zunavs@gmail.com>
pkgname=openvr-space-calibrator-linux
pkgver=1.5.1
pkgrel=5
pkgdesc="Linux port of OpenVR-SpaceCalibrator - synchronize multiple VR playspaces in SteamVR. Requires SteamVR to be installed (provides OpenVR headers)."
arch=('x86_64')
url="https://github.com/xi-ve/openvr-space-calibrator-linux"
license=('MIT')
install="${pkgname}.install"
depends=('glfw-x11' 'mesa' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi')
makedepends=('cmake' 'base-devel' 'eigen' 'pkgconf' 'git')
source=("git+https://github.com/xi-ve/openvr-space-calibrator-linux.git#branch=main"
        "openvr-headers.tar.gz::https://github.com/ValveSoftware/openvr/archive/master.tar.gz"
        "eigen.tar.gz::https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz"
        "openvr-space-calibrator-install.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/openvr-space-calibrator-linux"
  
  if [ -d "build" ]; then
    rm -rf build
  fi
  
  echo "Initializing git submodules..."
  git submodule update --init --recursive
  
  if [ ! -d "../lib/openvr/headers" ]; then
    echo "Extracting OpenVR headers..."
    mkdir -p ../lib/openvr
    tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr --strip-components=1 openvr-master/headers 2>/dev/null || true
  fi
  
  if [ ! -f "../lib/openvr/bin/linux64/libopenvr_api.so" ]; then
    echo "Extracting OpenVR library..."
    mkdir -p ../lib/openvr/bin/linux64
    if tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/bin/linux64 --strip-components=1 openvr-master/bin/linux64/libopenvr_api.so 2>/dev/null; then
      echo "OpenVR library extracted successfully"
    elif tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/bin --strip-components=1 openvr-master/bin/linux64/libopenvr_api.so 2>/dev/null; then
      mv ../lib/openvr/bin/libopenvr_api.so ../lib/openvr/bin/linux64/ 2>/dev/null || true
      echo "OpenVR library extracted successfully (alternative path)"
    else
      echo "Note: Could not extract OpenVR library from tarball (register-overlay may not build)"
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
  cd "${srcdir}/openvr-space-calibrator-linux"
  
  export CFLAGS="${CFLAGS//-ffile-prefix-map=* /} -Wno-format-security"
  export CXXFLAGS="${CXXFLAGS//-ffile-prefix-map=* /} -Wno-format-security"
  
  mkdir -p build
  cd build
  
  OPENVR_HEADERS=""
  PROJECT_ROOT="${srcdir}/openvr-space-calibrator-linux"
  
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
    
    OPENVR_LIB=""
    for lib_path in \
      "${PROJECT_ROOT}/../lib/openvr/bin/linux64/libopenvr_api.so" \
      "${HOME}/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/libopenvr_api.so" \
      "${HOME}/.steam/steam/steamapps/common/SteamVR/bin/linux64/libopenvr_api.so" \
      "${HOME}/.steam/root/steamapps/common/SteamVR/bin/linux64/libopenvr_api.so"; do
      if [ -f "$lib_path" ] 2>/dev/null; then
        OPENVR_LIB="$(dirname "$lib_path")"
        echo "Found OpenVR library at: $OPENVR_LIB"
        CMAKE_ARGS="$CMAKE_ARGS -DOPENVR_LIB_DIR=\"$OPENVR_LIB\""
        break
      fi
    done
  else
    echo "OpenVR headers not found in standard locations."
    echo "CMake will attempt to find them using its own detection logic."
  fi
  
  eval "cmake .. $CMAKE_ARGS"
  
  make -j$(nproc) space-calibrator openvr_spacecalibrator_driver
  
  if [ -f "${PROJECT_ROOT}/../lib/openvr/bin/linux64/libopenvr_api.so" ] || \
     [ -f "${HOME}/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/libopenvr_api.so" ] || \
     [ -f "${HOME}/.steam/steam/steamapps/common/SteamVR/bin/linux64/libopenvr_api.so" ] || \
     [ -f "${HOME}/.steam/root/steamapps/common/SteamVR/bin/linux64/libopenvr_api.so" ]; then
    if make -j$(nproc) register-overlay 2>&1; then
      echo "register-overlay built successfully"
    else
      echo "register-overlay build failed (optional utility, overlay will register itself on first run)"
    fi
  else
    echo "OpenVR library not found - register-overlay will not be built (overlay will register itself on first run)"
  fi
}

package() {
  cd "${srcdir}/openvr-space-calibrator-linux"
  
  # Install register-overlay utility if built
  if [ -f build/bin/register-overlay ]; then
    install -Dm755 build/bin/register-overlay "${pkgdir}/usr/bin/openvr-space-calibrator-register"
  fi
  
  # Install driver files to /usr/lib/openvr-space-calibrator-linux (as expected by install script)
  install -Dm755 build/lib/driver_01spacecalibrator.so "${pkgdir}/usr/lib/openvr-space-calibrator-linux/driver_01spacecalibrator.so"
  install -Dm755 build/bin/space-calibrator "${pkgdir}/usr/lib/openvr-space-calibrator-linux/space-calibrator"
  install -Dm644 build/manifest.vrmanifest "${pkgdir}/usr/lib/openvr-space-calibrator-linux/manifest.vrmanifest"
  install -Dm644 build/actions.json "${pkgdir}/usr/lib/openvr-space-calibrator-linux/actions.json"
  install -Dm644 driver_01spacecalibrator/driver.vrdrivermanifest "${pkgdir}/usr/lib/openvr-space-calibrator-linux/driver.vrdrivermanifest"
  cp -r driver_01spacecalibrator/resources "${pkgdir}/usr/lib/openvr-space-calibrator-linux/"
  
  # Install README
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
  # Install LICENSE
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install install script
  install -Dm755 "${srcdir}/openvr-space-calibrator-install.sh" "${pkgdir}/usr/bin/openvr-space-calibrator-install"
}
