pkgname=zed-sdk-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="Stereolabs advanced scalable and customizable AI Vision framework"
arch=('x86_64')
url="https://www.stereolabs.com/developers/release"
license=('LicenseRef-ZED-SDK')
install="${pkgname}.install"
provides=("zed-sdk=${pkgver}")
conflicts=('zed-sdk')
options=(!strip !debug)
depends=(
    'cuda>=13.2'
    'cudnn'
    'gcc-libs'
    'glibc'
    'libglvnd'
    'libusb'
    'libx11'
    'patchelf'
    'qt5-svg' # Needed by ZED_Explorer
    'qt6-base'
    'zlib'
)
makedepends=(
    'zstd'
)
optdepends=(
    'python: Python API support'
    'python-pip: Python API installation'
    'python-requests: required for Python API installation script'
    'opencv: OpenCV integration for samples'
)
# NOTE: Using Ubuntu 26 build; no Arch-specific build is provided by upstream.

# AUR TRUST: As StereoLabs has the official binary package hosted on a different domain, digitaloceanspaces.com
# and not stereolabs.com, as good AUR practice, I encourage you to instead manually download it from:
# https://www.stereolabs.com/en-fr/developers
#
# Then, at the very least confirm the b2sum matches what's in this PKGBUILD and/or place it in the PKGBUILD directory and build.

source=(
    "${pkgname}-${pkgver}.run::https://stereolabs.sfo2.cdn.digitaloceanspaces.com/zedsdk/${pkgver%.*}/ZED_SDK_Ubuntu26_cuda13.2_tensorrt10.13_v${pkgver}.zstd.run"
)
noextract=("${pkgname}-${pkgver}.run")
b2sums=('5221f8d3afad8f3dd1a1e8a33c2128aaaf15bec817f7fc9ef6f73b75352fd33847c1616c9256817131e80c84f9d42e652f020d7a3ea44a1b4fcb0dc3ba941d73')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.run"
    "${srcdir}/${pkgname}-${pkgver}.run" --noexec --target "${srcdir}/extracted"

    # Fix CMake config paths (upstream defaults to /usr/local/zed)
    sed -i 's|/usr/local/zed|/opt/zed|g' "${srcdir}/extracted/zed-config.cmake"
}

package() {
    local extracted="${srcdir}/extracted"

    # Install SDK subdirectories to /opt/zed (selective, excluding Ubuntu-specific installer artifacts)
    mkdir -p "${pkgdir}/opt/zed"
    for dir in lib include tools firmware samples resources dependencies; do
        if [ -d "${extracted}/${dir}" ]; then
            cp -a "${extracted}/${dir}" "${pkgdir}/opt/zed/"
        fi
    done

    # Create symlinks for libnvinfer_builder_resource
    ln -sf libnvinfer_builder_resource.so.10.13.2 \
        "${pkgdir}/opt/zed/dependencies/ai_dependencies/lib/libnvinfer_builder_resource.so.10"
    ln -sf libnvinfer_builder_resource.so.10.13.2 \
        "${pkgdir}/opt/zed/dependencies/ai_dependencies/lib/libnvinfer_builder_resource.so"

    # Install root-level SDK files
    install -Dm644 "${extracted}/zed-config.cmake" \
        "${pkgdir}/opt/zed/zed-config.cmake"
    install -Dm644 "${extracted}/zed-config-version.cmake" \
        "${pkgdir}/opt/zed/zed-config-version.cmake"
    install -Dm755 "${extracted}/get_python_api.py" \
        "${pkgdir}/opt/zed/get_python_api.py"

    # Install CMake config to standard path
    install -Dm644 "${extracted}/zed-config.cmake" \
        "${pkgdir}/usr/lib/cmake/zed/zed-config.cmake"
    install -Dm644 "${extracted}/zed-config-version.cmake" \
        "${pkgdir}/usr/lib/cmake/zed/zed-config-version.cmake"

    # Set proper permissions
    chmod -R a+rX "${pkgdir}/opt/zed"
    find "${pkgdir}/opt/zed/tools" -type f -exec chmod 755 {} \;
    find "${pkgdir}/opt/zed" -name "*.sh" -exec chmod 755 {} \;

    # Allow members of the 'video' group to write models/configs that the ZED
    # tools download at runtime. The setgid bit (2775) ensures files created in
    # these directories inherit the 'video' group.
    chown root:video "${pkgdir}/opt/zed/resources"
    chmod 2775 "${pkgdir}/opt/zed/resources"
    chgrp -R video "${pkgdir}/opt/zed/resources"
    chmod -R g+w "${pkgdir}/opt/zed/resources"

    install -dm2775 "${pkgdir}/opt/zed/settings"
    chown root:video "${pkgdir}/opt/zed/settings"

    # Fix RUNPATH for all binaries to point to correct library paths
    for bin in "${pkgdir}/opt/zed/tools/"*; do
        if [ -f "$bin" ]; then
            patchelf --set-rpath '/opt/zed/lib:/opt/zed/dependencies/ai_dependencies/lib:/opt/cuda/lib64' "$bin" 2>/dev/null || true
        fi
    done

    # AI deps need own RUNPATH: libnvinfer dlopen()s by filename with no RUNPATH,
    # and ldconfig can't resolve it due to deliberately poisoned SONAMEs
    for lib in "${pkgdir}/opt/zed/dependencies/ai_dependencies/lib/"*.so*; do
        if [ -f "$lib" ] && [ ! -L "$lib" ]; then
            patchelf --set-rpath '/opt/zed/dependencies/ai_dependencies/lib:/opt/cuda/lib64' "$lib" 2>/dev/null || true
        fi
    done

    # Patch RUNPATH on SDK libraries (libsl_ai.so, libsl_zed.so)
    for lib in "${pkgdir}/opt/zed/lib/"*.so*; do
        if [ -f "$lib" ] && [ ! -L "$lib" ]; then
            patchelf --set-rpath '/opt/zed/lib:/opt/zed/dependencies/ai_dependencies/lib:/opt/cuda/lib64' "$lib" 2>/dev/null || true
        fi
    done

    # Create LD library path configuration (covers both SDK libs and bundled AI libs)
    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    printf '/opt/zed/lib\n/opt/zed/dependencies/ai_dependencies/lib\n' \
        > "${pkgdir}/etc/ld.so.conf.d/zed-sdk.conf"

    # Create wrapper scripts in /usr/bin for all tools
    mkdir -p "${pkgdir}/usr/bin"
    for tool in "${pkgdir}/opt/zed/tools/"*; do
        if [ -x "$tool" ]; then
            local toolname
            toolname=$(basename "$tool")
            cat > "${pkgdir}/usr/bin/${toolname}" << EOF
#!/bin/bash
exec /opt/zed/tools/${toolname} "\$@"
EOF
            chmod 755 "${pkgdir}/usr/bin/${toolname}"
        fi
    done

    # Install udev rules
    install -Dm644 "${extracted}/99-slabs.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-slabs.rules"

    # Fix upstream bug: hidraw rules hardcode busnum==1, should match any bus
    sed -i 's/ATTRS{busnum}=="1", //g' "${pkgdir}/usr/lib/udev/rules.d/99-slabs.rules"

    # Install modprobe.d config for USBFS memory buffer (works when usbcore is a module)
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    cat > "${pkgdir}/usr/lib/modprobe.d/zed-usbfs.conf" << 'EOF'
# Increase USBFS memory buffer for ZED stereo cameras
# Default 16MB is too low for high-bandwidth USB 3.0 cameras
# 256MB is sufficient for one ZED camera. For multi-camera setups,
# increase proportionally (e.g., 512 for 2 cameras) or set to 0 for unlimited.
options usbcore usbfs_memory_mb=256
EOF

    # Install tmpfiles.d rule to set USBFS memory buffer at boot via sysfs
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/zed-usbfs.conf" << 'EOF'
# Set USBFS memory buffer for ZED stereo cameras (applied at boot)
w /sys/module/usbcore/parameters/usbfs_memory_mb - - - - 256
EOF

    # Install sysctl configuration
    install -Dm644 "${extracted}/60-zed-buffers.conf" \
        "${pkgdir}/usr/lib/sysctl.d/60-zed-buffers.conf"

    # Install desktop files
    for desktop in "${extracted}/desktop/"*.desktop; do
        install -Dm644 "$desktop" \
            "${pkgdir}/usr/share/applications/$(basename "$desktop")"
    done

    # Install icon
    install -Dm644 "${extracted}/icons/stereolabs-zed.png" \
        "${pkgdir}/usr/share/pixmaps/stereolabs-zed.png"

    # Install license files
    install -Dm644 "${extracted}/doc/license/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm644 "${extracted}/doc/license/LICENSE_3rdparty.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_3rdparty.txt"
    install -Dm644 "${extracted}/doc/license/LICENSE_Qt_Tools.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_Qt_Tools.txt"
}
