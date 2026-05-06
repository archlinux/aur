# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.16
pkgname="minizign"
pkgver=0.1.12
pkgrel=1
pkgdesc="Minisign reimplemented in Zig"
arch=(
  'x86_64'
)
url="https://github.com/jedisct1/zig-minisign"
license=(
  'ISC'
)
makedepends=(
  'git'
  "zig>=${_zig}"
)
# _zigdepends=(
#   "zig-clap::git+https://github.com/Hejsil/zig-clap.git#commit=8d97efa1ee1e575443c7888d5c38e1c3fc145cf5"
# )
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}?signed"
  # "${_zigdepends[@]}"
)
# noextract=(
#   "${_zigdepends[@]%%::*}"
# )
b2sums=('43af4f7db7e83fd193ee5fba8666cf425757b0e62f52fe42f94d9bc383f9a1355498f3cdab179e11606a31a5a2374560952d64978120bc49a9f46f0b8853d52d')
validpgpkeys=(
  '54A2B8892CC3D6A597B92B6C210627AABA709FE1' # Frank Denis (Jedi/Sector One) <pgp@pureftpd.org>
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # for _zigdepend in "${_zigdepends[@]}"; do
  #   zig fetch --global-cache-dir "${srcdir}/zig-global-cache" "${srcdir}/${_zigdepend%%::*}"
  # done

  grep -oP '(?<=\.url = ")[^"]+' build.zig.zon | while read -r zig_fetch_url; do
    zig fetch --global-cache-dir "${srcdir}/zig-global-cache" "${zig_fetch_url}"
  done
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
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
}

check() {
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
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="check" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
