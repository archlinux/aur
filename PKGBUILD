# Maintainer:
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: SoulHarsh007 <admin@soulharsh007.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

## options
: ${_use_sodeps:=false}

_pkgname="forkgram"
pkgname="$_pkgname"
pkgver=6.3.6
pkgrel=1
pkgdesc="Fork of the Telegram Desktop messaging app"
url="https://github.com/Forkgram/tdesktop"
license=('GPL-3.0-or-later')
arch=('x86_64')

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
  minizip
  openal
  openh264
  opus
  protobuf
  qt6-base
  qt6-declarative
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
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  gperf    # for tde2e
  jemalloc # gio error when absent
  libtg_owt
  ninja
  range-v3
  tl-expected
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

conflicts=("forkgram-bin")

options=('!debug' '!emptydirs')

_pkgsrc="frk-v$pkgver-full"
_pkgsrc_tdlib="telegram-tdlib"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext"
  "$_pkgsrc_tdlib"::"git+https://github.com/tdlib/td.git"
)
sha256sums=(
  '2512fd937a822d95f5c328f191a6f9132992ff7e54dbcde4d380b59230f01963'
  'SKIP'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  echo "Building tde2e..."
  local _cmake_tde2e=(
    -B "build_tde2e"
    -S "$_pkgsrc_tdlib"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DTD_E2E_ONLY=ON
    -DBUILD_SHARED_LIBS=OFF
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_tde2e[@]}"
  cmake --build "build_tde2e"
  DESTDIR="$srcdir/deps" cmake --install "build_tde2e"

  echo "Building forkgram..."
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_PREFIX_PATH="$srcdir/deps/usr"
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    -DTDESKTOP_API_TEST=ON
    -DTDESKTOP_API_ID=611335
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libavcodec.so'
      'libavfilter.so'
      'libavformat.so'
      'libavutil.so'
      'libcrypto.so'
      'libgio-2.0.so'
      'libglib-2.0.so'
      'libgobject-2.0.so'
      'libheif.so'
      'libjpeg.so'
      'libjxl.so'
      'libjxl_threads.so'
      'liblz4.so'
      'libopenal.so'
      'libopenh264.so'
      'libopus.so'
      'libpipewire-0.3.so'
      'libprotobuf-lite.so'
      'libssl.so'
      'libswresample.so'
      'libswscale.so'
      'libvpx.so'
      'libxkbcommon.so'
      'libxxhash.so'
      'libz.so'
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build

  # remove unwanted files
  find "$pkgdir/usr/share/icons" -name '*.png' -delete
  find "$pkgdir/usr/share/icons" -name '*.svg' -delete
  rm "$pkgdir/usr/share/applications/org.telegram.desktop.desktop"
  rm "$pkgdir/usr/share/metainfo/org.telegram.desktop.metainfo.xml"
  rm "$pkgdir/usr/share/dbus-1/services/org.telegram.desktop.service"

  # rename executable
  mv -v "$pkgdir"/usr/bin/{Telegram,"$_pkgname"}

  # icon
  install -Dm644 "$srcdir/$_pkgsrc/Telegram/Resources/art/forkgram/logo_256.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # service
  install -Dm644 /dev/stdin "$pkgdir/usr/share/dbus-1/services/forkgram.service" << END
[D-BUS Service]
Name=org.telegram.desktop
Exec=/usr/bin/$_pkgname
END

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=${_pkgname^}
Comment=$pkgdesc
TryExec=$_pkgname
Exec=$_pkgname -- %u
Icon=$_pkgname
Terminal=false
StartupWMClass=TelegramDesktop
Type=Application
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;x-scheme-handler/tonsite;
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;$_pkgname
Actions=quit;
DBusActivatable=true
SingleMainWindow=true
X-GNOME-UsesNotifications=true
X-GNOME-SingleWindow=true

[Desktop Action quit]
Exec=$_pkgname -quit
Name=Quit ${_pkgname^}
Icon=application-exit
END
}
