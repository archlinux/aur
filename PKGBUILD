# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.16
pkgname="minizign"
pkgver=0.1.13
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
#   "zig-clap::git+https://github.com/Hejsil/zig-clap.git#commit=bf56f229ed5b6c381d90e192234913c6deb3f688"
# )
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=${pkgver}?signed"
  # "${_zigdepends[@]}"
)
# noextract=(
#   "${_zigdepends[@]%%::*}"
# )
b2sums=('9c06b36a82fa6c15c2f3b3f718b89a7961a5e3e3bd15e070a4a6b2130818d0d8367586ae01fbd090160b995411110cc50e015f80b4f6e7ed080048dff65b3917')
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
