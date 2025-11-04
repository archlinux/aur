# Maintainer:
# Contributor: éclairevoyant
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux at free dot fr>
# Contributor: zhuqin <zhuqin83 at gmail dot com>

_pkgname="lensfun"
pkgname="$_pkgname-git"
pkgver=0.3.4.r3182.g6acac62
pkgrel=1
pkgdesc="Database of photographic lenses and associated library"
url="https://github.com/lensfun/lensfun"
license=('LGPL-3.0-only')
arch=('i686' 'x86_64')

depends=(
  'glib2'
  'libpng'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'python: for lensfun-update-data and lensfun-add-adapter'
)

provides=('liblensfun.so')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # rename python module to prevent conflict with extra/lensfun
  sed -e '/import lensfun/c import lensfun2 as lensfun' \
    -i apps/lensfun-add-adapter \
    apps/lensfun-update-data

  sed -E -e 's&/lensfun/&/lensfun2/&' \
    -e '/INSTALL\(CODE/d' \
    -i apps/CMakeLists.txt

  sed -E -e 's&\blensfun\b&lensfun2&' -i apps/pyproject.toml.in
  cp -r apps/lensfun apps/lensfun2
}

pkgver() (
  cd "$_pkgsrc"
  local _tmp _tag _version _revision _hash
  _tmp=$(git tag | grep -Ev '[A-Za-z][A-Za-z]|95' | sed -E 's&([^0-9]*)(\S+)$&\2 \1\2&' | sort -rV | head -1)
  _version=$(cut -f1 -d' ' <<< ${_tmp:?})
  _tag=$(cut -f2 -d' ' <<< ${_tmp:?})
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_BINDIR="lib/${_pkgname}2"
    -DCMAKE_INSTALL_INCLUDEDIR="lib/${_pkgname}2/include"
    -DCMAKE_INSTALL_LIBDIR="lib/${_pkgname}2"
    -Wno-dev

    -DBUILD_LENSTOOL=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  # main library
  DESTDIR="$pkgdir" cmake --install build

  # python module
  python -m installer --destdir="$pkgdir" build/apps/dist/*.whl

  # symlink library
  mkdir -pm755 "$pkgdir/usr/lib"
  for i in "$pkgdir/usr/lib/${_pkgname}2/liblensfun.so".*; do
    if [ -f "$i" ]; then
      j=$(basename "$i")
      ln -sf "${_pkgname}2/$j" "$pkgdir/usr/lib/$j"
    fi
  done

  # symlink binaries
  local _binaries=(
    lensfun-add-adapter
    lensfun-convert-lcp
    lensfun-update-data
    lenstool
  )

  mkdir -pm755 "$pkgdir/usr/bin"
  for i in "${_binaries[@]}"; do
    if [ -f "$pkgdir/usr/lib/${_pkgname}2/$i" ]; then
      j=$(basename "$i")
      k=$(sed 's&lensfun-&lensfun2-&' <<< "$j")
      ln -sf "../lib/${_pkgname}2/$j" "$pkgdir/usr/bin/$k"
    fi
  done

  # unwanted; use lensfun2-update-data
  rm "$pkgdir/usr/lib/${_pkgname}2/g-lensfun-update-data"
}
