# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-tytan652
pkgver=27.2.4
pkgrel=3
pkgdesc="Free and open source software for video recording and live streaming. With Browser dock and sources, VST 2 filter, FTL protocol, VLC sources, V4L2 devices by paths, my bind interface PR, and sometimes backported fixes."
arch=("i686" "x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
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
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  optdepends+=("python: Python scripting")
else
  optdepends+=("python>=$_pythonver: Python scripting")
fi
provides=("obs-studio=$pkgver" "obs-vst")
conflicts=("obs-studio" "obs-vst")
options=('debug')
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "bind_iface.patch" # Based on https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch
  "v4l2_by-path.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3437.patch
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
  "ffmpeg_5_master_fixes.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/6423.patch
)
sha256sums=(
  "SKIP"
  "4dc22cc6a71f879486946032debef5789b144d1d108a678379910480601937ca"
  "fb55dffcb177fd89c2cbffeb14aaf920dae2ae60dcfa934cff252315f268470e"
  "SKIP"
  "SKIP"
  "91a08c02b397c49e84400f36559059f03c629b4d0df5b6689ce8eb6923c805f6"
)

if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
source+=(
  "$pkgname.hook"
  "$pkgname.sh"
)
sha256sums+=(
  "486b8297a7cabccd552a4d49f994b231f87860d32d4535906abf776eee2a377b"
  "4fb9dcb408f9481127546db0c5287e1f1b274d14cf8975b0f02c1bafb23a4c37"
)
fi

if [[ $CARCH == 'x86_64' ]] || [[ $CARCH == 'i686' ]]; then
  optdepends+=("decklink: Blackmagic Design DeckLink support")
fi

if [[ $CARCH == 'x86_64' ]]; then
  makedepends+=("cef-minimal-obs=95.0.0_MediaHandler.2462+g95e19b8+chromium_95.0.4638.69_3")
  provides+=("obs-browser")
  conflicts+=("obs-linuxbrowser" "obs-browser")
  _browser=ON
else
  _browser=OFF
fi

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  ## libobs,obs-outputs: Fix librtmp1 dependency interference on some linuxes (https://github.com/obsproject/obs-studio/pull/6377)
  sed -i 's/#define EXPORT/#define EXPORT __attribute__((visibility("default")))/g' libobs/util/c99defs.h

  ## obs-ffmpeg: Several fixes allowing support of FFmpeg 5 (https://github.com/obsproject/obs-studio/pull/6423)
  patch -Np1 < "$srcdir/ffmpeg_5_master_fixes.patch"

  ## Add network interface binding for RTMP on Linux (https://github.com/obsproject/obs-studio/pull/4219)
  patch -Np1 < "$srcdir/bind_iface.patch"

  ## linux-v4l2: Save device by path (https://github.com/obsproject/obs-studio/pull/3437)
  patch -Np1 < "$srcdir/v4l2_by-path.patch"
}

build() {
  cd obs-studio
  mkdir -p build; cd build

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=$_browser \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE="$pkgver-tytan652-$pkgrel" ..

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
