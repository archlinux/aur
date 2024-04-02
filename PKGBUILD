# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

# options
: ${_build_kf5:=true}
: ${_build_kf6:=true}

# basic info
_pkgname="lightly"
pkgbase="$_pkgname-git"
pkgver=0.4.1.r73.g00ca234
pkgrel=4
pkgdesc="Modern style for KDE/Qt applications"
url="https://github.com/boehs/lightly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)

options=(!emptydirs !debug)

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+$url.git#branch=qt6"
  "qt6-missing-config.patch"
)
sha256sums=(
  'SKIP'
  '2553ff71310e265a9481c0afb9d50bbd1d9f66d47bd67675956199601c1a6501'
)

# common functions
pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  if [[ "${_build_kf5::1}" == "t" ]] ; then
    _prepare_kf5
    _build_kf5
    _package_kf5
  fi

  if [[ "${_build_kf6::1}" == "t" ]] ; then
    _prepare_kf6
    _build_kf6
    _package_kf6
  fi
}

# KF5/Qt5
_depends_kf5=(
  'frameworkintegration5'
  'hicolor-icon-theme'
  'kcmutils5'
  'kconfig5'
  'kcoreaddons5'
  'kdecoration5'
  'kguiaddons5'
  'ki18n5'
  'kiconthemes5'
  'kwayland5'
  'kwindowsystem5'
  'qt5-declarative'
  'qt5-x11extras'

  ## implicit
  #libxcb
  #qt5-base
)

_prepare_kf5() (
  cd "$_pkgsrc"
  git checkout -f master
)

_build_kf5() (
  local _cmake_options=(
    -B build_kf5
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -DKDecoration2_DIR=/usr/lib/cmake/plasma5/KDecoration2
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_kf5
)

_package_kf5() (
  local _pkgdir="$srcdir/fakeinstall_kf5"
  install -dm755 "$_pkgdir"
  DESTDIR="$_pkgdir" cmake --install build_kf5

  rm -rf "$_pkgdir/usr/lib/cmake"
  rm -rf "$_pkgdir/usr/share/icons"
  mv "$_pkgdir/usr/share/color-schemes/Lightly.colors" "$_pkgdir/usr/share/color-schemes/Lightly5.colors"
  mv "$_pkgdir/usr/share/kstyle/themes/lightly.themerc" "$_pkgdir/usr/share/kstyle/themes/lightly5.themerc"
)

# KF6/Qt6
_depends_kf6=(
  'frameworkintegration'
  'hicolor-icon-theme'
  'kcmutils'
  'kcolorscheme'
  'kconfig'
  'kcoreaddons'
  'kdecoration'
  'kguiaddons'
  'kiconthemes'
  'kwindowsystem'
  'qt6-declarative'

  ## implicit
  #ki18n
  #kwidgetsaddons
  #qt6-base
)

_prepare_kf6() (
  cd "$_pkgsrc"
  git checkout -f qt6
  patch -Np1 -F100 -i ../qt6-missing-config.patch
)

_build_kf6() (
  local _cmake_options=(
    -B build_kf6
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"

  cmake --build build_kf6/kdecoration/config/
  cmake --build build_kf6
)

_package_kf6() (
  local _pkgdir="$srcdir/fakeinstall_kf6"
  install -dm755 "$_pkgdir"
  DESTDIR="$_pkgdir" cmake --install build_kf6

  rm -rf "$_pkgdir/usr/lib/cmake"
)

# execute
if [[ "${_build_kf5::1}" == "t" ]] ; then
  depends+=("${_depends_kf5[@]}")

  pkgname+=("$_pkgname-kf5-git")

  package_lightly-kf5-git() {
    pkgdesc="Modern style for KF5/Qt5 applications"

    provides=(
      lightly
      lightly-kf5
      lightly-qt
      lightly-qt5
    )
    conflicts=(
      lightly
      lightly-boehs-git
      lightly-kf5
      lightly-qt
      lightly-qt5
    )

    depends=("${_depends_kf5[@]}")

    local _pkgdir="$srcdir/fakeinstall_kf5"
    mv "$_pkgdir"/* "$pkgdir/"

    chmod u=rwX,g=rX,o=rX -R "$pkgdir"
  }
fi

if [[ "${_build_kf6::1}" == "t" ]] ; then
  depends+=("${_depends_kf6[@]}")

  pkgname+=("$_pkgname-kf6-git")

  package_lightly-kf6-git() {
    pkgdesc="Modern style for KF6/Qt6 applications"

    provides=(
      lightly-kf6
      lightly-qt6
      lightly-qt6-git
    )
    conflicts=(
      lightly-kf6
      lightly-qt6
      lightly-qt6-git
    )

    depends=("${_depends_kf6[@]}")

    local _pkgdir="$srcdir/fakeinstall_kf6"
    mv "$_pkgdir"/* "$pkgdir/"

    chmod u=rwX,g=rX,o=rX -R "$pkgdir"
  }
fi
