# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Split package: amdgpu-exporter + rocprofiler-client
#   Both sub-packages are built from the same upstream source:
#   https://github.com/ROCm/device-metrics-exporter
#
# Bundled blobs replaced by source-built packages:
#   librocpclient.so / rocpctl -> rocprofiler-client (this PKGBUILD)
#   gpuagent / gpuctl          -> rocm-gpu-agent (separate PKGBUILD, gpu-agent source)
#
# Existing Arch packages used as-is (no custom build needed):
#   amdsmi      (upstream wrongly named amd-smi-lib)
#   rocprofiler (upstream wrongly named rocprofiler-sdk)

pkgbase=amdgpu-exporter
pkgname=('amdgpu-exporter' 'rocprofiler-client')
pkgver=1.5.0
pkgrel=2
pkgdesc="AMD GPU metrics exporter for Prometheus"
arch=('x86_64')
url="https://github.com/ROCm/device-metrics-exporter"
license=('Apache-2.0')
makedepends=(
    'go'
    'cmake'
    'hip-runtime-amd'
    'rocprofiler'
    'elfutils'
    'pkgconf'
    'amdsmi'
    'rocm-gpu-agent'
    'patchelf'
)

_srcname="device-metrics-exporter-${pkgver}"

source=(
    "${_srcname}.tar.gz::https://github.com/ROCm/device-metrics-exporter/archive/refs/tags/v${pkgver}.tar.gz"
    "amd-metrics-exporter.service"
    "fix-missing-iseventsdisabled.patch"
)
sha256sums=('0b5d5dfca74d97976c6fb83bddc69abe7396367ba61a410484673209cdcf8d14'
            '1200ad9753baf0cc7f16fa702303dac3b7f3ec9a049a77b0fbc7e5f7fe7c586f'
            '39fb1e4e3530679acb5ab4686f1ca1ab17be2ecea20e28523595fbe5376e7968')

# ---------------------------------------------------------------------------
# prepare(): apply patches
# ---------------------------------------------------------------------------
prepare() {
    cd "${srcdir}/${_srcname}"
    # Fix upstream bug: IsEventsDisabled is called but never defined
    patch -Np1 -i "${srcdir}/fix-missing-iseventsdisabled.patch"
}

# ---------------------------------------------------------------------------
# build(): compile all outputs from device-metrics-exporter
# ---------------------------------------------------------------------------
build() {
    local dmedir="${srcdir}/${_srcname}"

    # ---- Go binaries ----
    cd "${dmedir}"
    export CGO_ENABLED=0
    export GOFLAGS="-mod=vendor"

    export GODEBUG=netdns=cgo
    go build -trimpath -ldflags="-s -w" -buildmode=pie -o "${srcdir}/amd-metrics-exporter" ./cmd/exporter
    go build -trimpath -ldflags="-s -w" -buildmode=pie -o "${srcdir}/amd-test-runner"       ./cmd/testrunner
    go build -trimpath -ldflags="-s -w" -buildmode=pie -o "${srcdir}/metricutil"            ./tools/metricutil
    go build -trimpath -ldflags="-s -w" -buildmode=pie -o "${srcdir}/metricsclient"         ./tools/metricsclient
    go build -trimpath -ldflags="-s -w" -buildmode=pie -o "${srcdir}/amdgpuhealth"          ./tools/amd-gpu-health

    # ---- librocpclient.so + rocpctl (CMake + HIP) ----
    local rocpclientbuild="${srcdir}/build-rocprofiler-client"

    # Auto-detect HIP-capable clang
    local hip_compiler
    for candidate in \
        /opt/rocm/lib/llvm/bin/clang++ \
        /opt/rocm/bin/amdclang++ \
        /usr/bin/amdclang++; do
        if [[ -x "${candidate}" ]]; then
            hip_compiler="${candidate}"
            break
        fi
    done
    [[ -n "${hip_compiler}" ]] || { echo "ERROR: No HIP-capable clang++ found"; exit 1; }

    cmake -S "${dmedir}/rocprofilerclient" -B "${rocpclientbuild}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_COMPILER="${hip_compiler}" \
        -DCMAKE_PREFIX_PATH=/opt/rocm \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DHIP_PLATFORM=amd
    cmake --build "${rocpclientbuild}" -- -j"$(nproc)"
}

# ---------------------------------------------------------------------------
# package_amdgpu-exporter(): Go binaries + config + service units
# ---------------------------------------------------------------------------
package_amdgpu-exporter() {
    pkgdesc="AMD GPU metrics exporter for Prometheus"
    depends=(
        'glibc'
        'zlib'
        'amdsmi'
        'rocprofiler'
        'hip-runtime-amd'
        'rocm-gpu-agent'
        'rocprofiler-client'
    )
    optdepends=('prometheus: scrape /metrics HTTP endpoint')
    backup=(
        'etc/metrics/config.json'
    )

    local dmedir="${srcdir}/${_srcname}"

    install -Dm755 "${srcdir}/amd-metrics-exporter" "${pkgdir}/usr/bin/amd-metrics-exporter"
    install -Dm755 "${srcdir}/amd-test-runner"       "${pkgdir}/usr/bin/amd-test-runner"
    install -Dm755 "${srcdir}/metricutil"            "${pkgdir}/usr/bin/metricutil"
    install -Dm755 "${srcdir}/metricsclient"         "${pkgdir}/usr/bin/metricsclient"
    install -Dm755 "${srcdir}/amdgpuhealth"          "${pkgdir}/usr/bin/amdgpuhealth"
    install -Dm644 "${dmedir}/example/config.json"   "${pkgdir}/etc/metrics/config.json"

    install -Dm644 "${srcdir}/amd-metrics-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/amd-metrics-exporter.service"

    install -Dm644 "${dmedir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# ---------------------------------------------------------------------------
# package_rocprofiler-client(): librocpclient.so + rocpctl
# ---------------------------------------------------------------------------
package_rocprofiler-client() {
    pkgdesc="ROCm profiler client library and CLI for amdgpu-exporter"
    depends=(
        'glibc'
        'rocprofiler'
    )
    provides=('librocpclient.so=0-64')

    install -Dm755 "${srcdir}/build-rocprofiler-client/librocpclient.so" \
        "${pkgdir}/usr/lib/librocpclient.so"
    install -Dm755 "${srcdir}/build-rocprofiler-client/rocpctl" \
        "${pkgdir}/usr/bin/rocpctl"

    # Fix insecure RPATHs baked in at build time
    patchelf --set-rpath /usr/lib "${pkgdir}/usr/lib/librocpclient.so"
    patchelf --set-rpath /usr/lib "${pkgdir}/usr/bin/rocpctl"

    install -Dm644 "${srcdir}/${_srcname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
