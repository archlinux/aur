# Maintainer: Nitro Cao <jaycecao520@gmail.com>
pkgname=tracee
pkgver=0.24.1
pkgrel=1
pkgdesc='Linux runtime security and forensics using eBPF'
arch=('x86_64')
url='https://github.com/aquasecurity/tracee'
license=('Apache-2.0')
depends=('glibc' 'libelf' 'zlib' 'zstd')
# Toolchain tested with Clang/LLVM 23.1.1; older versions are not validated.
makedepends=('go>=1.24' 'clang>=23' 'llvm>=23' 'pkgconf')
optdepends=('systemd: run the supplied service' 'man-db: display embedded manual pages')
conflicts=('tracee-bin')
backup=('etc/tracee/config.yaml')
options=('!strip' '!debug' '!lto')
_libbpf_ver=1.5.1
source=("tracee-${pkgver}.tar.gz::https://github.com/aquasecurity/tracee/archive/refs/tags/v${pkgver}.tar.gz"
        "libbpf-${_libbpf_ver}.tar.gz::https://github.com/libbpf/libbpf/archive/refs/tags/v${_libbpf_ver}.tar.gz"
        'tracee.service'
        'config.yaml'
        'bpf-inline-memset.patch')
noextract=("tracee-${pkgver}.tar.gz" "libbpf-${_libbpf_ver}.tar.gz")
sha256sums=('5e5a5e504807fd6c83a2dba75e53c81f71b02150b54fd8f07bbebbcd4ac4f57f' 'e5ff89750e48ab5ecdfc02a759aa0dacd1e7980e98e16bdb4bfa8ff0b3b4b98f'
            '30bc2038f3e11b2892c3f5d7e9ef3d6309f1d0f0e32ee34ff08553ff588e1f0f'
            '1711201c9f87766fdf71fd227d142c60d70047738cbdd75dd8bf9981f7895b8d'
            '661867c21ab083910462ac778d0b2587d23d68ef24568d3f4cea9db357b253d1')

prepare() {
  mkdir -p "tracee-${pkgver}"
  bsdtar -xf "tracee-${pkgver}.tar.gz" -C "tracee-${pkgver}" --strip-components=1
  bsdtar -xf "libbpf-${_libbpf_ver}.tar.gz" \
    -C "tracee-${pkgver}/3rdparty/libbpf" --strip-components=1
  export GOPATH="$srcdir/go"
  export GOCACHE="$srcdir/go-build"
  export GOTOOLCHAIN=local
  cd "tracee-${pkgver}" || return
  # Prevent a libc memset call in BPF bytecode on recent Clang versions.
  patch -Np1 -i "$srcdir/bpf-inline-memset.patch"
  go mod download
}

build() {
  cd "tracee-${pkgver}" || return
  export GOPATH="$srcdir/go"
  export GOCACHE="$srcdir/go-build"
  export GOTOOLCHAIN=local
  export CGO_ENABLED=1
  export GOFLAGS='-trimpath -mod=readonly -buildvcs=false'
  # Build the main executable and its Go plugin together with identical tags.
  # Only the unified CLI is needed, not the deprecated CLIs or traceectl.
  make -j"$(nproc)" tracee STATIC=0 BTFHUB=0 RELEASE_VERSION="v${pkgver}" \
    BPF_DEBUG_FLAG="-ffile-prefix-map=$srcdir=."
}

check() {
  cd "tracee-${pkgver}" || return
  # These libc functions cannot be resolved as kernel BPF externs.
  local object symbols
  for object in dist/tracee.bpf.o dist/lsm_support/*.bpf.o; do
    symbols=$(llvm-nm --undefined-only "$object") || return
    if grep -Eq '[[:space:]](memset|memcpy|memmove|memcmp)$' <<< "$symbols"; then
      printf 'Unsupported BPF libc reference in %s:\n%s\n' "$object" "$symbols" >&2
      return 1
    fi
  done
  ./dist/tracee version
  # Upstream list can return 0 despite plugin load failures.
  ./dist/tracee list --signatures-dir "$PWD/dist/signatures" \
    > "$srcdir/events.txt" 2> "$srcdir/signatures.log"
  if grep -q '"level":"error"' "$srcdir/signatures.log" ||
     ! grep -q 'kernel_module_loading' "$srcdir/events.txt"; then
    cat "$srcdir/signatures.log" >&2
    return 1
  fi
}

package() {
  cd "tracee-${pkgver}" || return
  install -Dm755 dist/tracee "$pkgdir/usr/lib/tracee/tracee"
  install -Dm755 dist/signatures/builtin.so "$pkgdir/usr/lib/tracee/signatures/builtin.so"
  install -d "$pkgdir/usr/bin" "$pkgdir/etc/tracee/policies"
  ln -s ../lib/tracee/tracee "$pkgdir/usr/bin/tracee"
  install -Dm644 "$srcdir/config.yaml" "$pkgdir/etc/tracee/config.yaml"
  install -Dm644 "$srcdir/tracee.service" "$pkgdir/usr/lib/systemd/system/tracee.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
