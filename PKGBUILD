# Maintainer:
# Contributor: Michal Donat <donny579@gmail.com>

_pkgname="supertuxkart"
pkgname="$_pkgname-git"
pkgver=1.4.r630.g1a8aeed
pkgrel=1
pkgdesc="A kart racing game featuring Tux and his friends"
url="https://github.com/supertuxkart/stk-code"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'bluez-libs'
  'freetype2'
  'harfbuzz'
  'hicolor-icon-theme'
  'libgl'
  'libjpeg-turbo'
  'libopenglrecorder' # AUR
  'libpng'
  'libvorbis'
  'openal'
  'sdl2'
  'shaderc'
)

makedepends=(
  'cmake'
  'git'
  'libvpx'
  'ninja'
  'python'
)

options=('!emptydirs')

_pkgsrc="stk-code"
source=("$_pkgsrc"::"git+https://github.com/supertuxkart/stk-code.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  _tag=$(git tag -l '[0-9]*' | grep -Ev '[a-z][a-z]' | sort -rV | head -1)
  _version="${_tag:?}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_RECORDER=ON
    -DCHECK_ASSETS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=('supertuxkart-assets')

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  local _data_path="usr/share/supertuxkart/data"
  local _unwanted=(
    "$_data_path/optimize_data.sh"
    "$_data_path/po/update_desktop_file_appdata.py"
    "$_data_path/po/update_translation.py"
    'usr/include'
    'usr/lib'
  )

  local _f
  for _f in ${_unwanted[@]}; do
    rm -rf "$pkgdir/$_f"
  done
}
