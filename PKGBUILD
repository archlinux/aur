# Maintainer: Vasiliy Stelmachenok <ventureo@cachyos.org>
## Maintainers of original Arch Linux package:
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-pure-git
pkgver=10.14.r196.g3cfbf9e3cd9
pkgrel=1
source=(
  "git+https://gitlab.winehq.org/wine/wine.git"
  "git+https://gitlab.winehq.org/wine/wine-staging.git"
  30-win32-aliases.conf
  wine-binfmt.conf
  ntsync-10.14-staging.patch
  winex11.drv-Recognize-the-keyboard-in-a-locale-indep.patch
  0001-HACK-wine.inf-Add-native-builtin-overrides-for-msvcr.patch
  0001-HACK-ws2_32-Block-first-internet-connection-for-some.patch
  0002-wine.inf-Set-a-valid-Win10-ProductId.patch
  0003-wineboot-On-prefix-upgrade-update-win10-build-number.patch
  0004-wineboot-Generate-better-DigitalProductId.patch
  0005-wineboot-Load-root-certificates-on-prefix-update.patch
  kernelbase-Fix-uninitialized-structs-in-OpenThread.patch
  winecfg-Add-tweaks-tab-page.patch
  ntdll-loader-add-support-for-overriding-IMAGE_FILE_L.patch
  Add-workarounds-for-game-launchers.patch
  Do-not-handle-IMAGE_FILE_LARGE_ADDRESS_AWARE-on-WoW64.patch
)

sha256sums=(
  'SKIP'
  'SKIP'
  '9901a5ee619f24662b241672a7358364617227937d5f6d3126f70528ee5111e7'
  '6dfdefec305024ca11f35ad7536565f5551f09119dda2028f194aee8f77077a4'
  'd2a05d06ab500da0c344ec5713c022e8e57724d2307373c89d6fce4e049c62b4'
  '5f1065a4a404ee424fd80baf2c4f66f1ada83a088d56bc57e99260a2444ee006'
  '13c94740b1030818c41c8745928c8d4125386066e794a7ddcd0b2f48a09ccd60'
  '7f524fff2146871019dd4d8dfb278dec6bb4dec71870d3ddfb5a7004c29a6f57'
  'de34be62e63a4187582b21a3a77d4162a33e7d777095e8e7b8fbd13cb745516f'
  '69b120ed11e07270db4e4378c8ad42d1bae418a6f8a10d98dc031ab9af0d1130'
  '236d3f562d1ce05ae9d372cd606acb0dab545579fcecae9cf14df1c253fff574'
  '771777eb4d60ef99588ed33657270533893de9a3f0c010d1fc6898ba3ec8ed74'
  'ab84b21a5b2ee097ff19c6ccf029fc25d2e43f04987e8e0e24a8ef7aeb1af322'
  '27e451af4e7d512c6247cf5d1b7ec4b31f67768469e707e37ac741468fde1d7f'
  'dddf208f2b44c38de87678fad6d3ef0ead3066acfb6540812af7d4f2b3b67f94'
  '07b0cbe87d08ce9272c15870acfc4f8a467990fc1b4405329e96d76c23f0fc58'
  'ce5a5c7ca21d748ab1ae92730456023d00d7f90ec27d0fcd28836a8bc16000ba'
)

pkgdesc="Bleeding-edge Wine build (Staging, WoW64, NTSync, Wayland)"
url="https://github.com/ventureoo/PKGBUILDs"
arch=(x86_64)
options=(!lto)
license=(LGPL-2.1-or-later)
depends=(
  desktop-file-utils
  fontconfig
  freetype2
  gcc-libs
  gettext
  libxcursor
  libxkbcommon
  libxi
  libxrandr
  wayland
  ffmpeg
  unixodbc
)
makedepends=(
  git
  alsa-lib
  gnutls
  gst-plugins-base-libs
  libpulse
  libxcomposite
  mesa
  opencl-headers
  opencl-icd-loader
  sdl2
  vulkan-headers
  vulkan-icd-loader
  mingw-w64-gcc
  "linux-api-headers>=6.14"
)
optdepends=(
  alsa-lib
  alsa-plugins
  gnutls
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-base-libs
  gst-plugins-good
  gst-plugins-ugly
  libpulse
  libxcomposite
  opencl-icd-loader
  sdl2
  wine-gecko
  wine-mono
)
provides=("wine-staging" "wine" "wine-wow64" "wine=${pkgver%.r*}")
conflicts=("wine")
install=wine.install

pkgver() {
  git -C wine describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

prepare() {
  # Get rid of old build dirs
  rm -rf "$pkgname-build"
  mkdir "$pkgname-build"

  cd wine

  # apply wine-staging patchset
  ../wine-staging/staging/patchinstall.py --backend=git-apply --all \
    -W server-Signal_Thread

  # NTSync for Wine 10.14
  patch -Np1 -i "${srcdir}/ntsync-10.14-staging.patch"

  # Use native Visual C++ DLLs, fix Windows product version
  patch -Np1 -i "${srcdir}/0001-HACK-wine.inf-Add-native-builtin-overrides-for-msvcr.patch"
  patch -Np1 -i "${srcdir}/0002-wine.inf-Set-a-valid-Win10-ProductId.patch"
  patch -Np1 -i "${srcdir}/0003-wineboot-On-prefix-upgrade-update-win10-build-number.patch"
  patch -Np1 -i "${srcdir}/0004-wineboot-Generate-better-DigitalProductId.patch"
  patch -Np1 -i "${srcdir}/0005-wineboot-Load-root-certificates-on-prefix-update.patch"

  # Make keyboard shortcuts independent of layout
  # https://bugs.winehq.org/show_bug.cgi?id=30984
  patch -Np1 -i "${srcdir}/winex11.drv-Recognize-the-keyboard-in-a-locale-indep.patch"

  # Fixes struct alignment inside kernelbase.OpenThread()
  # Fixes: Hogwarts Legacy
  patch -Np1 -i "${srcdir}/kernelbase-Fix-uninitialized-structs-in-OpenThread.patch"

  # Add tweaks tab page in winecfg
  patch -Np1 -i "${srcdir}/winecfg-Add-tweaks-tab-page.patch"

  # Patch from Proton. Works only if WINE_LARGE_ADDRESS_AWARE environment
  # variable is specified.
  patch -Np1 -i "${srcdir}/ntdll-loader-add-support-for-overriding-IMAGE_FILE_L.patch"

  # Fixes progress freezing for a number of installers, notably Fitgirl and Hatab repacks.
  patch -Np1 -i "${srcdir}/Do-not-handle-IMAGE_FILE_LARGE_ADDRESS_AWARE-on-WoW64.patch"

  # Fix black windows in some launchers when using winewayland
  patch -Np1 -i "${srcdir}/Add-workarounds-for-game-launchers.patch"

  # Fixes anti-cheat bypass for Mihoyo games
  # Patch by @NelloKudo
  patch -Np1 -i "${srcdir}/0001-HACK-ws2_32-Block-first-internet-connection-for-some.patch"

  ./dlls/winevulkan/make_vulkan
  ./tools/make_requests
  ./tools/make_specfiles
  autoreconf -f
}

build() {
  local -a split=($CFLAGS)
  local -A flags
  for opt in "${split[@]}"; do flags["${opt%%=*}"]="${opt##*=}"; done
  local march="${flags["-march"]:-"x86-64-v3"}"
  local mtune="${flags["-mtune"]:-"haswell"}"

  # Apply flags for cross-compilation (from Proton)
  export CFLAGS="-O2 -march=$march -mtune=$mtune -mfpmath=sse -fwrapv -pipe"
  export CROSSCFLAGS="$CFLAGS"
  export CROSSCXXFLAGS="$CROSSCFLAGS"
  export CROSSLDFLAGS="-Wl,-O1"
  export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

  cd "$pkgname-build"
  ../wine/configure \
    --disable-tests \
    --disable-win16 \
    --prefix=/usr \
    --libdir=/usr/lib \
    --with-x \
    --with-wayland \
    --with-gstreamer \
    --with-ffmpeg \
    --without-oss \
    --without-sane \
    --without-v4l2 \
    --without-cups \
    --without-gphoto \
    --without-xinerama \
    --without-pcsclite \
    --without-xxf86vm \
    --without-pcap \
    --enable-archs=x86_64,i386

  make
}

package() {
  cd "$pkgname-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Symlink for comptability with older scripts such as winetricks/setup_dxvk
  ln -sf /usr/bin/wine "$pkgdir"/usr/bin/wine64

  # Strip Windows binaries
  i686-w64-mingw32-strip --strip-debug "$pkgdir"/usr/lib/wine/i386-windows/*.dll
  x86_64-w64-mingw32-strip --strip-debug "$pkgdir"/usr/lib/wine/x86_64-windows/*.dll

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/wine-binfmt.conf" "$pkgdir/usr/lib/binfmt.d/wine.conf"

  # NTSync additions
  echo "ntsync" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/wine-pure.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
