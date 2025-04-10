# Maintainer: Vasiliy Stelmachenok <ventureo@cachyos.org>
## Maintainers of original Arch Linux package:
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-pure-git
pkgver=10.5.r90.g647004cd5d7
pkgrel=1
source=(
  "git+https://gitlab.winehq.org/wine/wine.git"
  "git+https://gitlab.winehq.org/wine/wine-staging.git"
  30-win32-aliases.conf
  wine-binfmt.conf
  ntsync-10.4-staging.patch
  7064.patch
  winex11.drv-Recognize-the-keyboard-in-a-locale-indep.patch
  0001-HACK-wine.inf-Add-native-builtin-overrides-for-msvcr.patch
  0002-wine.inf-Set-a-valid-Win10-ProductId.patch
  0003-wineboot-On-prefix-upgrade-update-win10-build-number.patch
  0004-wineboot-Generate-better-DigitalProductId.patch
  0005-wineboot-Load-root-certificates-on-prefix-update.patch
  Avoid-winemenubuilder-to-startup-explorer.exe.patch
  kernelbase-Fix-uninitialized-structs-in-OpenThread.patch
  winecfg-Add-tweaks-tab-page.patch
)

sha512sums=(
  'SKIP'
  'SKIP'
  '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
  'bdde7ae015d8a98ba55e84b86dc05aca1d4f8de85be7e4bd6187054bfe4ac83b5a20538945b63fb073caab78022141e9545685e4e3698c97ff173cf30859e285'
  '9351377f0d7aa2e4fef7571e34eec68e2b6a5373b23d22134fa1fa1fde84293c684497a632ac712ef6b57362a89ad993372b51d6a9e4eeef4466475a07cf178f'
  '55771f934e86b0c23bc3740c98da732c1d9b8cbf0f3452aec1e4f1b46d8253c5700bbcf9e778a782247901a3a94315aea7fd66d8a90729ec5b2f032fb06ad0fc'
  '5b8e10e9087cae45421ce31056d63f3af53b7bb1d3e8233673ac954ebeb3abb066ece51dd7f5762e3d95b5aacfa5b2f07ff0a14686e8880b97b8dfc3bb2e15f8'
  '270616bad6cc9f7c11b9a3f72a43568b233921dc30438fc0e42a00c831795238b6d144f352c8c23f261ef96f0248f62cf9f976053f7006824f7ba27191671ae4'
  'c3f8a6f8e0ea2dfe843cf93ab488bb8b24b86161f924fc153e875489f5091fb1703525f40ff0511b349491f4623a10e42d130fd007197c29dfc5eb94701010ce'
  '3c3e1e0418890523469f6ad5f00f54e822e30f347c785cbee222f4ee9c1918188e82b178b5c2a9e09e17734f98288d2c7d8d0b108414f03dc2f9c66a0431a602'
  'a78554ff2d7146921e8083a592da0d9a758859413c118cbe64744ee8b22089d0e5420a3f5ab6c592bb76900fd79c9f55c4c803d8a5a10f9fc4328e55e49e044d'
  '6e5e372f8d9bc26a22b5d56be4d17e7a6c8e4dbdc310145a23c182eaf3c22ba733fecaf73f1e9a92d3297d61f49652d09f112623bdfc81421cb741a52964d836'
  '3d621035add00dc8b5801956a7e76b4348ee2ab34c2f383e644acb88307087d339c2932e41c1053fb1128cb63efe69407953c867fe68b13b988687491711f99b'
  'f82afc38194a456b22475e3f74a19e960ccbc39e641e0c8bbe9fa5db2249f0eb07f2c0e82b7e5b823cfb308037074ed4990ece18fdcef81f368d6e58bcc04be7'
  '4fa2226b9e1d40f6fc1022a1c10b3a9693e8b735924039953f8268669e9670d5c5f547b85c8d6a38b398940feb186e94462c60974b5865932cab2bcf2a1c91e0'
)

pkgdesc="Bleeding-edge Wine build (Staging, WoW64, NTSync, Wayland)"
url="https://github.com/ventureoo/PKGBUILDs"
arch=(x86_64)
options=(staticlibs !lto)
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
provides=("wine-staging" "wine" 'wine-wow64')
conflicts=("wine")
makedepends=(${makedepends[@]} ${depends[@]})
install=wine.install

pkgver() {
  git -C wine describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^wine.//;s/^v//;s/\.rc/rc/'
}

prepare() {
  # Get rid of old build dirs
  rm -rf "$pkgname-build"
  mkdir "$pkgname-build"

  cd wine

  # apply wine-staging patchset (no Esync to prevent conflicts with NTSync)
  ../wine-staging/staging/patchinstall.py --backend=git-apply --all \
    -W server-Signal_Thread \
    -W eventfd_synchronization

  # NTSync for Wine 10.4
  patch -Np1 -i "${srcdir}/ntsync-10.4-staging.patch"

  # Use native Visual C++ DLLs, fix Windows product version
  patch -Np1 -i "${srcdir}/0001-HACK-wine.inf-Add-native-builtin-overrides-for-msvcr.patch"
  patch -Np1 -i "${srcdir}/0002-wine.inf-Set-a-valid-Win10-ProductId.patch"
  patch -Np1 -i "${srcdir}/0003-wineboot-On-prefix-upgrade-update-win10-build-number.patch"
  patch -Np1 -i "${srcdir}/0004-wineboot-Generate-better-DigitalProductId.patch"
  patch -Np1 -i "${srcdir}/0005-wineboot-Load-root-certificates-on-prefix-update.patch"

  # Fixes crashes in many games in new WoW64 mode
  # https://bugs.winehq.org/show_bug.cgi?id=57444
  patch -Np1 -i "${srcdir}/7064.patch"

  # Make keyboard shortcuts independent of layout
  # https://bugs.winehq.org/show_bug.cgi?id=30984
  patch -Np1 -i "${srcdir}/winex11.drv-Recognize-the-keyboard-in-a-locale-indep.patch"

  # Fixes "The explorer process failed to start" issue
  patch -Np1 -i "${srcdir}/Avoid-winemenubuilder-to-startup-explorer.exe.patch"

  # Fixes struct alignment inside kernelbase.OpenThread()
  # Fixes: Hogwarts Legacy
  patch -Np1 -i "${srcdir}/kernelbase-Fix-uninitialized-structs-in-OpenThread.patch"

  # Add tweaks tab page in winecfg
  patch -Np1 -i "${srcdir}/winecfg-Add-tweaks-tab-page.patch"

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
  export CFLAGS="-O3 -march=$march -mtune=$mtune -mfpmath=sse -fwrapv -fno-strict-aliasing -pipe"
  export CROSSCFLAGS="$CFLAGS"
  export CROSSCXXFLAGS="$CROSSCFLAGS"
  export CROSSLDFLAGS="-Wl,-O1"
  export LDFLAGS="-Wl,-O1,--sort-common,--as-needed"

  echo "Building Wine..."
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
