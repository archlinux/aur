# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.16.0
_pkgver="${pkgver%.*}"
pkgrel=1

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  'aarch64'     # 'aarch64'
  'armv7h'      # 'arm'
  'loong64'     # 'loongarch64'
  'powerpc64le' # 'powerpc64le'
  'riscv64'     # 'riscv64'
  # 's390x'     # 's390x'
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
  "zig${_pkgver}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_basename}-versioned.sh"
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            'e7c5936f5b3a057ce851be0876e4e259b5c4d02f9aae038cd24a5d6b586b029f')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"
}

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig-${_pkgver}" build "${zig_options[@]}"
}

check() {
  export PATH="/opt/zig${_pkgver}:$PATH"
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
    -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig-${_pkgver}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${_basename}-${_pkgver}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
