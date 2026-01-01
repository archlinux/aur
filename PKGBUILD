# Maintainer:
# Contributor: zneix <zneix@zneix.eu>

pkgname="chatterino2-7tv-git"
pkgver=7.5.4.r168.g35ff16d
pkgrel=1
pkgdesc='A fork of Chatterino2 with built-in support for 7tv emotes'
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
arch=('x86_64')

depends=(
  'libnotify'
  'openssl'
  'qt6-base'
  'qt6-svg'
  'qtkeychain-qt6'
)
makedepends=(
  'boost'
  'cmake'
  'expected-lite'
  'git'
  'ninja'
  'rapidjson'
)
optdepends=(
  'kimageformats: For AVIF and other format support'
  'streamlink: For piping streams to video players'
)

provides=('chatterino')
conflicts=('chatterino')

options=('!lto')

_pkgsrc="chatterino7"
source=("git+https://github.com/SevenTV/chatterino7")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git rm -r cmake/sanitizers-cmake
  git rm -r lib/WinToast
  git rm -r lib/expected-lite
  git rm -r lib/googletest
  git rm -r lib/kimageformats
  git rm -r lib/qtkeychain
  git rm -r lib/rapidjson
  git rm -r lib/twitch-eventsub-ws/lib/fmt
  git rm -r tools/crash-handler
  git submodule update --init --depth=1
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export LDFLAGS+=" -Wl,--copy-dt-needed-entries"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_SKIP_RPATH=ON
    -Wno-dev

    -DBUILD_WITH_QT6=ON
    -DCHATTERINO_LTO=OFF
    -DCHATTERINO_NO_AVIF_PLUGIN=ON # use system kimageformats
    -DCHATTERINO_UPDATER=OFF
    -DUSE_PRECOMPILED_HEADERS=OFF
    -DUSE_SYSTEM_QTKEYCHAIN=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 "build/bin/chatterino" "$pkgdir/usr/bin/chatterino"

  install -Dm644 "$_pkgsrc/resources/com.chatterino.chatterino.desktop" -t "$pkgdir/usr/share/applications/"

  install -Dm644 "$_pkgsrc/resources/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.chatterino.chatterino.png"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
