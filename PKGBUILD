# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r3722.78104bc
pkgrel=1
pkgdesc='Open source clone of RollerCoaster Tycoon 2'
arch=('any')
url='https://github.com/IntelOrca/OpenRCT2'
license=('GPL3')
depends=('wine' 'mingw-w64-sdl2' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('git' 'cmake' 'mingw-w64-gcc')
conflicts=('openrct2')
provides=('openrct2')
options=('!buildflags')
install=openrct2.install
source=("$pkgname"::'git://github.com/IntelOrca/OpenRCT2.git#branch=develop'
        'orctlibs.zip::https://download.openrct2.website/dev/lib/mingw'
        'openrct2'
        'openrct2.desktop')
sha256sums=('SKIP'
            '8892b09fe99b601d72e54cc3f56894bad3b11f28df9d52adecd982a2e393efa8'
            '27db282994fe8e7ae04582704c949d9dab1959409c2905e55573418d409c2646'
            'b916d4a9f56af82693ba21f43e09ababe9f132fd7c3b78efa1b4387ee1bc3a4d')

# Enable Twitch support. This pulls in lots of mingw-w64-* packages from the AUR
# which takes a while to build. If you don't need Twitch support, it's probably
# desirable to set this to 0 before building.
_enable_twitch=1

_dlls=(SDL2.dll libwinpthread-1.dll)

if [ $_enable_twitch -eq 1 ]; then
  depends+=('mingw-w64-curl' 'mingw-w64-jansson')
  _dlls+=(libcurl-4.dll libjansson-4.dll libeay32.dll
         libgcc_s_sjlj-1.dll libidn-11.dll libssh2-1.dll ssleay32.dll zlib1.dll
         libiconv-2.dll libintl-8.dll)
fi

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # The ArchLinux jansson header files are directly under
  # /usr/i686-w64-mingw32/include.
  find src \( -name '*.c' -or -name '*.h' -or -name '*.cpp' \) \
    -exec sed -i 's@#include <jansson/@#include <@' {} \;

  # Set DISABLE_HTTP and DISABLE_TWITCH if we don't want Twitch support.
  if [ $_enable_twitch -ne 1 ]; then
    sed -i 's@#add_definitions(-DDISABLE_HTTP -DDISABLE_TWITCH)@add_definitions(-DDISABLE_HTTP -DDISABLE_TWITCH)@' CMakeLists.txt
  fi
}

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_TOOLCHAIN_FILE=CMakeLists_mingw.txt -DCMAKE_BUILD_TYPE=Debug .
  make

  # Create g2.dat. See the comment in the package() function for why we need to
  # symlink the DLLs here. openrct2.exe also seems to return a non-zero exit
  # code even if it builds the sprites successfully, so we have to ignore its
  # exit code.
  for dll in ${_dlls[@]}; do
    ln -sf /usr/i686-w64-mingw32/bin/$dll
  done
  wine openrct2.exe sprite build data/g2.dat resources/g2 || true
}

package() {
  cd "$srcdir/$pkgname"

  # Standard OpenRCT2 distribution files.
  install -Dm644 openrct2.dll "$pkgdir/usr/share/openrct2/openrct2.dll"
  install -Dm755 openrct2.exe "$pkgdir/usr/share/openrct2/openrct2.exe"

  install -Dm644 data/g2.dat "$pkgdir/usr/share/openrct2/data/g2.dat"

  install -dm755 "$pkgdir/usr/share/openrct2/data/language"
  install -m644 data/language/* "$pkgdir/usr/share/openrct2/data/language/"

  install -dm755 "$pkgdir/usr/share/openrct2/data/title/openrct2"
  install -m644 data/title/openrct2/* "$pkgdir/usr/share/openrct2/data/title/openrct2"

  install -dm755 "$pkgdir/usr/share/openrct2/data/title/rct2"
  install -m644 data/title/rct2/* "$pkgdir/usr/share/openrct2/data/title/rct2"

  # Use root certificates from ArchLinux instead of the ones bundled with
  # OpenRCT2.
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir/usr/share/openrct2/curl-ca-bundle.crt"

  # ArchLinux-specific stuff (launcher, .desktop file and icon).
  install -Dm755 "$srcdir/openrct2" "$pkgdir/usr/bin/openrct2"
  install -Dm644 "$srcdir/openrct2.desktop" "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 resources/logo/icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"

  # For Wine to find the SDL2.dll and libwinpthread-1.dll files they need to be
  # in the same directory as openrct2.exe, so we symlink them in place. We don't
  # use $CARCH here because on x86_64 OpenRCT2 is compiled with -m32,
  # therefore we always want to use the i686 DLLs. OpenRCT2 relies on
  # Wine's WoW64 support to actually run on x86_64 machines.
  for dll in ${_dlls[@]}; do
    ln -s /usr/i686-w64-mingw32/bin/$dll "$pkgdir/usr/share/openrct2"
  done
}
