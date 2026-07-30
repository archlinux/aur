# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Standalone package built from https://github.com/ROCm/gpu-agent
#
# Provides the gpuagent C++ gRPC daemon and gpuctl Go CLI used by amdgpu-exporter.
# The upstream Makefile is patched to use system libraries instead of the
# submodule-built C++ dependencies that the upstream tree normally drives.

pkgname=rocm-gpu-agent
pkgver=1.5.1
pkgrel=1
pkgdesc="AMD ROCm GPU Agent: metrics daemon (gpuagent) and control CLI (gpuctl) for AMD Instinct GPUs"
arch=('x86_64')
url="https://github.com/ROCm/gpu-agent"
license=('Apache-2.0')
depends=(
    'amdsmi'
    'abseil-cpp'
    'grpc'
    'zeromq'

    'protobuf'
    'libev'
)
makedepends=(
    'go'
    'python'
    'patchelf'
    'boost'
)

_srcname="gpu-agent-${pkgver}"

source=(
    "${_srcname}.tar.gz::https://github.com/ROCm/gpu-agent/archive/refs/tags/v${pkgver}.tar.gz"
    'gpuagent.service'
    'gpuagent.conf'
    'fix-base-snprintf-sizeof-pointer.patch'
    'fix-gpu-watch-stack-overflow.patch'
    'fix-boost-lockfree-queue-capacity.patch'
)
sha256sums=('011f44387aad24942b63b346f360453ba4abfb6790d493dd34401b768cc94cc6'
            '8d35441bdbae38652e52fcfe22c7b677fdcad9a184ffe333e77507afc9d5d27e'
            'b266380dbe91bc69ffc94ea9a9b7412f4699eda7faf22a617769faeab19ba0bb'
            '70291528d5b84a29516cc7aa907aa5c4c6251b7b0bd6b01f6fc6fd37ee897018'
            '1a331e00133c6ff3306d314d9084201b3ddaaa62f9b0cdc54b3f7f94a4decd32'
            '5e31b7a994d359221553beb3561ef844f954cab8613364c98e017e8104e7be52')
backup=('etc/gpuagent/gpuagent.conf')

# ---------------------------------------------------------------------------
# prepare(): patch the upstream Makefile to use system libraries
# ---------------------------------------------------------------------------
prepare() {
    local agentdir="${srcdir}/${_srcname}/sw/nic/gpuagent"

    # Use GOPROXY mirror for all go commands: this host's IPv6 route to
    # proxy.golang.org times out (dial tcp [2607:...]:443: i/o timeout).
    export GOPROXY="https://mirrors.aliyun.com/goproxy,direct"

    # ---- 0. Fix upstream bug: sizeof(pointer) used instead of buffer size in snprintf ----
    patch -p1 -d "${srcdir}/${_srcname}" < "${srcdir}/fix-base-snprintf-sizeof-pointer.patch"

    # ---- 0b. Fix GPUWatchGet stack overflow: ~2.3 MB stack var -> heap allocation ----
    patch -p1 -d "${srcdir}/${_srcname}" < "${srcdir}/fix-gpu-watch-stack-overflow.patch"

    # ---- 0c. Fix boost >= 1.91: lockfree::queue default ctor requires static capacity ----
    patch -p1 -d "${srcdir}/${_srcname}" < "${srcdir}/fix-boost-lockfree-queue-capacity.patch"

    # ---- 1. Fix hardcoded ABS_DIR (absolute build-root path) ----
    sed -i "s|ABS_DIR\s*:=\s*/usr/src/github.com/ROCm/gpu-agent/sw|ABS_DIR := ${srcdir}/${_srcname}/sw|g" \
        "${agentdir}/Makefile"

    # ---- 2. Use system protoc / grpc_cpp_plugin ----
    sed -i \
        -e 's|PROTOC\s*:=\s*${BLD_DIR}/bin/protoc|PROTOC := /usr/bin/protoc|g' \
        -e 's|GRPC_CPP_PLUGIN\s*:=\s*${BLD_BIN_DIR}/grpc_cpp_plugin|GRPC_CPP_PLUGIN := /usr/bin/grpc_cpp_plugin|g' \
        "${agentdir}/Makefile"

    # ---- 3. Replace static lib flags with dynamic equivalents ----
    sed -i \
        -e 's|-l:libprotobuf\.a|-lprotobuf|g' \
        -e 's|-l:libgrpc\.a|-lgrpc|g' \
        -e 's|-l:libgrpc++\.a|-lgrpc++|g' \
        -e 's|-l:libgpr\.a|-lgpr|g' \
        -e 's|-l:libre2\.a|-lre2|g' \
        -e 's|-l:libev\.a|-lev|g' \
        -e 's|-l:libzmq\.a|-lzmq|g' \
        -e 's|-l:libssl\.a|-lssl|g' \
        -e 's|-l:libcrypto\.a|-lcrypto|g' \
        "${agentdir}/Makefile"

    # ---- 4. Remove BLD_LIB_DIR -L and -rpath flags ----
    sed -i \
        -e 's|-L$(BLD_LIB_DIR)||g' \
        -e 's|-L${BLD_DIR}/lib64||g' \
        -e 's|-L${BLD_DIR}/lib||g' \
        -e 's|-Wl,-rpath,$(BLD_LIB_DIR)||g' \
        -e 's|-Wl,-rpath-link,$(BLD_LIB_DIR)||g' \
        "${agentdir}/Makefile"

    # ---- 5. Redirect AMD SMI headers and libs to ROCm system paths ----
    sed -i \
        -e 's|INC_AMD_SMI\s*:=.*|INC_AMD_SMI := /opt/rocm/include|g' \
        -e 's|-L${TOPDIR}/nic/third-party/rocm/amd_smi_lib/${CARCH}/lib/|-L/opt/rocm/lib|g' \
        "${agentdir}/Makefile"

    # ---- 6. Touch the build-libs stamp to skip submodule C++ dep builds ----
    local stamp_dir="${srcdir}/${_srcname}/sw/nic/build/${CARCH}/sim/out"
    mkdir -p "${stamp_dir}"
    touch "${stamp_dir}/.build_libs_done"

    # ---- 6b. Fix protobuf v4 API: always_print_primitive_fields was renamed ----
    sed -i 's/always_print_primitive_fields/always_print_fields_with_no_presence/g' \
        "${agentdir}/svc/trace.cc"

    # ---- 6c. Fix abseil component lib names for abseil-cpp >= 20230802 ----
    # absl_bad_optional_access, absl_bad_any_cast_impl, absl_bad_variant_access
    # were merged into absl_throw_delegate; absl_low_level_hash merged into absl_hash;
    # absl_leak_check_disable removed; absl_random_internal_pool_urbg renamed to
    # absl_random_internal_entropy_pool; absl_flags split into sub-libs (already linked).
    sed -i \
        -e 's/ -labsl_bad_optional_access//g' \
        -e 's/ -labsl_bad_any_cast_impl//g' \
        -e 's/ -labsl_bad_variant_access//g' \
        -e 's/ -labsl_low_level_hash//g' \
        -e 's/ -labsl_leak_check_disable//g' \
        -e 's/-labsl_random_internal_pool_urbg/-labsl_random_internal_entropy_pool/g' \
        -e 's/ -labsl_flags / /g' \
        "${agentdir}/Makefile"

    # ---- 6e. Replace LDFLAGS_COMMON using pkg-config (deduplicated, --as-needed) ----
    python3 - "${agentdir}/Makefile" <<'PYEOF'
import sys, subprocess, re
makefile = sys.argv[1]
libs_raw = subprocess.check_output(
    ['pkg-config', '--libs', 'protobuf', 'grpc++', 'grpc'],
    text=True).split()
seen = set()
libs_deduped = []
for tok in libs_raw:
    if tok in ('-lutf8_range',):  # transitively satisfied, causes namcap unused-lib warning
        continue
    if tok not in seen:
        seen.add(tok)
        libs_deduped.append(tok)
ldflags_new = (
    'LDFLAGS_COMMON := -Wl,--as-needed -pthread -rdynamic -no-canonical-prefixes'
    ' -Wl,--gc-sections -Wl,-z,relro,-z,now -Wl,--build-id=md5 -Wl,--hash-style=gnu'
    ' -lgrpc++_reflection'
    ' -lupb_textformat_lib -lupb_json_lib -lupb_reflection_lib -lupb_wire_lib'
    ' -lupb_message_lib -lupb_mini_descriptor_lib -lupb_mini_table_lib'
    ' -lupb_hash_lib -lupb_mem_lib -lupb_base_lib -lupb_lex_lib'
    ' -lcares -laddress_sorting -lev -lzmq'
    ' ' + ' '.join(libs_deduped) +
    ' -lutf8_validity -lrt -lm -lz\n'
)
with open(makefile) as f:
    text = f.read()
# Replace the whole multiline LDFLAGS_COMMON block
text = re.sub(
    r'LDFLAGS_COMMON\s*:=[^\\\n]*(?:\\\n[^\\\n]*)*(?:\n[ \t]+[^\n]*)?',
    ldflags_new,
    text, count=1)
with open(makefile, 'w') as f:
    f.write(text)
PYEOF


    # ---- 7. Generate protobuf Go stubs required by the CLI ----
    # gen/go/ does not exist in the tarball; must be generated before vendoring.
    local _gotools="${srcdir}/gotools"
    local topdir="${srcdir}/${_srcname}/sw"
    GOPATH="${_gotools}" GOFLAGS="-mod=mod" \
        go install github.com/gogo/protobuf/protoc-gen-gogofast@v1.3.2
    PATH="${_gotools}/bin:${PATH}" \
        make -C "${agentdir}" TOPDIR="${topdir}" gen-protos

    # ---- 8. Vendor Go dependencies for offline build ----
    if [[ ! -d "${agentdir}/vendor" ]]; then
        cd "${agentdir}"
        go mod vendor
    fi
}

# ---------------------------------------------------------------------------
# build(): compile gpuagent and gpuctl
# ---------------------------------------------------------------------------
build() {
    local agentdir="${srcdir}/${_srcname}/sw/nic/gpuagent"
    local topdir="${srcdir}/${_srcname}/sw"
    # protoc-gen-gogofast (built during prepare) must be in PATH for gen-protos
    export GOPATH="${srcdir}/gotools"
    export PATH="${GOPATH}/bin:${PATH}"
    # Ensure the build-libs stamp exists (prepare() may have been skipped via -ef)
    local stamp_dir="${srcdir}/${_srcname}/sw/nic/build/${CARCH}/sim/out"
    mkdir -p "${stamp_dir}"
    touch "${stamp_dir}/.build_libs_done"
    # gpuagent C++ daemon via patched Makefile
    make -C "${agentdir}" TOPDIR="${topdir}" gpuagent

    # gpuctl pure-Go CLI (GOPROXY mirror avoids IPv6 timeout; vendored anyway)
    export GOPROXY="https://mirrors.aliyun.com/goproxy,direct"
    cd "${agentdir}"
    CGO_ENABLED=1 go build \
        -trimpath \
        -buildmode=pie \
        -ldflags="-s -w -linkmode=external -extldflags='-Wl,--as-needed,-z,relro,-z,now'" \
        -mod=vendor \
        -o "${srcdir}/gpuctl" \
        ./cli
}

# ---------------------------------------------------------------------------
# package(): install gpuagent + gpuctl
# ---------------------------------------------------------------------------
package() {
    local bindir="${srcdir}/${_srcname}/sw/nic/build/${CARCH}/sim/bin"

    install -Dm755 "${bindir}/gpuagent" "${pkgdir}/usr/bin/gpuagent"
    install -Dm755 "${srcdir}/gpuctl"   "${pkgdir}/usr/bin/gpuctl"

    # Remove embedded build-time rpath; strip spurious libresolv from gpuctl
    patchelf --remove-rpath "${pkgdir}/usr/bin/gpuagent" 2>/dev/null || true
    patchelf --remove-needed libresolv.so.2 "${pkgdir}/usr/bin/gpuctl" 2>/dev/null || true

    # systemd service unit
    install -Dm644 "${srcdir}/gpuagent.service" \
        "${pkgdir}/usr/lib/systemd/system/gpuagent.service"

    # Default environment config (backed up on upgrade)
    install -Dm644 "${srcdir}/gpuagent.conf" \
        "${pkgdir}/etc/gpuagent/gpuagent.conf"

    install -Dm644 "${srcdir}/${_srcname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
