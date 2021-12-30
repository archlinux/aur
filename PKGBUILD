# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-rc
_pkgver=27.2.0-beta1
pkgver=${_pkgver//-/_}
pkgrel=1
epoch=1
pkgdesc="Beta cycle of the free and open source software for video recording and live streaming. With Browser dock and sources, VST 2 filter, FTL protocol, VLC sources. Service integration unavailable and only patches for dependencies compatibility"
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
  "ffmpeg-obs" "vlc-luajit" "ftl-sdk"
)
# To manage mbedtls rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
# Also OBS will need a patch when mbedtls 3 is on the repo
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  depends+=("mbedtls<3.0.0")
else
  depends+=("mbedtls>=$_mbedtlsver" "mbedtls<3.0.0")
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
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$_pkgver"
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
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
  "2313f237e80b5160c5716e30cd7ac0a6a51c09a7ec83485ee33362de6e390009"
  "72b6aca44bfdc854b68c101c3304b927fa2411d6c05567f07252b335617d917d"
)
fi

if [[ $CARCH == 'x86_64' ]] || [[ $CARCH == 'i686' ]]; then
  optdepends+=("decklink: Blackmagic Design DeckLink support")
fi

if [[ $CARCH == 'x86_64' ]]; then
  makedepends+=("cef-minimal-obs=95.0.0_MediaHandler.2462+g95e19b8+chromium_95.0.4638.69")
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
    -DOBS_VERSION_OVERRIDE="$_pkgver-$pkgrel" ..

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
