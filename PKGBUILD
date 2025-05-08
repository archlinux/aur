# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="glyph"
pkgver=1.0.11
pkgrel=1
pkgdesc="Convert images/video to ASCII art (formerly asciigen)"
arch=('aarch64' 'x86_64')
url="https://github.com/seatedro/${pkgname}"
license=('MIT')
depends=('ffmpeg' 'glibc') # 'ffmpeg6.1'
makedepends=('zig>=0.14')
replaces=('asciigen')
_zig_deps=("zig-clap-0.10.0.tar.gz::https://github.com/Hejsil/zig-clap/archive/refs/tags/0.10.0.tar.gz"
           "stb-f75e8d1cad7d90d72ef7a4661f1b994ef78b4e31.tar.gz::https://github.com/nothings/stb/archive/f75e8d1cad7d90d72ef7a4661f1b994ef78b4e31.tar.gz")
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_zig_deps[@]%%::*}")
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}_zig014_zon.patch"
        "${_zig_deps[@]}")
b2sums=('c63d063081f8d1d82b53093774dd16a71ecdb07865b3577f52ebd83f9ee7f3719dc980158e372a92262537755a45bfa3fad7d6462e7e96f8ca5a0729b93c2d36'
        'c091e11a6b4714e60d44a0a98e335d667ec854a868d753e1737b380224f2ae479176d545adada99f024f9afa34c8d2450b6e800785afcd52b509947afc100af0'
        'dbf4152f07b8097dd5288db4431ab65b64ffc66a3e1622fd3274fdea591238beddb077e973ffd70fce8f584980b7f0a5264fa8ea642a9b4f05010ff1e2f8aa03'
        'b4483822e55b330d03a780675835f6fb0300f63573ec8288ea9976adf6c4f7183a7ec6141e37c2aa4bb3dba361b9da3c8e8aaf55dc697185ec6c0464512b7b56')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_zig014_zon.patch"

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
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.1-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseFast
    -Dstrip=false
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
    --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.1-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseFast
    -Dstrip=false
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build test "${zig_options[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -va build/* "${pkgdir}"

  install -vDm644 "readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
