# Maintainer:  dreieck
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Matt Harrison <matt@harrison.us.com>

## `PKGBUILD` based on the `PKGBUILD` for the package `ollama-rocm-git`.

_build_generic=true
_build_openmpi=true
_build_openblas=true
_build_clblas=false # 2024-04-17: Fails to link with
                    # ```
                    # /usr/bin/ld: /var/cache/makepkg/build/ollama-git/src/ollama-clblas/llm/build/linux/x86_64_static/libllama.a(ggml-opencl.cpp.o): in function `ggml_backend_opencl_buffer_get_tensor(ggml_backend_buffer*, ggml_tensor const*, void*, unsigned long, unsigned long)':
                    # ggml-opencl.cpp:(.text+0x46): undefined reference to `clEnqueueReadBuffer'
                    # ```
                    # and more errors.
_build_vulkan=true

# Those variables skip CUDA and ROCm build, introduced in https://github.com/ollama/ollama/pull/4462/files.
export OLLAMA_SKIP_CUDA_GENERATE=true
export OLLAMA_SKIP_ROCM_GENERATE=true
export ONEAPI_ROOT='/tmp/does_not_exist/this/path/should/not/exist/to/force-off/oneapi/build'

_name="ollama"
_pkgbase="${_name}-nogpu"
pkgbase="${_pkgbase}-git"
pkgname=()
if "${_build_generic}"; then
  pkgname+=("${_name}-generic-git")
fi
if "${_build_openmpi}"; then
  pkgname+=("${_name}-openmpi-git")
fi
if "${_build_openblas}"; then
  pkgname+=("${_name}-openblas-git")
fi
if "${_build_clblas}"; then
  pkgname+=("${_name}-clblas-git")
fi
if "${_build_vulkan}"; then
  pkgname+=("${_name}-vulkan-git")
fi
pkgdesc='Create, run and share large language models (LLMs). Package(s) without dedicated GPU offloading (no CUDA, no ROCm, no SYCL).'
pkgver=0.2.8+5.r3186.20240722.c7808926
pkgrel=1
arch=(
  'armv7h'
  'aarch64'
  'i686'
  'x86_64'
)
url='https://github.com/jmorganca/ollama'
license=(
  "MIT"
)
depends=(
  'gcc-libs'
  'glibc'
  'openssl'
)
makedepends=(
  "bash"
  "cmake"
  "git"
  "go"
)
if "${_build_openmpi}"; then
  makedepends+=("openmpi")
fi
if "${_build_openblas}"; then
  makedepends+=("openblas")
fi
if "${_build_clblas}"; then
  makedepends+=("clblast")
fi
if "${_build_vulkan}"; then
  makedepends+=()
fi
source=(
  "${_name}::git+${url}.git"
  "llama.cpp::git+https://github.com/ggerganov/llama.cpp.git" # Submodule
  "ollama.service"
  "sysusers.conf"
  "tmpfiles.d"
)
b2sums=(
  'SKIP'  # ollama (git)
  'SKIP'  # llama.cpp (git)
  'a773bbf16cf5ccc2ee505ad77c3f9275346ddf412be283cfeaee7c2e4c41b8637a31aaff8766ed769524ebddc0c03cf924724452639b62208e578d98b9176124'  # ollama.service
  '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'  # sysusers.conf
  'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed'  # tmpfiles.d
)
options+=('emptydirs')
#options+=('!lto') # openmpi variant fails to link _without_ LTO.

_check_cpufeature() {
  ## Checks if the host CPU supports the feature passed as argument "$1".
  #  If yes, return "ON" to stdout.
  #  If not yes, return "OFF" to stdout.

  if grep -qE "\<$1" /proc/cpuinfo; then
    printf '%s' 'ON'
  else
    printf '%s' 'OFF'
  fi
}

_check_makepkgpotion() {
  ## Checks if the given makepkg option is set in `options`.
  #  If yes, return "ON" to stdout.
  #  If not yes, return "OFF" to stdout.

  _checkfor="$1"
  _result='OFF'
  for _option in "${options[@]}"; do
    if grep -qw "${_checkfor}" <<<"${_option}"; then
      _result="ON"
    fi
    if grep -qw "\!${_checkfor}" <<<"${_option}" 2>/dev/null; then
      _result="OFF"
    fi
  done
  echo "${_result}"
}

#-DBUILD_SHARED_LIBS=ON
#-DLLAMA_STATIC=ON
#-DLLAMA_QKK_64=ON
_cmake_options_common="
  -DBUILD_TESTING=ON
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_INSTALL_PREFIX=/usr
  -DLLAMA_ACCELERATE=ON
  -DLLAMA_ALL_WARNINGS=OFF
  -DLLAMA_ALL_WARNINGS_3RD_PARTY=OFF
  -DLLAMA_FATAL_WARNINGS=OFF
  -DLLAMA_AVX="$(_check_cpufeature avx)" -DLLAMA_AVX2="$(_check_cpufeature avx2)" -DLLAMA_AVX512="$(_check_cpufeature avx512)" -DLLAMA_AVX512_VBMI="$(_check_cpufeature avx512vbmi)" -DLLAMA_AVX512_VNNI="$(_check_cpufeature avx512_vnni)" -DLLAMA_F16C="$(_check_cpufeature f16c)" -DLLAMA_FMA="$(_check_cpufeature fma)"
  -DLLAMA_BUILD_EXAMPLES=ON -DLLAMA_BUILD_SERVER=ON -DLLAMA_BUILD_TESTS=ON
  -DLLAMA_CPU_HBM=OFF -DLLAMA_CUBLAS=OFF -DLLAMA_CUDA=OFF -DLLAMA_HIPBLAS=OFF -DLLAMA_HIP_UMA=OFF -DLLAMA_METAL=OFF -DLLAMA_SYCL=OFF -DLLAMA_KOMPUTE=OFF
  -DLLAMA_LTO="$(_check_makepkgpotion lto)"
  -DLLAMA_GPROF=OFF -DLLAMA_PERF=OFF -DLLAMA_SANITIZE_ADDRESS=OFF -DLLAMA_SANITIZE_THREAD=OFF -DLLAMA_SANITIZE_UNDEFINED=OFF 
  -DLLAMA_SERVER_SSL=ON -DLLAMA_SERVER_VERBOSE=ON
"
_cmake_options_blas="-DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=openblas"
_cmake_options_mpi="-DLLAMA_MPI=ON"
_cmake_options_clblas="-DLLAMA_CLBLAST=ON"
_cmake_options_vulkan="-DLLAMA_VULKAN=ON -DLLAMA_VULKAN_CHECK_RESULTS=OFF -DLLAMA_VULKAN_DEBUG=OFF -DLLAMA_VULKAN_RUN_TESTS=OFF -DLLAMA_VULKAN_VALIDATE=OFF"

prepare() {
  export GOPATH="${srcdir}/go"
  cd "${srcdir}/${_name}"

  # Add submodules
  git submodule init
  git config --local submodule.llama.cpp.url "${srcdir}/llama.cpp"
  git -c protocol.file.allow=always submodule update

  # Generate git logfile for later installation into the documentation directory
  git log > git.log

  # Turn LTO on and set the build type to Release
  #sed -i 's,T_CODE=on,T_CODE=on -D LLAMA_LTO=on -D CMAKE_BUILD_TYPE=Release,g' llm/generate/gen_linux.sh

  # Display a more helpful error message
  sed -i "s|could not connect to ollama server, run 'ollama serve' to start it|ollama is not running, try 'systemctl start ollama' or 'ollama serve'|g" cmd/cmd.go

  printf '%s\n' "   > Downloading go dependencies ..."
  go get

  for _variant in "${pkgname[@]}"; do
    _variant="${_variant%-git}"
    printf '%s\n' "   > Creating source directory for ${_variant} ..."
    cp -r "${srcdir}/${_name}" "${srcdir}/${_variant}"
  done
}

pkgver() {
  cd "${srcdir}/${_name}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  export GOPATH="${srcdir}/go"

  if "${_build_generic}"; then
    cd "${srcdir}/ollama-generic"

    export OLLAMA_CUSTOM_CPU_DEFS="${_cmake_options_common}"

    printf '\n'
    printf '%s\n' "   > Compiling generic variant ..."
    printf '\n'
    go generate ./...
    # cp llm/build/linux/x86_64/cpu/libllama.a llm/build/linux/x86_64_static/
    # cp llm/build/linux/x86_64_static/libllama.so llm/build/linux/x86_64/cpu/
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=${pkgver}"
  fi


  if "${_build_openmpi}"; then
    cd "${srcdir}/ollama-openmpi"

    export OLLAMA_CUSTOM_CPU_DEFS="${_cmake_options_common} ${_cmake_options_mpi}"

    printf '\n'
    printf '%s\n' "   > Compiling OpenMPI variant ..."
    printf '\n'
    go generate ./...
    # cp llm/build/linux/x86_64/cpu/libllama.a llm/build/linux/x86_64_static/
    # cp llm/build/linux/x86_64_static/libllama.so llm/build/linux/x86_64/cpu/
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=${pkgver}"
  fi


  if "${_build_openblas}"; then
    cd "${srcdir}/ollama-openblas"

    export OLLAMA_CUSTOM_CPU_DEFS="${_cmake_options_common} ${_cmake_options_blas}"

    printf '\n'
    printf '%s\n' "   > Compiling openblas variant ..."
    printf '\n'
    go generate ./...
    # cp llm/build/linux/x86_64/cpu/libllama.a llm/build/linux/x86_64_static/
    # cp llm/build/linux/x86_64_static/libllama.so llm/build/linux/x86_64/cpu/
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=${pkgver}"
  fi


  if "${_build_clblas}"; then
    cd "${srcdir}/ollama-clblas"

    export OLLAMA_CUSTOM_CPU_DEFS="${_cmake_options_common} ${_cmake_options_clblas}"

    printf '\n'
    printf '%s\n' "   > Compiling clblas variant ..."
    printf '\n'
    go generate ./...
    # cp llm/build/linux/x86_64/cpu/libllama.a llm/build/linux/x86_64_static/
    # cp llm/build/linux/x86_64_static/libllama.so llm/build/linux/x86_64/cpu/
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=${pkgver}"
  fi


  if "${_build_vulkan}"; then
    cd "${srcdir}/ollama-vulkan"

    export OLLAMA_CUSTOM_CPU_DEFS="${_cmake_options_common} ${_cmake_options_vulkan}"

    printf '\n'
    printf '%s\n' "   > Compiling vulkan variant ..."
    printf '\n'
    go generate ./...
    # cp llm/build/linux/x86_64/cpu/libllama.a llm/build/linux/x86_64_static/
    # cp llm/build/linux/x86_64_static/libllama.so llm/build/linux/x86_64/cpu/
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-buildid='' -ldflags="-X=github.com/jmorganca/ollama/version.Version=${pkgver}"
  fi
}

check() {
  export GOPATH="${srcdir}/go"
  for _variant in "${pkgname[@]}"; do
    _variant="${_variant%-git}"
    printf '\n'
    printf '%s\n' "   > Running tests for ${_variant} ..."
    printf '\n'
    cd "${srcdir}/${_variant}"
    go test ./api ./format
    ./ollama --version > /dev/null
  done
}

package_ollama-generic-git() {
  pkgdesc="Create, run and share large language models (LLMs). CPU optimisation only."
  depends+=(
  )
  optdepends=()
  provides=(
    "${_name}=${pkgver}"
    "${_name}-git=${pkgver}"
  )
  conflicts=(
    "${_name}"
  )
  _variant="ollama-generic"
  cd "${srcdir}/${_variant}"

  install -Dvm755 -t "${pkgdir}/usr/bin" 'ollama'
  install -dvm755 "${pkgdir}/var/lib/ollama"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/ollama.service"
  install -Dvm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
  install -Dvm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_name}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_name}/LICENSE"
}

package_ollama-openmpi-git() {
  pkgdesc="Create, run and share large language models (LLMs). CPU optimisation with openMPI."
  depends+=(
  )
  optdepends=()
  provides=(
    "${_name}=${pkgver}"
    "${_name}-git=${pkgver}"
  )
  conflicts=(
    "${_name}"
  )
  _variant="ollama-openmpi"
  cd "${srcdir}/${_variant}"

  install -Dvm755 -t "${pkgdir}/usr/bin" 'ollama'
  install -dvm755 "${pkgdir}/var/lib/ollama"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/ollama.service"
  install -Dvm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
  install -Dvm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_name}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_name}/LICENSE"
}

package_ollama-openblas-git() {
  pkgdesc="Create, run and share large language models (LLMs). CPU optimisation with openblas."
  depends+=(
  )
  optdepends=()
  provides=(
    "${_name}=${pkgver}"
    "${_name}-git=${pkgver}"
  )
  conflicts=(
    "${_name}"
  )
  _variant="ollama-openblas"
  cd "${srcdir}/${_variant}"

  install -Dvm755 -t "${pkgdir}/usr/bin" 'ollama'
  install -dvm755 "${pkgdir}/var/lib/ollama"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/ollama.service"
  install -Dvm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
  install -Dvm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_name}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_name}/LICENSE"
}

package_ollama-clblas-git() {
  pkgdesc="Create, run and share large language models (LLMs). With clblast backend."
  depends+=(
    'clblast'
  )
  optdepends=()
  provides=(
    "${_name}=${pkgver}"
    "${_name}-git=${pkgver}"
  )
  conflicts=(
    "${_name}"
  )
  _variant="ollama-clblas"
  cd "${srcdir}/${_variant}"

  install -Dvm755 -t "${pkgdir}/usr/bin" 'ollama'
  install -dvm755 "${pkgdir}/var/lib/ollama"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/ollama.service"
  install -Dvm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
  install -Dvm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_name}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_name}/LICENSE"
}

package_ollama-vulkan-git() {
  pkgdesc="Create, run and share large language models (LLMs). With vulkan backend."
  depends+=(
  )
  optdepends=()
  provides=(
    "${_name}=${pkgver}"
    "${_name}-git=${pkgver}"
  )
  conflicts=(
    "${_name}"
  )
  _variant="ollama-vulkan"
  cd "${srcdir}/${_variant}"

  install -Dvm755 -t "${pkgdir}/usr/bin" 'ollama'
  install -dvm755 "${pkgdir}/var/lib/ollama"
  install -Dvm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/ollama.service"
  install -Dvm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/ollama.conf"
  install -Dvm644 "${srcdir}/tmpfiles.d" "${pkgdir}/usr/lib/tmpfiles.d/ollama.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_name}" git.log README.md
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_name}/LICENSE"
}
