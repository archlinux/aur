# Maintainer: xi-ve <zunavs@gmail.com>
pkgname=openvr-lighthouse-manager-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux port of OVR Lighthouse Manager - manage SteamVR base station power via Bluetooth LE. Requires SteamVR to be installed (provides OpenVR headers)."
arch=('x86_64')
url="https://github.com/xi-ve/openvr-lighthouse-manager-linux"
license=('MIT')
install="${pkgname}.install"
depends=('bluez-libs' 'dbus' 'glfw-x11' 'libx11')
makedepends=('cmake' 'base-devel' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xi-ve/openvr-lighthouse-manager-linux/archive/main.tar.gz"
        "openvr-headers.tar.gz::https://github.com/ValveSoftware/openvr/archive/master.tar.gz")
sha256sums=('SKIP'
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
  
  if [ ! -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
    echo "Extracting OpenVR library..."
    mkdir -p ../lib/openvr/lib/linux64
    if tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/lib/linux64 --strip-components=1 openvr-master/bin/linux64/libopenvr_api.so 2>/dev/null; then
      echo "OpenVR library extracted successfully"
    elif tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/lib --strip-components=1 openvr-master/bin/linux64/libopenvr_api.so 2>/dev/null; then
      mv ../lib/openvr/lib/libopenvr_api.so ../lib/openvr/lib/linux64/ 2>/dev/null || true
      echo "OpenVR library extracted successfully (alternative path)"
    else
      echo "ERROR: Could not extract OpenVR library from tarball"
      echo "Attempting alternative extraction method..."
      mkdir -p ../lib/openvr/lib/linux64
      tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/lib/linux64 --strip-components=0 openvr-master/bin/linux64/libopenvr_api.so 2>/dev/null && \
      mv ../lib/openvr/lib/linux64/openvr-master/bin/linux64/libopenvr_api.so ../lib/openvr/lib/linux64/ 2>/dev/null && \
      rm -rf ../lib/openvr/lib/linux64/openvr-master 2>/dev/null && \
      echo "OpenVR library extracted successfully (alternative method)" || \
      echo "ERROR: Failed to extract OpenVR library - build will fail"
    fi
  fi
  
  if [ ! -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
    echo "ERROR: OpenVR library not found at ../lib/openvr/lib/linux64/libopenvr_api.so"
    echo "Build will fail. Please check the openvr-headers.tar.gz file."
    exit 1
  fi
  
  # ImGui is committed to the repository, no extraction needed
  if [ ! -d "lib/imgui" ]; then
    echo "WARNING: lib/imgui not found in repository"
  fi
}

build() {
  cd "${srcdir}/${pkgname}-main"
  
  export CFLAGS="${CFLAGS//-ffile-prefix-map=* /} -Wno-format-security"
  export CXXFLAGS="${CXXFLAGS//-ffile-prefix-map=* /} -Wno-format-security"
  
  # Verify OpenVR library exists before building
  if [ ! -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
    echo "ERROR: OpenVR library not found at ../lib/openvr/lib/linux64/libopenvr_api.so"
    echo "Cannot proceed with build."
    exit 1
  fi
  
  echo "OpenVR library found at: ../lib/openvr/lib/linux64/libopenvr_api.so"
  
  # Use Makefile (handles both CLI and GUI builds with ImGui)
  # Makefile expects OPENVR_DIR to be set relative to project root
  # It will look for ../lib/openvr/headers and ../lib/openvr/lib/linux64
  
  # Build CLI version
  make -j$(nproc)
  
  # Build GUI version
  make -j$(nproc) gui
}

package() {
  cd "${srcdir}/${pkgname}-main"
  
  # Install binaries to /usr/bin
  install -Dm755 build/bin/lighthouse-manager "${pkgdir}/usr/bin/lighthouse-manager"
  install -Dm755 build/bin/lighthouse-manager-gui "${pkgdir}/usr/bin/lighthouse-manager-gui"
  
  # Install manifest and install script to package directory (for install hook)
  install -Dm644 manifest.vrmanifest "${pkgdir}/usr/lib/${pkgname}/manifest.vrmanifest"
  install -Dm755 openvr-lighthouse-manager-install.sh "${pkgdir}/usr/bin/${pkgname}-install"
  
  # Install README
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
  # Install LICENSE if it exists
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

