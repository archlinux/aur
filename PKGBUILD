# Maintainer:
# Contributor: zneix <zneix@zneix.eu>

pkgname="chatterino2-7tv-git"
pkgver=7.5.0beta1.r0.gdb4456f
pkgrel=1
pkgdesc='A fork of Chatterino2 with built-in support for 7tv emotes'
url="https://github.com/SevenTV/chatterino7"
license=('MIT')
arch=('x86_64')

depends=(
  libavif
  openssl
  qt6-5compat
  qt6-base
  qt6-imageformats
  qt6-svg
  qtkeychain-qt6
)
makedepends=(
  boost
  cmake
  git
  ninja
)
optdepends=(
  'streamlink: For piping streams to video players'
)

provides=('chatterino')
conflicts=('chatterino')

_pkgsrc="chatterino7"
source=(
  "git+https://github.com/SevenTV/chatterino7"
  "git+https://github.com/Chatterino/libcommuni#branch=chatterino-cmake"
  "git+https://github.com/pajlada/settings"
  "git+https://github.com/pajlada/signals"
  "git+https://github.com/pajlada/serialize"
  "git+https://github.com/Tencent/rapidjson"
  "git+https://github.com/zaphoyd/websocketpp"
  "git+https://github.com/arsenm/sanitizers-cmake"
  "git+https://github.com/Neargye/magic_enum"
  "git+https://github.com/mackron/miniaudio"
  "git+https://github.com/Chatterino/crash-handler"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

# We temporarily disable LTO since we get an ICE when compiling with gcc since this commit https://github.com/Chatterino/chatterino2/commit/ed20e71db4c957d3b2a8ce9350b847f4c805cb83
options=('!lto')

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | grep -E '([0-9]+)\.([0-9]+)\.([0-9]+)' | grep -v test | sort -rV | head -1)
  local _version=$(sed -E 's/^[^0-9]*//;s/-(beta)\.?/\1/' <<< "$_tag")
  local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
  local _commit=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.g%s" "${_version:?}" "${_revision:?}" "${_commit:?}"
}

prepare () {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
  git config submodule.lib/libcommuni.url "$srcdir/libcommuni"
  git config submodule.lib/settings.url "$srcdir/settings"
  git config submodule.lib/signals.url "$srcdir/signals"
  git config submodule.lib/serialize.url "$srcdir/serialize"
  git config submodule.lib/rapidjson.url "$srcdir/rapidjson"
  git config submodule.lib/websocketpp.url "$srcdir/websocketpp"
  git config submodule.lib/miniaudio.url "$srcdir/miniaudio"
  git config submodule.lib/magicenum.url "$srcdir/magicenum"
  git config submodule.tools/crash-handler.url "$srcdir/crash-handler"
  git -c protocol.file.allow=always submodule update
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_SYSTEM_QTKEYCHAIN=ON
    -DUSE_PRECOMPILED_HEADERS=OFF
    -DBUILD_WITH_QT6=ON
    -DCHATTERINO_UPDATER=OFF
    -Wno-dev
  )

  if [[ "$CXXFLAGS" == *"-flto"* ]]; then
    _cmake_options+=("-DCHATTERINO_LTO=ON")
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  if [ -f "build/bin/chatterino" ] && [ -x "build/bin/chatterino" ]; then
    echo "Getting chatterino binary from bin folder"
    install -Dm755 "build/bin/chatterino" "$pkgdir/usr/bin/chatterino"
  else
    echo "Getting chatterino binary from NON-BIN folder"
    # System ccache is enabled, causing the binary file to not fall into the bin folder
    # Temporary solution until we have figured out a way to stabilize the ccache output
    install -Dm755 "build/chatterino" "$pkgdir/usr/bin/chatterino"
  fi

  cd "$_pkgsrc"

  install -Dm644 "resources/com.chatterino.chatterino.desktop" "$pkgdir/usr/share/applications/com.chatterino.chatterino.desktop"
  install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/com.chatterino.chatterino.png"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
