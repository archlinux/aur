# Maintainer:
# Contributor: Kenny Strawn <Kenny[dot]Strawn[at]gmail[dot]com>

_pkgname="calamares"
pkgname="$_pkgname-git"
pkgver=3.3.5.r19.g10acebf
pkgrel=1
pkgdesc="Distribution-independent installer framework"
url="https://github.com/calamares/calamares"
license=("GPL-3.0-or-later")
arch=('i686' 'x86_64')

depends=(
  'boost-libs'
  'ckbcomp'
  'hwinfo'
  'kconfig'
  'kcoreaddons'
  'ki18n'
  'kiconthemes'
  'kpmcore'
  'libpwquality'
  'polkit-qt6'
  'python'
  'python-jsonschema'
  'python-yaml'
  'qt6-svg'
  'solid'
  'squashfs-tools'
  'yaml-cpp'
)
makedepends=(
  'boost'
  'extra-cmake-modules'
  'git'
  'ninja'
  'qt6-tools'
  'qt6-translations'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

backup=(
  #'usr/share/calamares/modules/bootloader.conf'
  #'usr/share/calamares/modules/displaymanager.conf'
  #'usr/share/calamares/modules/initcpio.conf'
  #'usr/share/calamares/modules/unpackfs.conf'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "yay-support.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"

  local _regex='^set\(CALAMARES_VERSION ([0-9]+\.[0-9]+\.[0-9]+([^0-9].*)?)\)\s*$'
  local _file='CMakeLists.txt'

  local _line=$(
    grep -E "$_regex" "$_file" | head -1
  )
  local _version=$(
    printf '%s' "$_line" | sed -E "s@$_regex@\1@;s@alpha@a@;s@beta@b@;s@-@.@"
  )
  local _line=$(
    printf '%s' "$_line" | sed -E 's@\(@\\(@;s@\)@\\)@'
  )
  local _commit=$(
    git log -G "$_line" -1 --pretty=oneline --no-color | sed 's@\ .*$@@'
  )
  local _revision=$(
    git rev-list --count --cherry-pick "$_commit"...HEAD
  )
  local _hash=$(
    git rev-parse --short=7 HEAD
  )

  printf '%s.r%s.g%s' \
    "$_version" \
    "$_revision" \
    "$_hash"
}

prepare() {
  cd "$_pkgsrc"
  git apply ../yay-support.patch
}


build() {
  local _skip_modules=(
    dracut
    dracutlukscfg
    dummycpp
    dummyprocess
    dummypython
    dummypythonqt
    initramfs
    initramfscfg
    interactiveterminal
    packagechooser
    packagechooserq
    services-openrc
  )

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja

    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DWITH_QT6=ON
    -DINSTALL_CONFIG=ON
    -DSKIP_MODULES="${_skip_modules[*]}"

    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
