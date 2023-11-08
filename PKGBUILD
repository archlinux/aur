# Maintainer:
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname="skanlite"
pkgname="$_pkgname-git"
pkgver=23.08.3.r6.g9b3851b
pkgrel=1
pkgdesc='Image Scanning Application'
url='https://invent.kde.org/graphics/skanlite'
license=(GPL)
arch=(x86_64)

depends=(
  'kio5'
  'libksane'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools5'
)

provides+=("$_pkgname")
conflicts+=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
  local _file='src/org.kde.skanlite.appdata.xml'

  local _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  local _version=$(
    printf '%s\n' "$_line" \
      | sed -E "s@$_regex@\1@"
  )
  local _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color -- "$_file" \
      | sed 's@\ .*$@@'
  )
  local _revision=$(
    git rev-list --count $_commit..HEAD
  )
  local _hash=$(
    git rev-parse --short HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
}

prepare() {
  local _pkgver=$(pkgver)
  _pkgver="${_pkgver%%.r*}"

  local _ver_maj=$(sed -E 's@^([0-9]+)\.([0-9]+)\.([0-9]+)$@\1@' <<< "$_pkgver")
  local _ver_min=$(sed -E 's@^([0-9]+)\.([0-9]+)\.([0-9]+)$@\2@' <<< "$_pkgver")
  local _ver_pat=$(sed -E 's@^([0-9]+)\.([0-9]+)\.([0-9]+)$@\3@' <<< "$_pkgver")

  sed -E \
    -e 's@^(\s*set\s*\(RELEASE_SERVICE_VERSION_MAJOR) .*$@\1 "'"$_ver_maj"'")@' \
    -e 's@^(\s*set\s*\(RELEASE_SERVICE_VERSION_MINOR) .*$@\1 "'"$_ver_min"'")@' \
    -e 's@^(\s*set\s*\(RELEASE_SERVICE_VERSION_MICRO) .*$@\1 "'"$_ver_pat"'")@' \
    -i "$_pkgsrc/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
