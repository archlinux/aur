# Maintainer:

# options
: ${_build_qt5:=true}
: ${_build_qt6:=true}

_pkgname="darkly"
pkgbase="$_pkgname-git"
pkgver=0.5.17.r1.g7bee55f
pkgrel=1
pkgdesc="Modern style for KDE/Qt applications (fork of Lightly)"
url="https://github.com/Bali10050/Darkly"
arch=('x86_64' 'aarch64')
license=("GPL-2.0-or-later")

makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

options=('!emptydirs')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  if [[ "${_build_qt5::1}" == "t" ]]; then
    _build_qt5
    _package_qt5
  fi

  if [[ "${_build_qt6::1}" == "t" ]]; then
    _build_qt6
    _package_qt6
  fi
}

# KF5/Qt5
_depends_qt5=(
  'frameworkintegration5'
  'hicolor-icon-theme'
  'kcmutils5'
  'kconfigwidgets5'
  'kiconthemes5'
  'kirigami2'
  'kwindowsystem5'
)

_build_qt5() (
  local _cmake_options=(
    -B build_qt5
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_QT5=ON
    -DBUILD_QT6=OFF
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_qt5
)

_package_qt5() (
  local _pkgdir="$srcdir/fakeinstall_qt5"
  install -dm755 "$_pkgdir"
  DESTDIR="$_pkgdir" cmake --install build_qt5

  rm -rf "$_pkgdir/usr/share/color-schemes/Darkly.colors"
  rm -rf "$_pkgdir/usr/share/kstyle/themes/darkly.themerc"
)

# KF6/Qt6
_depends_qt6=(
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
)

_build_qt6() (
  local _cmake_options=(
    -B build_qt6
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DBUILD_QT5=OFF
    -DBUILD_QT6=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_qt6
)

_package_qt6() (
  local _pkgdir="$srcdir/fakeinstall_qt6"
  install -dm755 "$_pkgdir"
  DESTDIR="$_pkgdir" cmake --install build_qt6

  rm -rf "$_pkgdir/usr/lib/cmake"
)

# execute
if [[ "${_build_qt5::1}" == "t" ]]; then
  depends+=("${_depends_qt5[@]}")

  pkgname+=("$_pkgname-qt5-git")

  package_darkly-qt5-git() {
    pkgdesc="Modern style for KF5/Qt5 applications (fork of Lightly)"

    depends=(
      "$_pkgname-qt6-git"
      "${_depends_qt5[@]}"
    )
    optdepends+=("$_pkgname-qt6-git: KF5/Qt5 support")

    provides=(
      "$_pkgname-qt5"
    )
    conflicts=(
      "$_pkgname-qt5"
    )

    local _pkgdir="$srcdir/fakeinstall_qt5"
    mv "$_pkgdir"/* "$pkgdir/"

    chmod u=rwX,g=rX,o=rX -R "$pkgdir"
  }
fi

if [[ "${_build_qt6::1}" == "t" ]]; then
  depends+=("${_depends_qt6[@]}")

  pkgname+=("$_pkgname-qt6-git")

  package_darkly-qt6-git() {
    pkgdesc="Modern style for KF6/Qt6 applications (fork of Lightly)"

    depends=("${_depends_qt6[@]}")

    provides=(
      "$_pkgname"
      "$_pkgname-qt6"
    )
    conflicts=(
      "$_pkgname"
      "$_pkgname-qt6"
    )

    local _pkgdir="$srcdir/fakeinstall_qt6"
    mv "$_pkgdir"/* "$pkgdir/"

    chmod u=rwX,g=rX,o=rX -R "$pkgdir"
  }
fi
