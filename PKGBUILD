# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.14.0
_pkgver="${pkgver%.*}"
pkgrel=2

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=('MIT')
depends=(
  'sh'
  "zig${_pkgver}"
)
_zigdepends=(
  # zls
  "known-folders-aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz::https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz"
  "diffz-ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.tar.gz::https://github.com/ziglibs/diffz/archive/ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.tar.gz"
  "zig-lsp-codegen-063a98c13a2293d8654086140813bdd1de6501bc.tar.gz::https://github.com/zigtools/zig-lsp-codegen/archive/063a98c13a2293d8654086140813bdd1de6501bc.tar.gz"
  "tracy-0.11.1.tar.gz::https://github.com/wolfpld/tracy/archive/refs/tags/v0.11.1.tar.gz"
)
_pkgsrc="${_basename}-${pkgver}"
noextract=("${_zigdepends[@]%%::*}")
source=("${_basename}-versioned.sh"
        "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${_zigdepends[@]}")
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            '44cae74073b2f75cf627755398afadafaa382cccf7555b5b66b147dcaa6cef0d'
            '500d9df2df8b44060dac523b0402126c0341e01d77f59101e1335654b8ae25a1'
            '1dd8f4678171bfd2476aa74743e48bce10aad2b90c2df038d3ac6b0ef37fc3ba'
            '22aa11a4e282b4724d45bab270014f70730ac915508a8424c4829fe927eae8bb'
            '2c11ca816f2b756be2730f86b0092920419f3dabc7a7173829ffd897d91888a1')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  for dep in "${_zigdepends[@]}"; do
    "zig${_pkgver}" fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
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
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_pkgver}" build "${zig_options[@]}"
}

# check() {
#   export PATH="/opt/zig${_pkgver}:$PATH"
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
#     -Dversion-string="${pkgver}"
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" "zig${_pkgver}" build test "${zig_options[@]}"
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
