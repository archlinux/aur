# Maintainer: Piotr Jan Balwierz <author's surname at google's email service>

pkgname=bwa-mem3
pkgver=0.17.0
pkgrel=1
pkgdesc='Short-read aligner derived from bwa-mem2 with correctness fixes, performance improvements and methylation alignment'
arch=('x86_64' 'aarch64')
url='https://github.com/fg-labs/bwa-mem3'
# bwa-mem3 (MIT) statically links its vendored htslib (MIT, BSD-3-Clause),
# mimalloc (MIT), zlib-ng (Zlib), libsais (Apache-2.0) and, on aarch64,
# sse2neon (MIT).
license=('MIT' 'BSD-3-Clause' 'Apache-2.0' 'Zlib')
depends=('glibc' 'libstdc++' 'libgcc' 'zlib' 'libdeflate' 'openmp')
makedepends=('clang' 'lld' 'llvm' 'cmake' 'autoconf' 'automake')
# Upstream builds with LTO=full (clang + ld.lld) itself; makepkg's GCC-style
# -flto=auto would conflict with it.
options=('!lto')
# The plain GitHub tag archive lacks the git submodules; upstream publishes a
# tarball that includes them.
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/Source_code_including_submodules.tar.gz"
        'mimalloc-free-null-before-init.patch')
sha256sums=('748a49e9d2009cc317f944e80a6b7e8f9d05a0efe44cacc050500f86de6f05c6'
            '05fa3a8216cf7a5bfdf5945f084f7fb8e65bdde995020a6ef908050cf63a0f0f')

prepare() {
  cd "$pkgname-$pkgver"
  # The vendored mimalloc 3.3.0, statically linked as the malloc override,
  # segfaults before main() on glibc >= 2.44: libstdc++'s static init calls
  # free(NULL) before mimalloc is initialized. Backport of upstream commit
  # b2226c19 (mimalloc >= 3.4.4); https://github.com/microsoft/mimalloc/issues/1341
  patch -d ext/mimalloc -Np1 -i "$srcdir/mimalloc-free-null-before-init.patch"
}

_make() {
  local _args=(
    CC=clang
    CXX=clang++
    AR=llvm-ar
    # The Makefile derives the version from `git describe`; the tarball has no .git.
    VERSION_STRING="$pkgver"
    LTO=full
  )
  # x86_64: AVX2 baseline for non-kernel code; SSE4.1..AVX-512BW kernels are
  # all compiled in and picked at runtime. Pre-AVX2 CPUs are not supported.
  [[ $CARCH == x86_64 ]] && _args+=(BASELINE_ARCH=avx2)
  make "${_args[@]}" "$@"
}

build() {
  cd "$pkgname-$pkgver"
  # The Makefile appends its own -O3/-march flags after these.
  _make
}

check() {
  cd "$pkgname-$pkgver"
  ./bwa-mem3 version

  # Smoke test: index a small random reference and map a read drawn from it.
  local _t="$srcdir/smoke"
  rm -rf "$_t" && mkdir -p "$_t"
  awk 'BEGIN { srand(42); printf ">chr1\n";
         for (i = 0; i < 20000; i++) { printf "%s", substr("ACGT", int(rand()*4)+1, 1);
           if (i % 60 == 59) printf "\n" } printf "\n" }' > "$_t/ref.fa"
  ./bwa-mem3 index "$_t/ref.fa" 2> "$_t/index.log"
  local _read
  _read=$(sed 1d "$_t/ref.fa" | tr -d '\n' | cut -c5001-5150)
  printf '@r1\n%s\n+\n%s\n' "$_read" "$(printf 'I%.0s' {1..150})" > "$_t/r.fq"
  ./bwa-mem3 mem -t 2 "$_t/ref.fa" "$_t/r.fq" 2> "$_t/mem.log" > "$_t/out.sam"
  awk '!/^@/ && $3 == "chr1" && $4 == 5001 && $6 == "150M" { ok = 1 } END { exit !ok }' "$_t/out.sam"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bwa-mem3 -t "$pkgdir/usr/bin"

  install -Dm644 README.md NEWS.md -t "$pkgdir/usr/share/doc/$pkgname"

  local _lic="$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE -t "$_lic"
  install -Dm644 ext/htslib/LICENSE "$_lic/htslib-LICENSE"
  install -Dm644 ext/mimalloc/LICENSE "$_lic/mimalloc-LICENSE"
  install -Dm644 ext/zlib-ng/LICENSE.md "$_lic/zlib-ng-LICENSE.md"
  install -Dm644 ext/libsais/LICENSE "$_lic/libsais-LICENSE"
  if [[ $CARCH == aarch64 ]]; then
    install -Dm644 ext/sse2neon/LICENSE "$_lic/sse2neon-LICENSE"
  fi
}
