# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
_suffix="-mach"
pkgname="${_basename}${_suffix}"
pkgver=0.14.0dev.336+a9e651a2
_pkgver="${pkgver//dev/-dev}"
pkgrel=3
pkgdesc="A language server for Zig"
arch=(
  'aarch64'     # 'aarch64'
  'armv7h'      # 'arm'
  # 'loong64'     # 'loongarch64'
  # 'powerpc64le' # 'powerpc64le'
  # 'riscv64'     # 'riscv64'
  # 's390x'       # 's390x'
  'i686'        # 'x86'
  'x86_64'      # 'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=(
  'MIT'
)
depends=(
  'sh'
  "zig${_suffix}"
)
makedepends=(
  'git'
)
_zigdepends=(
  # zls
  "known-folders-1cceeb70e77dec941a4178160ff6c8d05a74de6f.tar.gz::https://github.com/ziglibs/known-folders/archive/1cceeb70e77dec941a4178160ff6c8d05a74de6f.tar.gz"
  "diffz-ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.tar.gz::https://github.com/ziglibs/diffz/archive/ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.tar.gz"
  "zig-lsp-codegen-25b7b6676e00edb803c2b8398821b70f0f827c92.tar.gz::https://github.com/zigtools/zig-lsp-codegen/archive/25b7b6676e00edb803c2b8398821b70f0f827c92.tar.gz"
  "tracy-0.11.1.tar.gz::https://github.com/wolfpld/tracy/archive/refs/tags/v0.11.1.tar.gz"
)
_pkgsrc="${_url##*/}"
source=(
  "${_basename}-versioned.sh"
  "${_pkgsrc}::git+${_url}.git#commit=${pkgver##*+}"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            '145169b90d6e383f29226964f6958187ca84e15a6fdde002b96eea3a5ccccb39'
            '0ecaa2d606744e72d38a4251bd6ffb81c36b39bd3c9449d302b0b709c22110a0'
            '1dd8f4678171bfd2476aa74743e48bce10aad2b90c2df038d3ac6b0ef37fc3ba'
            'f559a194f33ac2946fcf92cc7fe1f9d9feaf6aee0d092648695fd4f5375b271a'
            '2c11ca816f2b756be2730f86b0092920419f3dabc7a7173829ffd897d91888a1')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_suffix}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  for dep in "${_zigdepends[@]}"; do
    zig-mach fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.42
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dpie=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig-mach build "${zig_options[@]}"
}

# check() {
#   export PATH="/opt/zig${_suffix}:$PATH"
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.41
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#     -Dpie=true
#   )

#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" zig-mach build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
