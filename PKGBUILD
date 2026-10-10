# Maintainer: monsoon235 <29970829+monsoon235@users.noreply.github.com>
# Contributor: richc <admin+aur@sys.corbet.ch>
# Repackages the official upstream SYCL FP16 binaries and the oneDNN runtime
# they need. The launcher loads the installed split oneAPI runtime environment.
pkgname=llama.cpp-sycl-bin
pkgver=b11552
pkgrel=1
pkgdesc='llama.cpp upstream prebuilt binaries with the SYCL backend'
arch=('x86_64')
url='https://github.com/ggml-org/llama.cpp'
license=('MIT' 'Apache-2.0')
depends=(
  'glibc'
  'gcc-libs'
  'openssl'
  'curl'
  'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
  'intel-oneapi-mkl-sycl'
  'intel-oneapi-tbb'
  'intel-oneapi-umf'
  'intel-compute-runtime'
  'level-zero-loader'
  'ocl-icd'
)
makedepends=('patchelf')
provides=('llama.cpp-sycl')
options=('!strip' '!debug')
_syclprec=fp16
_onednnver=2026.0.2-40
_onednnfile="intel-oneapi-dnnl-2026.0-${_onednnver}_amd64.deb"
_llamasrc="llama-${pkgver}-sycl-fp16.tar.gz"
source=(
  "${_llamasrc}::https://github.com/ggml-org/llama.cpp/releases/download/${pkgver}/llama-${pkgver}-bin-ubuntu-sycl-${_syclprec}-x64.tar.gz"
  "https://apt.repos.intel.com/oneapi/pool/main/${_onednnfile}"
  'llama-sycl'
)
noextract=("${_llamasrc}" "${_onednnfile}")
sha256sums=(
  '76858e41ede0423716cc788e20c1b564912989ec00524d926e7851f452d4b1b3'
  '4b0f7e23415a695f204f8080328977225759534158d813c2225403f8851433e8'
  'SKIP'
)

prepare() {
  mkdir -p sycl
  bsdtar -xf "${_llamasrc}" -C sycl
}

build() {
  local d="$srcdir/sycl/llama-${pkgver}"
  # Upstream embeds the oneAPI versions used for its build. Resolve the
  # installed split runtime through the launcher instead.
  find "$d" -maxdepth 1 -name '*.so*' -type f -exec patchelf --set-rpath '$ORIGIN' {} +
  find "$d" -maxdepth 1 -type f -executable ! -name '*.so*' -exec patchelf --set-rpath '$ORIGIN' {} +
}

package() {
  local d="$srcdir/sycl/llama-${pkgver}"
  local dnnl_root="$srcdir/onednn"
  install -d "$pkgdir/usr/lib/llama-sycl" "$pkgdir/usr/bin"
  cp -a "$d"/lib*.so* "$pkgdir/usr/lib/llama-sycl/"
  local executable
  for executable in "$d"/llama-*; do
    [[ -f "$executable" && -x "$executable" && "$executable" != *.so* ]] || continue
    install -m755 "$executable" "$pkgdir/usr/lib/llama-sycl/${executable##*/}"
  done
  install -Dm755 "$srcdir/llama-sycl" "$pkgdir/usr/bin/llama-sycl"

  install -d "$dnnl_root"
  ar p "$srcdir/$_onednnfile" data.tar.xz | tar -xJf - -C "$dnnl_root"
  install -Dm755 "$dnnl_root/opt/intel/oneapi/dnnl/2026.0/lib/libdnnl.so.3.11" \
    "$pkgdir/usr/lib/llama-sycl/libdnnl.so.3.11"
  ln -s libdnnl.so.3.11 "$pkgdir/usr/lib/llama-sycl/libdnnl.so.3"
  ln -s libdnnl.so.3 "$pkgdir/usr/lib/llama-sycl/libdnnl.so"

  install -Dm644 "$d/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$dnnl_root/opt/intel/oneapi/dnnl/2026.0/share/doc/dnnl/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/oneDNN-LICENSE"
  install -Dm644 "$dnnl_root/opt/intel/oneapi/dnnl/2026.0/share/doc/dnnl/THIRD-PARTY-PROGRAMS" \
    "$pkgdir/usr/share/licenses/$pkgname/oneDNN-THIRD-PARTY-PROGRAMS"
}
