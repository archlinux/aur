# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.15.1
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
_zigdepends=(
  # zls
  "known-folders-92defaee76b07487769ca352fd0ba95bc8b42a2f.tar.gz::https://github.com/ziglibs/known-folders/archive/92defaee76b07487769ca352fd0ba95bc8b42a2f.tar.gz"
  "diffz-a20dd1f11b10819a6f570f98b42e1c91e3704357.tar.gz::https://github.com/ziglibs/diffz/archive/a20dd1f11b10819a6f570f98b42e1c91e3704357.tar.gz"
  "lsp-kit-576e9405b1ab22c17c0f9318feed3278aa66b0ea.tar.gz::https://github.com/zigtools/lsp-kit/archive/576e9405b1ab22c17c0f9318feed3278aa66b0ea.tar.gz"
  "tracy-0.11.1.tar.gz::https://github.com/wolfpld/tracy/archive/refs/tags/v0.11.1.tar.gz"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_basename}-versioned.sh"
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${_zigdepends[@]}"
)
noextract=(
  "${_zigdepends[@]%%::*}"
)
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            '40a4559c3007ed9333769fc3e111ed466403b53f31ad9242874a62ab385b331b'
            'b2248ce99958d17023fcd60c606fa20c69f089ff6877aa23aecda57824be7844'
            'c4fe9d0624ca5a9499fc4592e404eedb94934491ef214e5199be61c441d7c074'
            'dd20a2951144f9c755c282853542e4f417e60c6673817d044067192444bfdabe'
            '2c11ca816f2b756be2730f86b0092920419f3dabc7a7173829ffd897d91888a1')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  for _zigdepend in "${_zigdepends[@]}"; do
    "zig-${_pkgver}" fetch --global-cache-dir ./zig-global-cache "${_zigdepend%%::*}"
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
  DESTDIR="build" "zig-${_pkgver}" build "${zig_options[@]}"
}

check() {
  export PATH="/opt/zig${_pkgver}:$PATH"
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
