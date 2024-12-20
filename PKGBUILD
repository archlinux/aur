# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>

# options
: ${_build_kf5:=true}
: ${_build_kf6:=true}

_pkgname="lightly"
pkgbase="$_pkgname-git"
pkgver=0.5.12.r0.gfcba413
pkgrel=1
pkgdesc="Modern style for KDE/Qt applications"
url="https://github.com/Bali10050/lightly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
)

options=(!emptydirs !debug)

_pkgsrc="lightly.Bali10050"
source=("$_pkgsrc"::"git+$url.git#branch=qt6")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  if [[ "${_build_kf5::1}" == "t" ]]; then
    _build_kf5
    _package_kf5
  fi

  if [[ "${_build_kf6::1}" == "t" ]]; then
    _build_kf6
    _package_kf6
  fi
}

# KF5/Qt5
_depends_kf5=(
  'frameworkintegration5'
  'hicolor-icon-theme'
  'kcmutils5'
  'kconfigwidgets5'
  'kiconthemes5'
  'kirigami2'
  'kwindowsystem5'
)

_build_kf5() (
  local _cmake_options=(
    -B build_kf5
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_QT5=ON
    -DBUILD_QT6=OFF
    -DBUILD_TESTING=OFF
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
)

_build_kf6() (
  local _cmake_options=(
    -B build_kf6
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_QT5=OFF
    -DBUILD_QT6=ON
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
if [[ "${_build_kf5::1}" == "t" ]]; then
  depends+=("${_depends_kf5[@]}")

  pkgname+=("$_pkgname-qt5-git")

  package_lightly-qt5-git() {
    pkgdesc="Modern style for KF5/Qt5 applications"

    provides=(
      lightly
      lightly-kf5
      lightly-qt
      lightly-qt5
    )
    conflicts=(
      lightly
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

if [[ "${_build_kf6::1}" == "t" ]]; then
  depends+=("${_depends_kf6[@]}")

  pkgname+=("$_pkgname-qt6-git")

  package_lightly-qt6-git() {
    pkgdesc="Modern style for KF6/Qt6 applications"

    provides=(
      lightly-kf6
      lightly-qt6
    )
    conflicts=(
      lightly-kf6
      lightly-qt6
    )

    depends=("${_depends_kf6[@]}")

    local _pkgdir="$srcdir/fakeinstall_kf6"
    mv "$_pkgdir"/* "$pkgdir/"

    chmod u=rwX,g=rX,o=rX -R "$pkgdir"
  }
fi
