# Maintainer:
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname="desmume"
pkgname="$_pkgname-git"
pkgver=0.9.14.r422.gb391594
pkgrel=1
pkgdesc="Nintendo DS emulator"
url="https://github.com/TASVideos/desmume"
license=('GPL-2.0-or-later')
arch=('aarch64' 'x86_64')

depends=(
  'gtk3'
  'libopenal.so'
  'libpcap'
  'sdl2'
  'soundtouch'
  'zlib'
)
makedepends=(
  'git'
  'mesa'
  'meson'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git tag -f prerelease_0_9_14 60714f6d2281d8817b58969c29ec871cf8dbc4f2
  git describe --long --tags --abbrev=7 --match='*release_[0-9]*[0-9]' \
    --exclude='*_*[a-zA-Z]*' --exclude='*-*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/[-_]/./g'
}

build() {
  local _pkgsrc="$_pkgsrc/desmume/src/frontend/posix"

  local _meson_args=(
    -Dopengl=true
    -Dglx=true
    -Dopenal=true
    -Dwifi=true
  )

  arch-meson "${_meson_args[@]}" "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
