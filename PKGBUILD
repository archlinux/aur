# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
# Contributor: Alice Gaudon <alice at gaudon dot pro>
# Contributor: Benjamin Klettbach <b dot klettbach at gmail dot com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: ArcticVanguard <LideEmily at gmail dot com>
# Contributor: ledti <antergist at gmail dot com>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-browser
pkgver=27.2.4
pkgrel=2
pkgdesc="Free and open source software for video recording and live streaming. With everything except service integration"
arch=("x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL3")
_mbedtlsver=2.28
_pythonver=3.10
depends=(
  "jack" "gtk-update-icon-cache" "x264" "rnnoise" "pciutils"

  # "libxinerama" "qt5-svg" provided by "vlc-luajit"
  # "libxkbcommon-x11" provided by "qt5-base"
  # "jansson" "curl" provided by "ftl-sdk"

  # Needed to use Qt on Wayland platform
  "qt5-wayland"

  # Both needed to load linux-capture, so those two are no longer optional
  "libxcomposite" "pipewire"

  # Needed to use PipeWire capture
  "xdg-desktop-portal"

  # Needed by obs-browser
  "libxss" "libxrandr" "nss" "at-spi2-atk"
         
  # AUR Packages
  "ffmpeg-obs>=5" "vlc-luajit" "ftl-sdk"
)
# To manage mbedtls rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
# Also OBS will need a patch when mbedtls 3 is on the repo
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=('mbedtls')
else
  depends+=("mbedtls>=$_mbedtlsver")
fi
## About vlc-luajit
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
## About ffmpeg-obs
# Read ffmpeg-obs PKGBUILD for more info
makedepends=(
  "cmake" "git" "libfdk-aac" "swig" "luajit" "sndio" "lsb-release"

  # AUR Packages
  "libajantv2"
  "cef-minimal-obs=95.0.0_MediaHandler.2462+g95e19b8+chromium_95.0.4638.69_3"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  makedepends+=('python')
else
  makedepends+=("python>=$_pythonver")
fi
optdepends=(
  "libfdk-aac: FDK AAC codec support"
  "intel-media-driver: Hardware encoding (>= Broadwell)"
  "libva-intel-driver: Hardware encoding (<= Haswell)"
  "libva-mesa-driver: Hardware encoding"
  "swig: Scripting"
  "luajit: Lua scripting"
  "sndio: Sndio input client"
  "v4l2loopback-dkms: Virtual camera output"
  "libajantv2: AJA NTV 2 support"
  "decklink: Blackmagic Design DeckLink support"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  optdepends+=("python: Python scripting")
else
  optdepends+=("python>=$_pythonver: Python scripting")
fi
provides=("obs-studio=$pkgver" "obs-vst" "obs-browser")
conflicts=("obs-studio" "obs-vst" "obs-browser" "obs-linuxbrowser")
options=('debug')
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "git+https://github.com/obsproject/obs-browser.git"
  "git+https://github.com/obsproject/obs-vst.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
source+=(
  "$pkgname.hook"
  "$pkgname.sh"
)
sha256sums+=(
  "e65c155cb5c35160d44ae3117f1fc69a9300bf12bfcdd337b139197b48b86654"
  "e5699cf7735c0d765b433d322917ae93238f26f5f332f2d351f1e85a3d1e2849"
)
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  ## linux-capture: Don't initialize format info if init_obs_pipewire fails (https://github.com/obsproject/obs-studio/commit/9903d73f36809c20795d5a918f2898fa6b8b88f8)
  sed -i '1438 a return NULL; }' plugins/linux-capture/pipewire.c
  sed -i '1437 a {' plugins/linux-capture/pipewire.c

  ## linux-pipewire: Version check call to pw_deinit (https://github.com/obsproject/obs-studio/commit/bf660b1d8dc1905527bb5919b1034c7b43c55dac)
  sed -i '74,77d' plugins/linux-capture/linux-capture.c

  ## libobs,obs-outputs: Fix librtmp1 dependency interference on some linuxes (https://github.com/obsproject/obs-studio/pull/6377)
  sed -i 's/#define EXPORT/#define EXPORT __attribute__((visibility("default")))/g' libobs/util/c99defs.h

  ## obs-ffmpeg: Several fixes allowing support of FFmpeg 5 (https://github.com/obsproject/obs-studio/pull/6423)
  git cherry-pick -n e66542075d5d2cb51a14a0bdf3458ac10757de64
  git cherry-pick -n 5b6cc73c2475abe6a85647604b9ce937dec09000
  git cherry-pick -n 12d1f1c3358f7231244db0b971a333445e346f80
}

build() {
  cd obs-studio
  mkdir -p build; cd build

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR="/opt/cef-obs" \
    -DOBS_VERSION_OVERRIDE="$pkgver-browser-$pkgrel" ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"

  if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
    install -D -m644 "$srcdir/$pkgname.hook" -t "${pkgdir}"/usr/share/libalpm/hooks/
    install -D -m755 "$srcdir/$pkgname.sh" -t "${pkgdir}"/usr/share/libalpm/scripts/
  fi
}
