# Maintainer:
# Contributor: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: SoulHarsh007 <admin@soulharsh007.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

_pkgname="forkgram"
pkgname="$_pkgname"
pkgver=5.8.3
pkgrel=1
pkgdesc="Fork of the Telegram Desktop messaging app"
url="https://github.com/Forkgram/tdesktop"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  ada
  ffmpeg
  hunspell
  jemalloc
  kcoreaddons
  libdispatch
  libpipewire
  libvpx
  libxcomposite
  libxdamage
  libxrandr
  libxtst
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
)
makedepends=(
  boost
  cmake
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  libtg_owt
  microsoft-gsl
  mm-common
  ninja
  perl-xml-parser
  plasma-wayland-protocols
  python
  python-packaging
  range-v3
  tl-expected
  wayland-protocols
)
optdepends=(
  'webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration'
)

conflicts=("forkgram-bin")

options=('!debug' '!emptydirs')

_pkgsrc="frk-v$pkgver-full"
_pkgext="tar.gz"
source=(
  "$_pkgname-$pkgver.$_pkgext"::"https://github.com/Forkgram/tdesktop/releases/download/v$pkgver/$_pkgsrc.$_pkgext"
)
sha256sums=(
  'e30c18a7eed6ab5cc7abbd3633ca73d5f5ae0407688412dac93f1f2ec258036e'
)

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
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
  DESTDIR="$pkgdir" cmake --install build

  # remove unwanted files
  find "$pkgdir/usr/share/icons" -name '*.png' -delete
  find "$pkgdir/usr/share/icons" -name '*.svg' -delete
  rm "$pkgdir/usr/share/applications/org.telegram.desktop.desktop"
  rm "$pkgdir/usr/share/metainfo/org.telegram.desktop.metainfo.xml"
  rm "$pkgdir/usr/share/dbus-1/services/org.telegram.desktop.service"

  # rename executable
  mv -v "$pkgdir"/usr/bin/{telegram-desktop,"$_pkgname"}

  # icon
  install -Dm644 "$srcdir/$_pkgsrc/Telegram/Resources/art/forkgram/logo_256.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # service
  install -Dm644 /dev/stdin "$pkgdir/usr/share/dbus-1/services/forkgram.service" << END
[D-BUS Service]
Name=org.telegram.desktop
Exec=/usr/bin/$_pkgname
END

  # .desktop
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
