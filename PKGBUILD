# Maintainer: xi-ve <zunavs@gmail.com>
pkgname=openvr-lighthouse-manager-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux port of OVR Lighthouse Manager - manage SteamVR base station power via Bluetooth LE. Requires SteamVR to be installed (provides OpenVR headers)."
arch=('x86_64')
url="https://github.com/xi-ve/openvr-lighthouse-manager-linux"
license=('GPL3')
install="${pkgname}.install"
depends=('bluez-libs' 'dbus' 'glfw-x11' 'libx11')
makedepends=('cmake' 'base-devel' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xi-ve/openvr-lighthouse-manager-linux/archive/main.tar.gz"
        "openvr-headers.tar.gz::https://github.com/ValveSoftware/openvr/archive/master.tar.gz"
        "openvr-lighthouse-manager-install.sh"
        "LICENSE")
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
  
  if [ ! -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
    echo "Extracting OpenVR library..."
    mkdir -p ../lib/openvr/lib/linux64
    echo "DEBUG: Attempting extraction from bin/linux64 with strip-components=3..."
    if tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/lib/linux64 --strip-components=3 openvr-master/bin/linux64/libopenvr_api.so 2>&1; then
      if [ -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
        echo "OpenVR library extracted successfully"
      else
        echo "ERROR: Extraction appeared to succeed but file not found!"
        ls -la ../lib/openvr/lib/linux64/ 2>&1 || echo "Directory does not exist"
      fi
    else
      echo "Method 1 failed, trying alternative..."
      if tar -xzf "${srcdir}/openvr-headers.tar.gz" -C ../lib/openvr/lib --strip-components=2 openvr-master/bin/linux64/libopenvr_api.so 2>&1; then
        mv ../lib/openvr/lib/libopenvr_api.so ../lib/openvr/lib/linux64/ 2>/dev/null || true
        if [ -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
          echo "OpenVR library extracted successfully (alternative path)"
        else
          echo "ERROR: Alternative extraction failed"
        fi
      else
        echo "ERROR: All extraction methods failed!"
        echo "DEBUG: Listing tarball contents..."
        tar -tzf "${srcdir}/openvr-headers.tar.gz" | grep "libopenvr_api.so" | head -5
      fi
    fi
  else
    echo "OpenVR library already exists"
  fi
  
  if [ ! -f "../lib/openvr/lib/linux64/libopenvr_api.so" ]; then
    echo "ERROR: OpenVR library not found at ../lib/openvr/lib/linux64/libopenvr_api.so"
    echo "Build will fail."
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
  
  # Install binaries to package directory (will be copied to SteamVR directory by install script)
  install -Dm755 build/bin/lighthouse-manager "${pkgdir}/usr/lib/${pkgname}/lighthouse-manager"
  install -Dm755 build/bin/lighthouse-manager-gui "${pkgdir}/usr/lib/${pkgname}/lighthouse-manager-gui"
  
  # Install manifest and install script
  install -Dm644 manifest.vrmanifest "${pkgdir}/usr/lib/${pkgname}/manifest.vrmanifest"
  
  # Verify install script exists before installing
  if [ ! -f "${srcdir}/openvr-lighthouse-manager-install.sh" ]; then
    echo "ERROR: Install script not found at ${srcdir}/openvr-lighthouse-manager-install.sh"
    echo "Available files in ${srcdir}:"
    ls -la "${srcdir}/" 2>&1 || true
    exit 1
  fi
  install -Dm755 "${srcdir}/openvr-lighthouse-manager-install.sh" "${pkgdir}/usr/bin/${pkgname}-install"
  
  # Install README
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  
  # Verify LICENSE exists before installing
  if [ ! -f "${srcdir}/LICENSE" ]; then
    echo "ERROR: LICENSE not found at ${srcdir}/LICENSE"
    exit 1
  fi
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

