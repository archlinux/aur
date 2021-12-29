# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-rc
_pkgver=27.1.3
pkgver=${_pkgver//-/_}
pkgrel=4
epoch=1
pkgdesc="Beta cycle of the free and open source software for video recording and live streaming. With Browser dock and sources, VST 2 filter, FTL protocol, VLC sources. Service integration unavailable and only patches for dependencies compatibility"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
_mbedtlsver=0
_pythonver=0
else
_mbedtlsver=2.28
_pythonver=3.10
fi
depends=(
  "jack" "gtk-update-icon-cache" "x264" "rnnoise" #"pciutils"

  # To manage mbedtls rebuild easily, this will prevent you to rebuild OBS on non-updated system
  # For Manjaro user this feature is disabled
  # Also OBS will need a patch when mbedtls 3 is on the repo
  "mbedtls>=$_mbedtlsver" "mbedtls<3.0.0"

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
  
  # To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
  # For Manjaro user this feature is disabled
  "python>=$_pythonver"

  # AUR Packages
  "cef-minimal-obs=87.1.14"
)
optdepends=(
  "libfdk-aac: FDK AAC codec support"
  "intel-media-driver: Hardware encoding (>= Broadwell)"
  "libva-intel-driver: Hardware encoding (<= Haswell)"
  "libva-mesa-driver: Hardware encoding"
  "swig: Scripting"
  "luajit: Lua scripting"
  "python>=$_pythonver: Python scripting"
  "sndio: Sndio input client"
  "v4l2loopback-dkms: Virtual camera output"
)
provides=("obs-studio=$pkgver" "obs-browser" "obs-vst")
conflicts=("obs-studio" "obs-linuxbrowser" "obs-browser" "obs-vst")
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

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  ## UI: Link python when obs-scripting python is enabled (https://github.com/obsproject/obs-studio/commit/1017cd5430602f695713f191ef8f5fa9940baee6)
  git cherry-pick --no-commit 1017cd5430602f695713f191ef8f5fa9940baee6

  ## UI: Update python linkage for older compilers (https://github.com/obsproject/obs-studio/commit/293b7951ed5a22529ffb214029de9233190a6f2f)
  git cherry-pick --no-commit 293b7951ed5a22529ffb214029de9233190a6f2f
}

build() {
  cd obs-studio
  mkdir -p build; cd build

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE="$_pkgver-$pkgrel" ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"

  if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
    mkdir -p "${pkgdir}"/usr/share/libalpm/hooks/
    mkdir -p "${pkgdir}"/usr/share/libalpm/scripts/
    install -D -m644 "$srcdir/$pkgname.hook" "${pkgdir}"/usr/share/libalpm/hooks/
    install -D -m755 "$srcdir/$pkgname.sh" "${pkgdir}"/usr/share/libalpm/scripts/
  fi
}
