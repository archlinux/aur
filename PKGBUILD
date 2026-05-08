# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.10.0
_pkgver="${pkgver%.*}"
pkgrel=3

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  # 'aarch64' # 'aarch64'
  'i686'    # 'x86'
  # 'riscv64' # 'riscv64'
  'x86_64'  # 'x86_64'
)
url="https://zigtools.org/zls"
_url="https://github.com/zigtools/${_basename}"
license=(
  'MIT'
)
depends=(
  'sh'
  "zig${_pkgver}"
)
_pkgsrc="${_basename}-${pkgver}"
source=(
  "${_basename}-versioned.sh"
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "https://github.com/ziglibs/known-folders/archive/24845b0103e611c108d6bc334231c464e699742c/known-folders-24845b0103e611c108d6bc334231c464e699742c.tar.gz"
)
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            'ad8c16721a10a55b759f0cd63243301565b948b1d48075e1fda89ccf264a2bdf'
            '372444a8a866235a5b79e17f076b3d4f9ce74e1273ea380b677918057f106d98')


prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  cp -aT "known-folders-24845b0103e611c108d6bc334231c464e699742c" "${_pkgsrc}/src/known-folders"
}

build() {
  local zig_options=(
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Drelease-safe=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig-${_pkgver}" build "${zig_options[@]}"
}

check() {
  export PATH="/opt/zig${_pkgver}:$PATH"
  local zig_options=(
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Drelease-safe=true
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig-${_pkgver}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
