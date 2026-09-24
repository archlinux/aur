# Maintainer: ExplodingDragon <ExplodingFKL@gmail.com>

pkgname=kimodo.cpp
pkgver=5679ff1
pkgrel=1
pkgdesc='GGML/C++ implementation of NVIDIA Kimodo text-to-motion with Vulkan and web demo'
arch=('x86_64')
url='https://github.com/localai-org/kimodo.cpp'
license=('Apache-2.0')

_commit='5679ff19ba0a522c0b0516e9a9d402fe1af2c027'
_ggml_commit='8c63e70982c95ceb862e3a1073a2c1beef75d60a'

# The Vulkan backend is built in, so the loader is a runtime dependency even
# when KIMODO_BACKEND=cpu is selected at runtime.
depends=(
  'bash'
  'glibc'
  'libgcc'
  'libstdc++'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'git'
  'go>=1.26'
  'ninja'
  'patchelf'
  'shaderc'
  'vulkan-headers'
  'spirv-headers'
)
optdepends=(
  'python-huggingface-hub: download verified GGUF model bundles with kimodo-download-weights'
  'vulkan-radeon: Vulkan driver for AMD GPUs'
  'vulkan-intel: Vulkan driver for Intel GPUs'
  'nvidia-utils: Vulkan driver for NVIDIA GPUs'
)

install='kimodo.cpp.install'
backup=('etc/conf.d/kimodo.cpp')

source=(
  "kimodo.cpp::git+https://github.com/localai-org/kimodo.cpp.git#commit=${_commit}"
  "ggml::git+https://github.com/ggml-org/ggml.git#commit=${_ggml_commit}"
  'kimodo.cpp.service'
  'kimodo.cpp.conf'
  'kimodo.cpp.sysusers'
  'kimodo.cpp.tmpfiles'
  'kimodo-service'
  '0001-demo-respect-runtime-env.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  '8fa14bfd90c684803aaa6be9afc32d763306b94878b87e328faef60f5ea6f3fe'
  '28c6034931aeea8706b2f4e28ca60daf96a78f7508d2fa2a95e9a03488a57327'
  '3264a21bb83e0a15480f5a0fda6895c25543e0d61446ea82cc919c508f642563'
  '4ef40ef2849ce8ec9a1263c1d4f1b3e71160c3a8aecf2c753d266e85c125a0d6'
  '10f3ba496301dcfed6b1f218069028c5a8425f0b870537d671cf250cb0a2463f'
  '324c32702687d888c6c8ab594b73f52aa7eacbcae0fd5e8a74fc2fc863d5089e'
)

prepare() {
  local _src="${srcdir}/kimodo.cpp"

  # makepkg does not recursively fetch Git submodules for VCS sources. Fetch
  # GGML as its own commit-pinned Git source, then attach it at the upstream
  # submodule path. All network access therefore stays in source retrieval.
  rm -rf "${_src}/ggml"
  ln -s "${srcdir}/ggml" "${_src}/ggml"

  cd "${_src}"
  patch -Np1 -i "${srcdir}/0001-demo-respect-runtime-env.patch"
}
build() {
  local _src="${srcdir}/kimodo.cpp"
  cd "${_src}"

  cmake -S . -B build/release -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTING=OFF \
    -DKIMODO_BUILD_TESTS=OFF \
    -DKIMODO_ENABLE_VULKAN=ON
  cmake --build build/release

  # The demo is a standalone Go HTTP server which launches kmd-generate.
  go build -buildmode=pie -trimpath -buildvcs=false \
    -ldflags='-s -w' \
    -o build/release/kimodo-demo ./demo
}

package() {
  local _src="${srcdir}/kimodo.cpp"
  cd "${_src}"

  local _bindir='build/release'
  local _private_libdir="${pkgdir}/usr/lib/${pkgname}"
  local _tools=(
    kmd-generate
    kmd-encode
    kmd-inspect
    kmd-pack-text
    kmd-quantize-text
    kmd-sample-embedding
    kmd-sample-fixture
  )

  local tool
  for tool in "${_tools[@]}"; do
    install -Dm755 "${_bindir}/${tool}" "${pkgdir}/usr/bin/${tool}"
  done
  install -Dm755 "${_bindir}/kimodo-demo" "${pkgdir}/usr/bin/kimodo-demo"

  # Upstream currently has no install() rules. Keep its pinned GGML private to
  # kimodo.cpp instead of colliding with Arch's independently packaged GGML.
  install -d "${_private_libdir}"
  install -Dm755 "${_bindir}/libkimodo.so" "${_private_libdir}/libkimodo.so"

  local lib
  while IFS= read -r -d '' lib; do
    cp -a "${lib}" "${_private_libdir}/"
  done < <(find "${_bindir}/ggml" \( -type f -o -type l \) -name 'libggml*.so*' -print0)

  # Native executables resolve only the exact private GGML/libkimodo build.
  for tool in "${_tools[@]}"; do
    patchelf --set-rpath '$ORIGIN/../lib/kimodo.cpp' "${pkgdir}/usr/bin/${tool}"
  done
  while IFS= read -r -d '' lib; do
    [[ -L "${lib}" ]] || patchelf --set-rpath '$ORIGIN' "${lib}"
  done < <(find "${_private_libdir}" \( -type f -o -type l \) -name '*.so*' -print0)

  install -d "${pkgdir}/usr/include/kimodo"
  install -m644 include/kimodo/* "${pkgdir}/usr/include/kimodo/"

  # Keep the upstream downloader available, but leave model weights outside the
  # package because of their size and separate model licences.
  install -Dm755 scripts/download_gguf_weights.sh \
    "${pkgdir}/usr/bin/kimodo-download-weights"

  install -Dm755 "${srcdir}/kimodo-service" \
    "${pkgdir}/usr/lib/${pkgname}/kimodo-service"
  install -Dm644 "${srcdir}/kimodo.cpp.service" \
    "${pkgdir}/usr/lib/systemd/system/kimodo.cpp.service"
  install -Dm644 "${srcdir}/kimodo.cpp.conf" \
    "${pkgdir}/etc/conf.d/kimodo.cpp"
  install -Dm644 "${srcdir}/kimodo.cpp.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/kimodo.cpp.conf"
  install -Dm644 "${srcdir}/kimodo.cpp.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/kimodo.cpp.conf"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
