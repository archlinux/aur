# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="glyph"
pkgver=1.0.9
pkgrel=2
pkgdesc="Convert images/video to ASCII art"
arch=('x86_64')
url="https://github.com/seatedro/${pkgname}"
license=('MIT')
depends=('ffmpeg' 'glibc') # 'ffmpeg6.1'
makedepends=('zig')
replaces=('asciigen')
_zig_deps=("zig-clap-0.9.1.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/0.9.1.tar.gz"
           "stb-f75e8d1cad7d90d72ef7a4661f1b994ef78b4e31.tar.gz::https://github.com/nothings/stb/archive/f75e8d1cad7d90d72ef7a4661f1b994ef78b4e31.tar.gz")
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_zig_deps[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${_zig_deps[@]}")
sha256sums=('b5cbc1dadadf43b1c85a4c2171c8dc1dcb9e1688812a773139d01dda821265c4'
            'eeac66ff8c5bfb9f0c186fa2533b2c52d47dece1b67518c0ab24b40407ade076'
            'bc6ccf08bec08fea8ef423c7117dca06d2f62d2b27c5485f6865584b533fa7fa')

prepare() {
  cd "${srcdir}"
  for dep in "${_zig_deps[@]}"; do
    zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
  done
}

build() {
  # export PKG_CONFIG_PATH="/usr/lib/ffmpeg6.1/pkgconfig:$PKG_CONFIG_PATH"

  # -Doptimize=ReleaseSafe compiles fine but errors out on runtime:
  # Illegal instruction at address 0x11e45d3
  # ???:?:?: 0x11e45d3 in ??? ()
  # Unwind information for `:0x11e45d3` was not available, trace may be incomplete
  # 
  # Aborted (core dumped)

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build \
    --summary all \
    --prefix /usr \
    --search-prefix /usr \
    --global-cache-dir "${srcdir}/zig-global-cache" \
    --system "${srcdir}/zig-global-cache/p" \
    --verbose \
    -Dtarget=native-linux.6.1-gnu.2.39 \
    -Dcpu=baseline \
    -Doptimize=ReleaseFast
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="build" zig build test \
#     --summary all \
#     --prefix /usr \
#     --search-prefix /usr \
#     --global-cache-dir "${srcdir}/zig-global-cache" \
#     --system "${srcdir}/zig-global-cache/p" \
#     --verbose \
#     -Dtarget=native-linux.6.1-gnu.2.39 \
#     -Dcpu=baseline \
#     -Doptimize=ReleaseFast
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
