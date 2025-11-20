# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}
export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="mozillavpn"
pkgname="$_pkgname-git"
pkgver=2.32.0.r41.gd364bc2
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
url="https://github.com/mozilla-mobile/mozilla-vpn-client"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'libsecret'
  'qt6-5compat'
  'qt6-declarative'
  'qt6-networkauth'
  'qt6-svg'
  'qt6-websockets'
  'wireguard-tools'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'git'
  'go'
  'ninja'
  'python-glean-parser' # AUR
  'python-lxml'
  'python-yaml'
  'qt6-tools'
  'yamllint'
)
optdepends=(
  'qt6-wayland: for Wayland support'
)

options=('!lto')

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git rm -f '3rdparty/adjust-android-sdk'
  git rm -f '3rdparty/adjust-ios-sdk'
  git rm -f '3rdparty/wireguard-apple'
  git submodule update --init --recursive --depth=1

  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Fix for Qt 6.10
  sed -E -e '/\bCore\b/i GuiPrivate QmlPrivate' -i CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  local _tag _revision _hash
  _tag=$(git tag | grep -Ev '[A-Za-z]{2}' | sort -rV | head -1)
  _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_tag#v}" "$_revision" "$_hash"
}

build() {
  export CXXFLAGS+=" -Wno-error=unused-result"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
