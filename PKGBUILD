# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: robertfoster

pkgname=llama.cpp-git
pkgver=b9169.r3.1348f67c58
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggerganov/llama.cpp"
license=("MIT")
depends=(
  'gcc-libs'
  'glibc'
  'openssl'
)
makedepends=(
  'cmake'
  'git'
)
optdepends=(
  'python-huggingface-hub: convert_hf_to_gguf.py remote model downloads'
  'python-mistral-common: convert_hf_to_gguf.py Mistral model support'
  'python-numpy: convert_hf_to_gguf.py python script'
  'python-pytorch: convert_hf_to_gguf.py python script'
  'python-requests: convert_hf_to_gguf.py GGUF helper support'
  'python-sentencepiece: convert_hf_to_gguf.py tokenizer support'
  'python-tqdm: convert_hf_to_gguf.py GGUF helper support'
  'python-transformers: convert_hf_to_gguf.py tokenizer support'
  'python-yaml: convert_hf_to_gguf.py GGUF metadata support'
)
conflicts=("${pkgname%%-git}" 'libggml' 'libggml-git')
provides=("${pkgname%%-git}" 'libggml')
install="${pkgname}.install"
source=("${pkgname%%-git}::git+${url}"
  "llama.cpp.conf"
  "llama.cpp.service"
)

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname%%-git}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}/=" \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}/=" \
    -DLLAMA_BUILD_TESTS=0 \
    -DLLAMA_BUILD_WEBUI=0

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  # systemd
  install -D -m644 "${srcdir}/llama.cpp.conf" \
    "${pkgdir}/etc/conf.d/llama.cpp"
  install -D -m644 "${srcdir}/llama.cpp.service" \
    -t "${pkgdir}/usr/lib/systemd/system"

  install -Dm755 "${srcdir}/${pkgname%%-git}/convert_hf_to_gguf.py" \
    "${pkgdir}/usr/share/${pkgname%%-git}/convert_hf_to_gguf.py"
  install -d "${pkgdir}/usr/share/${pkgname%%-git}/conversion"
  cp -a "${srcdir}/${pkgname%%-git}/conversion/." \
    "${pkgdir}/usr/share/${pkgname%%-git}/conversion/"
  install -d "${pkgdir}/usr/share/${pkgname%%-git}/gguf-py/gguf"
  cp -a "${srcdir}/${pkgname%%-git}/gguf-py/gguf/." \
    "${pkgdir}/usr/share/${pkgname%%-git}/gguf-py/gguf/"
  rm -rf "${pkgdir}/usr/share/${pkgname%%-git}/gguf-py/gguf/scripts"
  cat > "${pkgdir}/usr/bin/convert_hf_to_gguf.py" <<'EOF'
#!/bin/sh
exec /usr/share/llama.cpp/convert_hf_to_gguf.py "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/convert_hf_to_gguf.py"

  install -Dm644 "${srcdir}/${pkgname%%-git}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            'dec46bda049ad0e48b6a27762524d9b728a273b01bdf93593dd78378094bcfd4')
