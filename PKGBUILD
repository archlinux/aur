# Maintainer: yms_hi <yms_hi@Outlook.com>
#
# Builds the Cangjie COMPILER SUITE from upstream main branches:
#   * cangjie_compiler: cjc frontend + bundled patched LLVM backend
#   * cangjie_runtime:  native runtime libraries
#   * stdlib:           standard library modules (bootstrapped with the cjc
#                       built in step one, exactly like upstream's own guide)
# Tools such as cjpm/cjfmt/lspserver/cjdb are deliberately NOT built
# ("compiler only" scope, matching how the companion cangjie-lts-bin package
# splits 'compiler' vs 'tools').
#
# NOTE ON CLANG 15
# ----------------
# Upstream mandates building with a clang >= 15.0.4 && < 16 as host compiler,
# neither Arch nor AUR ships one, and llvm.org provides no prebuilt Linux
# binaries for 15.x either. This PKGBUILD therefore vendors a self-contained
# clang-15 toolchain at build time:
#   * Ubuntu Noble (LTS, supported until ~2029) pool .debs for clang-15 +
#     LLVM-15 utilities, extracted into $srcdir (URLs + SHA256 pinned below).
#   * Matching GCC-13 C++ headers/libs (libstdc++-13-dev/libgcc-13-dev),
#     because old clang cannot parse modern libstdc++ headers shipped by Arch.
#   * Wrappers exporting LD_LIBRARY_PATH, adding `-nostdinc++` + `-isystem`
#     GCC-13 include dirs and `-B` crt dir (-nostdinc++ also prevents the old
#     driver's auto-detected modern GCC C++ dirs from breaking `#include_next`
#     in libstdc++'s C-compat shims such as <cfenv>), so build.py picks them
#     up from PATH directly.
# Only libedit comes from Arch repos (Debian sonames differ: shim provided).
# Additional compatibility shims shipped in this package dir:
#   * incfix: termio_compat.h (-include injected; glibc>=2.42 dropped struct
#     termio which compiler-rt still sizes) + linux/scc.h overlay include dir
#     (uapi header dropped from Arch's linux-api-headers).
#   * cangjie-flatbuffers-buildtargets.patch: pin the upstream-pinned
#     flatbuffers fork build to flatc+flatbuffers targets so its broken
#     'flattests' target never builds.
#
#
# Requirements for building: disk ~10 GB in $srcdir, RAM >= 8 GiB recommended.

# Ubuntu deb inventory (identical index order for both architectures):
#   clang-15            clang driver binaries/symlinks
#   libclang-common-15-dev   real driver executables + builtin headers/resources
#   libclang-cpp15t64   libclang-cpp.so.15
#   libllvm15t64        libLLVM-15.so.1
#   llvm-15             llvm-ar/llvm-ranlib/... utilities (for CMAKE_AR)
#   linux-libc-dev      userspace headers; supplies linux/scc.h (compiler-rt
#                       needs it, Arch's uapi set no longer installs it)
#   libgcc-13-dev       crtbegin*/libgcc statics for --gcc-style linking
#   libstdc++-13-dev    C++17 headers compatible with clang-15

_tc_base_llvmtoolchain="https://archive.ubuntu.com/ubuntu/pool/universe/l/llvm-toolchain-15"
_tc_base_gcc13="https://archive.ubuntu.com/ubuntu/pool/main/g/gcc-13"
_tc_ports_llvmtoolchain="https://ports.ubuntu.com/ubuntu-ports/pool/universe/l/llvm-toolchain-15"
_tc_ports_gcc13="https://ports.ubuntu.com/ubuntu-ports/pool/main/g/gcc-13"

_tc_sources_x86_64=(
  "clang-15_15.0.7-14build3_amd64.deb::${_tc_base_llvmtoolchain}/clang-15_15.0.7-14build3_amd64.deb"
  "libclang-common-15-dev_15.0.7-14build3_amd64.deb::${_tc_base_llvmtoolchain}/libclang-common-15-dev_15.0.7-14build3_amd64.deb"
  "libclang-cpp15t64_15.0.7-14build3_amd64.deb::${_tc_base_llvmtoolchain}/libclang-cpp15t64_15.0.7-14build3_amd64.deb"
  "libllvm15t64_15.0.7-14build3_amd64.deb::${_tc_base_llvmtoolchain}/libllvm15t64_15.0.7-14build3_amd64.deb"
  "llvm-15_15.0.7-14build3_amd64.deb::${_tc_base_llvmtoolchain}/llvm-15_15.0.7-14build3_amd64.deb"
  "linux-libc-dev_6.8.0-31.31_amd64.deb::https://archive.ubuntu.com/ubuntu/pool/main/l/linux/linux-libc-dev_6.8.0-31.31_amd64.deb"
  "libgcc-13-dev_13.2.0-23ubuntu4_amd64.deb::${_tc_base_gcc13}/libgcc-13-dev_13.2.0-23ubuntu4_amd64.deb"
  "libstdc++-13-dev_13.2.0-23ubuntu4_amd64.deb::${_tc_base_gcc13}/libstdc++-13-dev_13.2.0-23ubuntu4_amd64.deb"
)

_tc_sources_aarch64=(
  "clang-15_15.0.7-14build3_arm64.deb::${_tc_ports_llvmtoolchain}/clang-15_15.0.7-14build3_arm64.deb"
  "libclang-common-15-dev_15.0.7-14build3_arm64.deb::${_tc_ports_llvmtoolchain}/libclang-common-15-dev_15.0.7-14build3_arm64.deb"
  "libclang-cpp15t64_15.0.7-14build3_arm64.deb::${_tc_ports_llvmtoolchain}/libclang-cpp15t64_15.0.7-14build3_arm64.deb"
  "libllvm15t64_15.0.7-14build3_arm64.deb::${_tc_ports_llvmtoolchain}/libllvm15t64_15.0.7-14build3_arm64.deb"
  "llvm-15_15.0.7-14build3_arm64.deb::${_tc_ports_llvmtoolchain}/llvm-15_15.0.7-14build3_arm64.deb"
  "linux-libc-dev_6.8.0-31.31_arm64.deb::https://ports.ubuntu.com/ubuntu-ports/pool/main/l/linux/linux-libc-dev_6.8.0-31.31_arm64.deb"
  "libgcc-13-dev_13.2.0-23ubuntu4_arm64.deb::${_tc_ports_gcc13}/libgcc-13-dev_13.2.0-23ubuntu4_arm64.deb"
  "libstdc++-13-dev_13.2.0-23ubuntu4_arm64.deb::${_tc_ports_gcc13}/libstdc++-13-dev_13.2.0-23ubuntu4_arm64.deb"
)

_pkgver_fallback="1.3.0.alpha.02"

pkgname=cangjie-git
pkgver=1.3.0.alpha.02.r23.gc30fdb75c6
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Cangjie compiler built from main branch (frontend + bundled patched LLVM backend, compiler only)"
url="https://cangjie-lang.cn/"
license=('Apache-2.0')
depends=('openssl' 'gcc-libs')
makedepends=('git' 'python' 'cmake>=3.16.5' 'ninja' 'binutils' 'libedit')
provides=('cangjie-compiler')
conflicts=('cangjie-compiler')
options=('!lto')

# Only the .debs matching the building architecture are downloaded.
source=("cangjie_compiler::git+https://atomgit.com/Cangjie/cangjie_compiler.git#branch=main"
        "cangjie_runtime::git+https://atomgit.com/Cangjie/cangjie_runtime.git#branch=main")

case "${CARCH}" in
  x86_64)
    source+=("${_tc_sources_x86_64[@]}"
             'termio_compat.h'
             'cangjie-flatbuffers-buildtargets.patch'
             'cangjie-llvm-hosted.patch')
    sha256sums=('SKIP'
      'SKIP'
      'd7c0987187f9c3d782019c25b46fd93917daade274ca1b3cadf4dcc464daf1da'
      '59184ebbb1945cfd07fd839accf2723fa032879de4fab900a87c5e49ae20cfe0'
      'f8d97bedcaefa5db1bf4b7ee2fb30fabc27b9cabd80c0fc3cd56811829023aaa'
      'a486f3bdd974133edb049b5f3396f9e75cf7894b9e91008407bec9885a2f33d9'
      '0e5a8a1fc3cf9b21a0b262d39d53dd411c72e5df400a54787cde53210591bf70'
      '21c631ba4da3d38d92a133e28a8a14278e1e00174ed135a20661d1e532e05ca5'
      'd36c9acb969dd37fdc0496120715d8bba67a5cc43a0c2569717314e6ad80020c'
      '0e34b7a6ad0d9db6c718301a0c30a077590decbb31099d0fd6ac957222d77a94'
      'a754ee61be70ae6f0ddd80cfb7d0650659ab159dc23494beb792af0a750810d0'
      'b01e3b29f18e93dbb0d9beabfe0cc09c297778d4ff0980416f888b7ff6fc1ef7'
      '0ff28621d39418d51a93de899f75ddc9f0d0507ad3f342ee49c1b731235fbe7d')
    ;;
  aarch64)
    source+=("${_tc_sources_aarch64[@]}"
             'termio_compat.h'
             'cangjie-flatbuffers-buildtargets.patch'
             'cangjie-llvm-hosted.patch')
    sha256sums=('SKIP'
      'SKIP'
      '73c476da00aacd008c1ac4df085d7b9d8a2306aa2200902c66fe42a02313bac8'
      '6c97dc7c9b909c5d96a0404053a981e87b1dfc50cb8015a87c085c160d4f95a4'
      '7401c3dc40e417ad066319c823a1280f9a462717a0f990331349fc35d9cab5b5'
      'be03535c7b350f0854777c673260ae945bb23d90e4e1991913d1da4966d96130'
      '4784f954ded3f1188894f5da43d661bfa12c1bd1de18865f0d9f3e8634379ba0'
      '7fd438efa44a794b438e7dde7ac280166fb8d4b1cf7846393ce019714d8bb3e3'
      'f8faa5fee7174ec5fdd3eecbc27f38d530f7b500ad6763e2b57a9ac88622dc37'
      '30707afa137c328dd99c76e752068f144b124b655f4ddc649d42931e48b1acd4'
      'a754ee61be70ae6f0ddd80cfb7d0650659ab159dc23494beb792af0a750810d0'
      'b01e3b29f18e93dbb0d9beabfe0cc09c297778d4ff0980416f888b7ff6fc1ef7'
      '0ff28621d39418d51a93de899f75ddc9f0d0507ad3f342ee49c1b731235fbe7d')
    ;;
esac

pkgver() {
  cd "${srcdir}/cangjie_compiler" 2>/dev/null || {
    printf '%s\n' "${_pkgver_fallback}"
    return 0
  }

  local _desc
  if ! _desc="$(git describe --long --tags --match='v*' 2>/dev/null)"; then
    # no tag reachable: fall back to commit-count form
    printf '%s.r%s.g%s\n' \
      "${_pkgver_fallback}" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
    return 0
  fi

  printf '%s\n' "${_desc}" |
    sed -e 's/^v//' \
        -e 's/-\([0-9]\{1,\}-g[a-f0-9]\{7,\}\)$/.r\1/' \
        -e 's/-/./g'
}

prepare() {
  local _ma _tgt_bin="${srcdir}/hosttoolchain/bin"

  case "${CARCH}" in
    x86_64)  _ma="x86_64-linux-gnu";;
    aarch64) _ma="aarch64-linux-gnu";;
    *) return 1;;
  esac

  ## 1) Extract the vendored clang-15/GCC-13 toolchain from the debs.
  msg2 "Extracting vendored clang-15 toolchain..."
  mkdir -p "${_tgt_bin}" "${srcdir}/hosttoolchain/compat"
  local _deb
  for _deb in ./*.deb; do
    bsdtar -xOf "${_deb}" data.tar.zst | bsdtar -C "${srcdir}/hosttoolchain" -xf -
  done

  # Debian ships soname libedit.so.2 while Arch provides libedit.so.0.
  ln -sf /usr/lib/libedit.so.0 "${srcdir}/hosttoolchain/compat/libedit.so.2"

  # linux/scc.h vanished from modern kernel uapi sets (Arch's linux-api-headers);
  # compiler-rt's sanitizer tables still include it. Overlay include dir with
  # that single header from the vendored linux-libc-dev + termio_compat.h
  # (glibc >= 2.42 dropped struct termio; compiler-rt still sizes it).
  mkdir -p "${srcdir}/hosttoolchain/incfix/linux"
  install -m644 termio_compat.h "${srcdir}/hosttoolchain/incfix/termio_compat.h"
  ln -sf "../../usr/include/linux/scc.h" \
         "${srcdir}/hosttoolchain/incfix/linux/scc.h"

  # Pin the pinned flatbuffers fork to the targets cangjie actually consumes;
  # its flattests target ignores FLATBUFFERS_BUILD_TESTS=OFF.
  patch -d "${srcdir}/cangjie_compiler" -Np1 -s \
    < "${srcdir}/cangjie-flatbuffers-buildtargets.patch"

  # glibc>=2.42 + -ffreestanding hides malloc/strtol declarations inside
  # compiler-rt sanitizer builds; keep __STDC_HOSTED__=1 there.
  # (Applied AFTER the patched-LLVM clone below.)

  ## 2) Generate wrapper scripts; PATH ordering makes build.py pick them up.
  msg2 "Generating clang-15 wrapper scripts..."
  for _wname in clang clang++; do
  if [ "${_wname}" = "clang" ]; then
    # Plain-C / ASM entry point: no C++ standard-library injection here.
    # (.S targets in LLVM would otherwise receive -include/-isystem C++ flags
    # and fail inside the integrated assembler.)
cat > "${_tgt_bin}/${_wname}" <<WRAPPER_EOF
#!/bin/sh
TCROOT="\${TCROOT:-${srcdir}/hosttoolchain}"
export LD_LIBRARY_PATH="\$TCROOT/compat:\$TCROOT/usr/lib/${_ma}:\$TCROOT/usr/lib/llvm-15/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec "\$TCROOT/usr/lib/llvm-15/bin/${_wname}" \\
  -Wno-unused-command-line-argument \\
  -B "\$TCROOT/usr/lib/gcc/${_ma}/13" \\
  "\$@"
WRAPPER_EOF
  else
cat > "${_tgt_bin}/${_wname}" <<WRAPPER_EOF
#!/bin/sh
TCROOT="\${TCROOT:-${srcdir}/hosttoolchain}"
export LD_LIBRARY_PATH="\$TCROOT/compat:\$TCROOT/usr/lib/${_ma}:\$TCROOT/usr/lib/llvm-15/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec "\$TCROOT/usr/lib/llvm-15/bin/${_wname}" \\
  -nostdinc++ \\
  -Wno-unused-command-line-argument \\
  -isystem "\$TCROOT/incfix" \\
  -isystem "\$TCROOT/usr/include/c++/13" \\
  -isystem "\$TCROOT/usr/include/${_ma}/c++/13" \\
  -isystem "\$TCROOT/usr/include/backward" \\
  -B "\$TCROOT/usr/lib/gcc/${_ma}/13" \\
  -include "\$TCROOT/incfix/termio_compat.h" \\
  "\$@"
WRAPPER_EOF
  fi
done
  for _w in llvm-ar llvm-ranlib; do
    cat > "${_tgt_bin}/${_w}" <<WRAPPER_EOF
#!/bin/sh
TCROOT="\${TCROOT:-${srcdir}/hosttoolchain}"
export LD_LIBRARY_PATH="\$TCROOT/compat:\$TCROOT/usr/lib/${_ma}:\$TCROOT/usr/lib/llvm-15/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH}"
exec "\$TCROOT/usr/lib/llvm-15/bin/${_w}" "\$@"
WRAPPER_EOF
  done
  chmod +x "${_tgt_bin}"/*

  ## 3) Pre-fetch the patched-LLVM fork referenced by third_party/CMakeLists.txt
  ##    (cmake would otherwise clone it itself into the build dir).
  msg2 "Fetching cangjie patched-LLVM fork..."
  if [ ! -d "${srcdir}/cangjie_compiler/third_party/llvm-project" ]; then
    git -C "${srcdir}/cangjie_compiler" \
      clone --depth 1 --branch main \
      https://gitcode.com/Cangjie/llvm-project.git \
      third_party/llvm-project
  fi

  ## 4) Apply llvm-fork fixups (after the clone exists).
  # Idempotent: skip when a previous run already patched these files
  # (the nested llvm fork is untracked by makepkg's git checkout).
  local _llvmdir="${srcdir}/cangjie_compiler/third_party/llvm-project"
  if ! grep -qs '__STDC_HOSTED__=1' "${_llvmdir}/compiler-rt/lib/dfsan/CMakeLists.txt"; then
    patch -d "${_llvmdir}" -Np1 -s \
      < "${srcdir}/cangjie-llvm-hosted.patch"
  fi
}

build() {
  export PATH="${srcdir}/hosttoolchain/bin:${PATH}"
  export TCROOT="${srcdir}/hosttoolchain"
  # Neutralize makepkg-injected flags: sub-projects (demangler, flatbuffers,
  # llvm...) inherit them via environment and upstream expects its own flag set.
  unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS CMAKE_C_FLAGS CMAKE_CXX_FLAGS

  local _jobs _ncpu
  _ncpu="$(nproc)"
  if [[ "${MAKEFLAGS}" =~ -j([0-9]+) ]]; then
    _jobs="${BASH_REMATCH[1]}"
  else
    # linking LLVM is memory hungry; cap the default on big machines
    _jobs=$(( _ncpu > 8 ? 8 : _ncpu ))
  fi

  # SDK version (cjc --version, runtime & stdlib alike) per policy:
  #   <last v* tag without leading v> + '+' + <8-hex head hash>
  local _sdk_ver _ctag _chash _arch _rt_out
  case "${CARCH}" in
    x86_64)  _arch="x86_64";;
    aarch64) _arch="aarch64";;
  esac

  cd "${srcdir}/cangjie_compiler"

  _ctag="$(git describe --tags --abbrev=0 --match='v*' 2>/dev/null || true)"
  _chash="$(git rev-parse --short=8 HEAD)"
  if [ -n "${_ctag}" ]; then
    _sdk_ver="${_ctag#v}+${_chash}"
  else
    _sdk_ver="${_pkgver_fallback}+${_chash}"
  fi
  msg2 "SDK/cjc version: ${_sdk_ver}"

  ## Stage A: compiler frontend + bundled patched LLVM backend.
  python3 build.py build -t release \
    --product cjc \
    -v "${_sdk_ver}" \
    --no-tests \
    --jobs "${_jobs}"
  python3 build.py install

  ## Stage B: native runtime libraries.
  cd "${srcdir}/cangjie_runtime/runtime"
  python3 build.py build -t release -v "${_sdk_ver}"
  python3 build.py install

  ## Merge runtime outputs into the compiler tree BEFORE building stdlib,
  ## exactly like upstream's SDK guide ("cp -R output/common/<...>/{lib,runtime}
  ## cangjie_compiler/output/"): lib/runtime each carry an arch subdir which
  ## lands at output/lib/linux_<arch>_cjnative/, output/runtime/lib/...
  local _rt_out="${srcdir}/cangjie_runtime/runtime/output/common/linux_release_${_arch}"
  mkdir -p "${srcdir}/cangjie_compiler/output/lib" \
           "${srcdir}/cangjie_compiler/output/runtime/lib"
  cp -aT "${_rt_out}/lib"      "${srcdir}/cangjie_compiler/output/lib"
  cp -aT "${_rt_out}/runtime"  "${srcdir}/cangjie_compiler/output/runtime"


  ## Stage C: standard library, bootstrapped with the cjc from stage A
  ## (same sequence as upstream's SDK build guide).
  local _rt_out="${srcdir}/cangjie_runtime/runtime/output/common/linux_release_${_arch}"
  (
    source "${srcdir}/cangjie_compiler/output/envsetup.sh"
    cd "${srcdir}/cangjie_runtime/stdlib"
    # Fresh configure: a previous attempt may have left a CMakeCache with
    # different --target-lib values.
    rm -rf build
    python3 build.py build -t release \
      --target-lib="${srcdir}/cangjie_runtime/runtime/output"
    python3 build.py install
  )

  ## Final merge of stdlib output over the compiler tree (upstream:
  ## "cp -R output/* cangjie_compiler/output/"). This becomes the SDK root.
  cp -aT "${srcdir}/cangjie_runtime/stdlib/output/." "${srcdir}/cangjie_compiler/output/"
}

package() {
  local _opt="${pkgdir}/opt/cangjie-git"

  install -d "${_opt}" \
              "${pkgdir}/usr/share/licenses/${pkgname}" \
              "${pkgdir}/usr/share/doc/${pkgname}"

  msg2 "Installing compiler suite output..."
  cp -a "${srcdir}/cangjie_compiler/output/." "${_opt}/"

  # Normalize permissions (keep exec bits via X).
  find "${_opt}" -type d -exec chmod 755 {} +
  find "${_opt}" -type f -exec chmod u+rwX,go+rX,go-w {} +

  install -Dm644 "${srcdir}/cangjie_compiler/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/cangjie_runtime/LICENSE" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-runtime"
  install -Dm644 "${srcdir}/cangjie_compiler/Open_Source_Software_Notice.docx" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/Open_Source_Software_Notice.docx"
  install -Dm644 "${srcdir}/cangjie_compiler/README.md" \
                 "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  echo "Usage: source /opt/cangjie-git/envsetup.sh && cjc -v" \
      > "${pkgdir}/usr/share/doc/${pkgname}/USAGE"
}

# vim:set ts=2 sw=2 et:
