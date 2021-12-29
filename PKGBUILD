# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

DISTRIB_ID=`lsb_release --id | cut -f2 -d$'\t'`

pkgname=obs-studio-tytan652
pkgver=27.1.3
pkgrel=13
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
  "cef-minimal-obs=87.1.14"
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
  "python>=$_pythonver: Python scripting"
  "sndio: Sndio input client"
  "v4l2loopback-dkms: Virtual camera output"
  #"libajantv2: AJA NTV 2 support"
)
# To manage python rebuild easily, this will prevent you to rebuild OBS on non-updated system
# For Manjaro user this feature is disabled
if [[ $DISTRIB_ID == 'ManjaroLinux' ]]; then
  optdepends+=("python: Python scripting")
else
  optdepends+=("python>=$_pythonver: Python scripting")
fi
provides=("obs-studio=$pkgver" "obs-browser" "obs-vst")
conflicts=("obs-studio" "obs-linuxbrowser" "obs-browser" "obs-vst")
source=(
  "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
  "bind_iface.patch" # Based on https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch
  "v4l2_by-path.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3437.patch
  "obs-browser::git+https://github.com/obsproject/obs-browser.git"
  "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
)
sha256sums=(
  "SKIP"
  "a43f2ad974104888ef36eef49b3e60dc26f7cfc0f48300726c861978ae5ae3ea"
  "fb55dffcb177fd89c2cbffeb14aaf920dae2ae60dcfa934cff252315f268470e"
  "SKIP"
  "SKIP"
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

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  ## libobs/audio-monitoring: Fix PulseAudio monitoring volume for s32 format (https://github.com/obsproject/obs-studio/commit/0eed7ca98f256c1661f0c3237993a61da5c9912f)
  git cherry-pick --no-commit 0eed7ca98f256c1661f0c3237993a61da5c9912f

  ## libobs/audio-monitoring: Fix PulseAudio monitoring volume for u8 format (https://github.com/obsproject/obs-studio/commit/85f45a3ef6bbb6ca54310dc9599a86f0f7dde4b0)
  git cherry-pick --no-commit 85f45a3ef6bbb6ca54310dc9599a86f0f7dde4b0

  ## obs-ffmpeg: Fix unwritten audio-only output (https://github.com/obsproject/obs-studio/commit/499af309b51234b0e5dda81753fb655f893ce217)
  git cherry-pick --no-commit 499af309b51234b0e5dda81753fb655f893ce217

  ## pulse: fill audio monitor buffer more aggressively (https://github.com/obsproject/obs-studio/commit/5142a7685d6bbf38ed369137a6dce43e7b57852e)
  git cherry-pick --no-commit 5142a7685d6bbf38ed369137a6dce43e7b57852e

  ## obs-ffmpeg: Fix starting video packet offset in replay-buffer (https://github.com/obsproject/obs-studio/commit/2a0b9d851c878306a3d19465e597bd06f880b94e)
  git cherry-pick --no-commit 2a0b9d851c878306a3d19465e597bd06f880b94e

  ## UI: Link python when obs-scripting python is enabled (https://github.com/obsproject/obs-studio/commit/1017cd5430602f695713f191ef8f5fa9940baee6)
  git cherry-pick --no-commit 1017cd5430602f695713f191ef8f5fa9940baee6

  ## UI: Update python linkage for older compilers (https://github.com/obsproject/obs-studio/commit/293b7951ed5a22529ffb214029de9233190a6f2f)
  git cherry-pick --no-commit 293b7951ed5a22529ffb214029de9233190a6f2f

  ## obs-ffmpeg: Set DRI devices and their name persistently (https://github.com/obsproject/obs-studio/commit/4623a6b4bc4c89ceb5db684e2e7fbd57d01129aa)
  git cherry-pick --no-commit 4623a6b4bc4c89ceb5db684e2e7fbd57d01129aa

  ## libobs: Add API to get encoder frame size  (https://github.com/obsproject/obs-studio/commit/d1b87e1642ad5e485244f3594d331ce648b3353a)
  git cherry-pick --no-commit d1b87e1642ad5e485244f3594d331ce648b3353a

  ## obs-ffmpeg: Set frame_size for audio codec parameter (https://github.com/obsproject/obs-studio/commit/685f8297e406a4ef56e5be2f06268c9526c2cb3c)
  git cherry-pick --no-commit 685f8297e406a4ef56e5be2f06268c9526c2cb3c

  ## Add network interface binding for RTMP on Linux (https://github.com/obsproject/obs-studio/pull/4219)
  patch -Np1 < "$srcdir/bind_iface.patch"
  # Add translation
  echo -e "\r\n# Bind Network Interface PR translation" >> "$srcdir/obs-studio"/UI/data/locale/en-US.ini
  echo "Basic.Settings.Advanced.Network.BindToInterface=\"Bind to interface\"" >> "$srcdir/obs-studio"/UI/data/locale/en-US.ini

  ## linux-v4l2: Save device by path (https://github.com/obsproject/obs-studio/pull/3437)
  patch -Np1 < "$srcdir/v4l2_by-path.patch"
}

build() {
  cd obs-studio
  mkdir -p build; cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=ON \
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
