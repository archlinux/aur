# Maintainer: kekmacska
# Based on: ayugram-desktop-git by westpain and rikki48

_pkgname="claugram-desktop"
pkgname="$_pkgname-git"
pkgver=0.r24983.5d34672586
pkgrel=1
pkgdesc="A fork of Telegram Desktop focused on: Trust, UX, ToS compliance, Staying current"
url="https://github.com/alexto9090/claugram"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=(
  ada
  ffmpeg
  hunspell
  kcoreaddons
  libavif
  libdispatch
  libheif
  libjxl
  libvpx
  libxdamage
  minizip-ng
  openal
  openh264
  opus
  protobuf
  qt6-base
  qt6-imageformats
  qt6-svg
  qt6-wayland
  rnnoise
  xcb-util-keysyms
  xxhash

  ## for libtg_owt
  libpipewire
  libxcomposite
  libxrandr
  libxtst
)
makedepends=(
  boost
  boost-libs
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  gperf    # tdlib
  jemalloc
  libtg_owt
  ninja
  range-v3
  tl-expected
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
  "$_pkgname"::"git+$url.git"
  "telegram-tdlib"::"git+https://github.com/tdlib/td.git"
)
sha256sums=('SKIP' 'SKIP')


pkgver() {
  cd "$_pkgname"

  if ! git describe --tags >/dev/null 2>&1; then
    printf "0.r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
    return
  fi

  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git rm -r 'Telegram/ThirdParty/dispatch' || true
  git rm -r 'Telegram/ThirdParty/hunspell' || true
  git rm -r 'Telegram/ThirdParty/kcoreaddons' || true
  git rm -r 'Telegram/ThirdParty/lz4' || true
  git rm -r 'Telegram/ThirdParty/range-v3' || true
  git submodule update --init --recursive --depth=1

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src" || true
    fi
  done

  # force system minizip-ng
  rm -rf "Telegram/ThirdParty/minizip"
  sed -i 's/IMPORTED_TARGET minizip/IMPORTED_TARGET minizip-ng/' cmake/external/minizip/CMakeLists.txt

  # add missing headers for gcc 16
  sed -E -e '1i #include <cstdint>' -i \
    "Telegram/ThirdParty/tgcalls/tgcalls/DirectConnectionChannel.h" \
    "Telegram/ThirdParty/tgcalls/tgcalls/third-party/json11.cpp" \
    "Telegram/ThirdParty/tgcalls/tgcalls/v2/SignalingConnection.h"

  svgo . -r --multipass || true
  oxipng -o max -r -p -s -v -t $(nproc) -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 . || true
}

build() {
  BASE_CFLAGS="-O3 -march=native -mtune=native \
      -falign-functions=32 -falign-loops=32 \
      -fno-math-errno -fno-trapping-math \
      -fno-semantic-interposition \
      -fomit-frame-pointer -fno-plt \
      -pipe -flto -Wall -Wno-unused \
      -fstrict-aliasing \
      -fmerge-all-constants -ffunction-sections \
      -fdata-sections"

  BASE_CXXFLAGS="$BASE_CFLAGS"
  BASE_LDFLAGS="-Wl,--icf=safe -Wl,--gc-sections -Wl,-O3 -flto -fno-plt"

  # Clang-only flags
  CLANG_EXTRA_CFLAGS="-fstrict-vtable-pointers -fno-asynchronous-unwind-tables"
  CLANG_EXTRA_CXXFLAGS="$CLANG_EXTRA_CFLAGS"
  CLANG_EXTRA_LDFLAGS="-fuse-ld=lld"

  # Detect compiler
  if command -v clang >/dev/null 2>&1; then
      export CC=clang
      export CXX=clang++
      export CFLAGS="$BASE_CFLAGS $CLANG_EXTRA_CFLAGS"
      export CXXFLAGS="$BASE_CXXFLAGS $CLANG_EXTRA_CXXFLAGS"
      export LDFLAGS="$BASE_LDFLAGS $CLANG_EXTRA_LDFLAGS"
  else
      export CC=gcc
      export CXX=g++
      export CFLAGS="$BASE_CFLAGS"
      export CXXFLAGS="$BASE_CXXFLAGS"
      export LDFLAGS="$BASE_LDFLAGS"
  fi

  printf "\nBuilding tde2e..."
  local _cmake_tde2e=(
    -B "build_tde2e"
    -S "telegram-tdlib"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DTD_E2E_ONLY=ON
    -DBUILD_SHARED_LIBS=OFF
    -DBUILD_TESTING=OFF
    -Wno-author
  )

  cmake "${_cmake_tde2e[@]}"
  cmake --build "build_tde2e" -j$(nproc)
  DESTDIR="$srcdir/deps" cmake --install "build_tde2e"

  printf "\nBuilding ayugram..."
  local _cmake_options=(
    -B build
    -S "$_pkgname"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    -DTDESKTOP_API_ID=611335
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build -j$(nproc)
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    # Rename Telegram icons if any exist
    if command -v fd >/dev/null 2>&1; then
        while IFS= read -r -d '' f; do
            mv "$f" "${f/org.telegram.desktop/claugram}"
        done < <(
            fd -0 -t f 'org\.telegram\.desktop.*' \
                "$pkgdir/usr/share/icons"
        )
    else
        while IFS= read -r -d '' f; do
            mv "$f" "${f/org.telegram.desktop/claugram}"
        done < <(
            find "$pkgdir/usr/share/icons" \
                -type f \
                -name 'org.telegram.desktop*' \
                -print0
        )
    fi

cat > "$pkgdir/usr/share/applications/claugram.desktop" <<'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=ClauGram
GenericName=Messenger
Comment=A fork of Telegram Desktop focused on: Trust, UX, ToS compliance, Staying current
Exec=ClauGram -- %U
TryExec=ClauGram
Icon=claugram
Terminal=false
StartupWMClass=TelegramDesktop
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;x-scheme-handler/tonsite;
Keywords=tg;telegram;chat;messenger;
SingleMainWindow=true
X-GNOME-UsesNotifications=true
X-GNOME-SingleWindow=true
Actions=quit;

[Desktop Action quit]
Name=Quit ClauGram
Exec=ClauGram -quit
Icon=application-exit
EOF

    # Update AppStream metadata if present
    if [[ -f "$pkgdir/usr/share/metainfo/org.claugram.desktop.metainfo.xml" ]]; then
        sed -i \
            -e 's/org\.telegram\.desktop/org.claugram.desktop/g' \
            -e 's/Telegram Desktop/ClauGram/g' \
            -e 's/>Telegram</>ClauGram</g' \
            "$pkgdir/usr/share/metainfo/org.claugram.desktop.metainfo.xml"
    fi

    # Update D-Bus service if present
    if [[ -f "$pkgdir/usr/share/dbus-1/services/org.claugram.desktop.service" ]]; then
        cat > "$pkgdir/usr/share/dbus-1/services/org.claugram.desktop.service" <<'EOF'
[D-BUS Service]
Name=org.claugram.desktop
Exec=/usr/bin/ClauGram
EOF
    fi
}
