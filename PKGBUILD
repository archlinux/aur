# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=obs-studio-rc
_pkgver=27.1.3
pkgver=`echo "$_pkgver" | tr - _`
pkgrel=1
epoch=1
pkgdesc="Beta cycle of the free and open source software for video recording and live streaming. With Browser dock and sources, VST 2 filter, FTL protocol, VLC sources. Service integration unavailable and only patches for dependencies compatibility"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "mbedtls" "jack" "gtk-update-icon-cache" "x264" "rnnoise"

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
         "vlc-luajit" "ftl-sdk")
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
makedepends=("cmake" "git" "libfdk-aac" "swig" "luajit" "python"
             "sndio"
             # AUR Packages
             "cef-minimal-obs=87.1.14")
optdepends=(
            "libfdk-aac: FDK AAC codec support"
            "intel-media-driver: Hardware encoding (>= Broadwell)"
            "libva-intel-driver: Hardware encoding (<= Haswell)"
            "libva-mesa-driver: Hardware encoding"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting"
            "sndio: Sndio input client"
            "v4l2loopback-dkms: Virtual camera output"
)
provides=("obs-studio=$pkgver")
conflicts=("obs-studio" "obs-linuxbrowser")
source=(
        "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$_pkgver"
        "python_fix.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3335.patch
        "obs-browser::git+https://github.com/obsproject/obs-browser.git"
        "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
)
sha256sums=(
        "SKIP"
        "430d7d0a7e1006c1f6309ad7d4912033dadd542b641f9d41259a5bad568379c9"
        "SKIP"
        "SKIP"
)

prepare() {
  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  cd "$srcdir/obs-studio"

  ## libobs/util: Fix loading Python binary modules on *nix (https://github.com/obsproject/obs-studio/pull/3335)
  patch -Np1 < "$srcdir/python_fix.patch"
}

build() {
  cd obs-studio
  mkdir -p build; cd build

  cmake \
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
}

# vim: ts=2:sw=2:expandtab
