# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck/)

_upstreamname='ggml'
_pkgbase="lib${_upstreamname}"
pkgname="${_pkgbase}-git"
pkgver=r794.20240322.f5c9599
pkgrel=1
pkgdesc="Tensor library for machine learning. Used by llama.cpp and whisper.cpp."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/ggerganov/ggml"
license=(
  'MIT'
)
depends=(
  'clblast'
  'glibc'
  'openblas'
)
makedepends=(
  'cmake'
  'git'
)
checkdepends=()
provides=(
  "${_upstreamname}"
  "${_pkgbase}"
  "${_pkgbase}-clblas"
  "${_pkgbase}-openblas"
)
conflicts=(
  "${_upstreamname}"
  "${_pkgbase}"
)
source=(
  "${_pkgbase}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

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

prepare() {
  cd "${srcdir}/${_pkgbase}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgbase}"

  # _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  cmake -S "${_pkgbase}" -B 'build' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS='ON' \
    -DGGML_ALL_WARNINGS='OFF' \
    -DGGML_ALL_WARNINGS_3RD_PARTY='OFF' \
    -DGGML_AVX="$(_check_cpufeature avx)" \
    -DGGML_AVX2="$(_check_cpufeature avx2)" \
    -DGGML_AVX512="$(_check_cpufeature avx512)" \
    -DGGML_AVX512_VBMI="$(_check_cpufeature avx512vbmi)" \
    -DGGML_AVX512_VNNI="$(_check_cpufeature avx512_vnni)" \
    -DGGML_BUILD_EXAMPLES='ON' \
    -DGGML_BUILD_TESTS='ON' \
    -DGGML_CLBLAST='ON' \
    -DGGML_CUBLAS='OFF' \
    -DGGML_F16C="$(_check_cpufeature f16c)" \
    -DGGML_FMA="$(_check_cpufeature fma)" \
    -DGGML_HIPBLAS='OFF' \
    -DGGML_METAL='OFF' \
    -DGGML_NO_ACCELERATE='OFF' \
    -DGGML_OPENBLAS='ON'

  make -C build
}

check() {
  cd "${srcdir}"

  make -C build test || true
  ## NOTE: On my machine, AMD 7840U/ gfx1103, 'test-timestep_embedding' _sometimes_ fails with 'ptrace: Operation not permitted.'.
  #  See https://github.com/ggerganov/ggml/issues/772.
  #  So for now, we force-finish successfully in any case.
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgbase}"

  install -dvm755    "${pkgdir}/usr/share/doc/${_pkgbase}/"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" git.log README.md
  cp -rv  'docs'     "${pkgdir}/usr/share/doc/${_pkgbase}/"

  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgbase}/LICENSE"
}
