# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
# Why: No AUR/repo package for DeepStream exists.
#      NVIDIA provides DeepStream on NGC at api.ngc.nvidia.com (public, no auth required).
#      The NGC API URL is stable; it redirects to a signed CDN URL that delivers the file.
#      DeepStream 8.0 was compiled against CUDA 12.8 (libcudart.so.12 soname).
#      Arch Linux CUDA 13.1.1 only provides libcudart.so.13 -- soname mismatch.
#      Fix: bundle actual CUDA 12.8 runtime libs from NVIDIA's Ubuntu repo (~130MB extra).
#      These are placed in /opt/deepstream/deepstream-8.0/lib/compat/ and registered with ldconfig.
#      Third-party lib soname bridges (protobuf 32->33, grpc 31->52, etc.) are also in compat/.
#      Installed to /opt/deepstream to keep NVIDIA SDK paths isolated from system.
#      profile.d entry provides PATH and GST_PLUGIN_PATH when sourced or at login.
#
# Usage notes:
#   - deepstream-app: /opt/deepstream/deepstream-8.0/bin/deepstream-app
#   - GStreamer plugins: /opt/deepstream/deepstream-8.0/lib/gstreamer-1.0
#   - Python bindings: pyds.so (cp310 only; use python3.10 if needed)
#   - Verify: deepstream-app --version (after sourcing /etc/profile.d/deepstream.sh)

pkgname=deepstream-sdk
pkgver=8.0.0
pkgrel=3
pkgdesc='NVIDIA DeepStream SDK 8.0 - streaming analytics toolkit for AI video and image understanding (CUDA 13 compat)'
arch=(x86_64)
url='https://developer.nvidia.com/deepstream-sdk'
license=('LicenseRef-NvidiaDeepStream')
depends=(
    cuda
    'nvidia-utils>=590'
    tensorrt
    gstreamer
    gst-plugins-base
    cairo
    glib2
    pango
    libx11
    yaml-cpp
    mesa
)

_deb="deepstream-8.0_${pkgver}-1_amd64.deb"
_cudart_deb="cuda-cudart-12-8_12.8.90-1_amd64.deb"
_npp_deb="libnpp-12-8_12.3.3.100-1_amd64.deb"
_cuda12_repo="https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64"

source=(
    "${_deb}::https://api.ngc.nvidia.com/v2/resources/nvidia/deepstream/versions/8.0/files/${_deb}"
    "${_cudart_deb}::${_cuda12_repo}/${_cudart_deb}"
    "${_npp_deb}::${_cuda12_repo}/${_npp_deb}"
)
sha256sums=(
    'ae810a0b7cdc2918bd3480125c6a832a4696b33b3740742a329430a0cead0d8f'
    '929554bc2f0831eefec4e212897d0cbb0db70cab75c5eeadd2a4a43e7d7ffb68'
    '54febea3b7a793e65318647c0548c0fea2416ef0a7dc70c672c6877f3bcba992'
)
noextract=("${_deb}" "${_cudart_deb}" "${_npp_deb}")

package() {
    # ---- Main DeepStream installation ----
    local _tmpdir="${srcdir}/deb-extract"
    install -d "${_tmpdir}"
    ar x "${srcdir}/${_deb}" --output="${_tmpdir}"

    install -d "${pkgdir}/opt/deepstream"
    if [[ -f "${_tmpdir}/data.tar.zst" ]]; then
        bsdtar -C "${pkgdir}/opt/deepstream" -xf "${_tmpdir}/data.tar.zst" \
            --strip-components=4 './opt/nvidia/deepstream/deepstream-8.0/*'
    elif [[ -f "${_tmpdir}/data.tar.xz" ]]; then
        bsdtar -C "${pkgdir}/opt/deepstream" -xf "${_tmpdir}/data.tar.xz" \
            --strip-components=4 './opt/nvidia/deepstream/deepstream-8.0/*'
    else
        echo "ERROR: could not find data.tar.* in DeepStream deb"; return 1
    fi

    # ---- CUDA 12.8 compatibility library installation ----
    # DeepStream 8.0 links against CUDA 12.8 sonames (libcudart.so.12, libnpp*.so.12).
    # Arch Linux provides only CUDA 13.x. Bundle actual CUDA 12.8 runtime libs here.
    local _compat="${pkgdir}/opt/deepstream/deepstream-8.0/lib/compat"
    install -d "${_compat}"

    for _pkg in "${_cudart_deb}" "${_npp_deb}"; do
        local _extdir="${_tmpdir}/${_pkg%.deb}"
        install -d "${_extdir}"
        ar x "${srcdir}/${_pkg}" --output="${_extdir}"
        for _tar in "${_extdir}"/data.tar.*; do
            bsdtar -xf "${_tar}" -C "${_extdir}" 2>/dev/null
        done
        # Copy all CUDA 12 shared libs to compat dir
        find "${_extdir}" -name "*.so*" -path "*/cuda-12.8/*" | while read -r _lib; do
            cp -P "${_lib}" "${_compat}/"
        done
    done

    # Soname bridges for system third-party libs (version mismatches between Ubuntu and Arch).
    # Two-level chaining: DeepStream binary may embed any of several older sonames for the
    # same library. Each entry is soname:target; target may be a system lib or a prior bridge.
    # Level 1 -- direct bridges to system libs
    for _bridge in \
        libprotobuf.so.32:/usr/lib/libprotobuf.so \
        libjsoncpp.so.25:/usr/lib/libjsoncpp.so \
        libhiredis.so.1.1.0:/usr/lib/libhiredis.so \
        libgrpc.so.31:/usr/lib/libgrpc.so \
        libgrpc++.so.1.54:/usr/lib/libgrpc++.so \
        libgpr.so.31:/usr/lib/libgpr.so; do
        local _soname="${_bridge%%:*}"
        local _target="${_bridge##*:}"
        [[ -f "${_target}" ]] && ln -sf "${_target}" "${_compat}/${_soname}"
    done
    # Level 2 -- older soname aliases that chain through the level-1 bridges above
    for _bridge in \
        libprotobuf.so.33.1.0:libprotobuf.so.32 \
        libjsoncpp.so.26:libjsoncpp.so.25 \
        libhiredis.so.1.3.0:libhiredis.so.1.1.0 \
        libgrpc.so.52:libgrpc.so.31 \
        libgrpc++.so.1.78:libgrpc++.so.1.54 \
        libgpr.so.52:libgpr.so.31; do
        local _soname="${_bridge%%:*}"
        local _target="${_bridge##*:}"
        [[ -L "${_compat}/${_target}" ]] && ln -sf "${_target}" "${_compat}/${_soname}"
    done
    # CUDA math library bridges: DeepStream 8.0 references libcublas.so.12 and libcufft.so.11.
    # The actual CUDA 12.8 cuBLAS and cuFFT .deb packages are >500MB so we bridge to the
    # system CUDA 13 equivalents (ABI-stable within the major compute API surface used by DS).
    for _bridge in \
        libcublas.so.12:/opt/cuda/lib64/libcublas.so \
        libcufft.so.11:/opt/cuda/lib64/libcufft.so; do
        local _soname="${_bridge%%:*}"
        local _target="${_bridge##*:}"
        [[ -f "${_target}" ]] && ln -sf "${_target}" "${_compat}/${_soname}"
    done
    # Versioned aliases for CUDA math bridges (libcublas.so.13 is an alias for .12 bridge)
    [[ -L "${_compat}/libcublas.so.12" ]] && ln -sf libcublas.so.12 "${_compat}/libcublas.so.13"
    [[ -L "${_compat}/libcufft.so.11" ]] && ln -sf libcufft.so.11 "${_compat}/libcufft.so.12"

    # ---- ld.so.conf.d: register deepstream lib paths ----
    install -d "${pkgdir}/etc/ld.so.conf.d"
    printf '/opt/deepstream/deepstream-8.0/lib\n/opt/deepstream/deepstream-8.0/lib/compat\n' \
        > "${pkgdir}/etc/ld.so.conf.d/deepstream.conf"

    # ---- profile.d: PATH and GStreamer plugin path ----
    install -d "${pkgdir}/etc/profile.d"
    cat > "${pkgdir}/etc/profile.d/deepstream.sh" << 'EOF'
# DeepStream SDK 8.0 environment
export DEEPSTREAM_DIR=/opt/deepstream/deepstream-8.0
export PATH="/opt/deepstream/deepstream-8.0/bin:${PATH}"
export GST_PLUGIN_PATH="/opt/deepstream/deepstream-8.0/lib/gstreamer-1.0:${GST_PLUGIN_PATH}"
EOF

    # ---- License ----
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    if [[ -f "${pkgdir}/opt/deepstream/deepstream-8.0/LICENSE.txt" ]]; then
        ln -s /opt/deepstream/deepstream-8.0/LICENSE.txt \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    fi
}
