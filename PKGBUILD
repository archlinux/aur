# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="zls"
pkgver=0.11.0
_pkgver="${pkgver%.*}"
pkgrel=2

pkgname="${_basename}${_pkgver}"
pkgdesc="A language server for Zig"
arch=(
  'aarch64'
  # 'armv7h'
  'i686'
  # 'powerpc64le'
  # 'riscv64'
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
  "known-folders-fa75e1bc672952efa0cf06160bbd942b47f6d59b.tar.gz::https://github.com/ziglibs/known-folders/archive/fa75e1bc672952efa0cf06160bbd942b47f6d59b.tar.gz"
  "diffz-90353d401c59e2ca5ed0abe5444c29ad3d7489aa.tar.gz::https://github.com/ziglibs/diffz/archive/90353d401c59e2ca5ed0abe5444c29ad3d7489aa.tar.gz"
  "binned_allocator-6c3321e0969ff2463f8335da5601986cf2108690.tar.gz::https://gist.github.com/antlilja/8372900fcc09e38d7b0b6bbaddad3904/archive/6c3321e0969ff2463f8335da5601986cf2108690.tar.gz"
)
_pkgsrc="${_basename}-${pkgver}"
# noextract=("${_zigdepends[@]%%::*}")
source=("${_basename}-versioned.sh"
        "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
        # "${_zigdepends[@]}")
sha256sums=('b9e70d344290a58c6e8199a22232fbd2a8789cf76ddf0574f0a4ea647299ea68'
            '09fee5720fed9f3e1f494236ba88bf9176d3a01304feaa355b9f4726a574431b')

prepare() {
  cd "${srcdir}"
  sed -e "s|@@ZIG_PATH@@|/opt/zig${_pkgver}|g" \
      -e "s|@@ZLS_PATH@@|/usr/lib/${pkgname}|g" \
      -i "${_basename}-versioned.sh"

  # for dep in "${_zigdepends[@]}"; do
  #   "zig${_pkgver}" fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  # done
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
    # -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" "zig${_pkgver}" build "${zig_options[@]}"
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
    # -Dversion-string="${pkgver}"
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" "zig${_pkgver}" build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}-versioned.sh" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "build/usr/bin"
  install -vDm755 "${_basename}" "${pkgdir}/usr/lib/${pkgname}/${_basename}"
}
