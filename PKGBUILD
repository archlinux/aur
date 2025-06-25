# Maintainer:
# Contributor: 2xsaiko <aur@dblsaiko.net>

: ${_use_kwin_x11:=true}

_pkgname="kwin-effect-rounded-corners"
pkgbase="$_pkgname-git"
pkgver=0.7.2.r48.g284647c
pkgrel=2
pkgdesc="Rounds the corners of your windows"
url="https://github.com/matinlotfali/KDE-Rounded-Corners"
license=("GPL-3.0-only")
arch=('x86_64')

depends=(
  'kwin'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

if [[ "${_use_kwin_x11::1}" == "t" ]]; then
  depends+=('kwin-x11')
fi

_pkgsrc="kde-rounded-corners"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=("SKIP")

prepare() {
  # ensure Qt6
  sed -E -e 's&\bQUIET\b&REQUIRED&' -i "$_pkgsrc/cmake/qtversion.cmake"
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build

  DESTDIR="fakeinstall" cmake --install build
}

_package_wayland() {
  pkgdesc+=" (wayland)"
  depends=('kwin')
  optdepends=("$_pkgname-x11-git: for X11 support")

  provides=("$_pkgname=${pkgver%%.g*}")
  conflicts=("$_pkgname")

  cp -a fakeinstall/* "$pkgdir/"
  rm -rf "$pkgdir/usr/lib/qt6/plugins/kwin-x11/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_package_x11() {
  pkgdesc+=" (x11)"
  depends=(
    'kwin-x11'
    "$_pkgname=${pkgver%%.g*}"
  )

  provides=("$_pkgname-x11=${pkgver%%.g*}")
  conflicts=("$_pkgname-x11")

  mkdir -pm755 "$pkgdir/usr/lib/qt6/plugins/kwin-x11/"
  cp -a fakeinstall/usr/lib/qt6/plugins/kwin-x11/* "$pkgdir/usr/lib/qt6/plugins/kwin-x11/"
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

pkgname=("$_pkgname-git")
[[ "${_use_kwin_x11::1}" == "t" ]] && pkgname+=("$_pkgname-x11-git")

for i in "${pkgname[@]}"; do
  [[ "$i" =~ -x11 ]] && _ws="x11" || _ws="wayland"
  eval "package_$i()
    $(declare -f _package_${_ws} | tail +2)"
done
