# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

# NOTE: If the CEF version (for the browser source) is not available in your architecture, OBS will be built without it.

pkgname=obs-studio-tytan652
# Use same CEF as obs project PPA
_cefver=76.1.13+gf19c584+chromium-76.0.3809.132
#_cefver=87.1.14+ga29e9a3+chromium-87.0.4280.141
pkgver=26.1.2
pkgrel=8
pkgdesc="Free and open source software for video recording and live streaming. With Browser dock and sources, VST 2 filter, FTL protocol, working VLC sources and my bind interface PR."
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11" "mbedtls"
         "qt5-svg" "curl" "jack" "gtk-update-icon-cache"
         
         "qt5-x11extras"
         
         # AUR Packages
         "vlc-luajit" "ftl-sdk")
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264"
             "swig" "luajit" "python")
optdepends=(
            "libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "libva-intel-driver: hardware encoding"
            "libva-mesa-driver: hardware encoding"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: scripting support"
            "v4l2loopback-dkms: Virtual camera output"
)
provides=("obs-studio=$pkgver")
conflicts=("obs-studio" "obs-linuxbrowser")
source=(
        "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
        "python_fix.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3335.patch
        "use_system_ftl-sdk.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4018.patch
        "bind_iface.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch
        "obs-browser::git+https://github.com/obsproject/obs-browser.git"
        "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
)
source_x86_64=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linux64_minimal.tar.bz2")
source_i686=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linux32_minimal.tar.bz2")
#source_aarch64=("https://cef-builds.spotifycdn.com/cef_binary_${_cefver}_linuxarm64_minimal.tar.bz2") will be available for OBS 27
sha256sums=(
        "SKIP"
        "430d7d0a7e1006c1f6309ad7d4912033dadd542b641f9d41259a5bad568379c9"
        "c19c48fa8cc2821281ae452acc19c3003010224ecf2f2080991a5398bac4ec2e"
        "109ffd8702b7b3973f4167f8821196b304df268205bf19e277281e65a0448182"
        "SKIP"
        "SKIP"
)
sha256sums_x86_64=("6b0dfa8ddafcec822fcd20018cf081959ffa6d0565be3793da1f596ac0733c38")
#sha256sums_x86_64=("")
sha256sums_i686=("baa0624e2d6b86a60d18117cb65e125f882ef66cf413cd7ac63a480d904004f0")
#sha256sums_i686=("")
#sha256sums_aarch64=("")

if [[ $CARCH == 'x86_64' ]]; then
  CEF=ON
  CEF_ARCH=64
elif [[ $CARCH == 'i686' ]]; then
  CEF=ON
  CEF_ARCH=32
#elif [[ $CARCH == 'aarch64' ]]; then
#  CEF=ON
#  CEF_ARCH=arm64
else
  CEF=OFF
fi

prepare() {
  # Build CEF wrapper
  cd "$srcdir/cef_binary_${_cefver}_linux${CEF_ARCH}_minimal"

  sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
  cmake .
  make libcef_dll_wrapper

  cd "$srcdir/obs-studio"
  #git config submodule.plugins/obs-vst.url $srcdir/obs-vst
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update

  # libobs/util: Fix loading Python binary modules on *nix (https://github.com/obsproject/obs-studio/pull/3335)
  patch -Np1 < "$srcdir/python_fix.patch"
  # obs-outputs: Use system-wide FTL-SDK if present (https://github.com/obsproject/obs-studio/pull/4018)
  patch -Np1 < "$srcdir/use_system_ftl-sdk.patch"
  # Add network interface binding for RTMP on Linux (https://github.com/obsproject/obs-studio/pull/4219)
  patch -Np1 < "$srcdir/bind_iface.patch"

  cd plugins
  # Replace obs-vst submodule by the repo with same last commit. Will be reverted when 27 is out.
  rm -rf obs-vst
  cp -r $srcdir/obs-vst obs-vst

  cd obs-vst
  # obs-vst: fix memory leak
  git cherry-pick -n 944c1c962748ee48ab0eca24bacc5354c169eb60
  # obs-vst: Fix VST_PATH use under Linux
  git cherry-pick -n f34327d98c0a54a6da29d37f0b8db790b6adbe4e
}

build() {
  cd obs-studio

  mkdir -p build; cd build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_BROWSER=$CEF \
    -DCEF_ROOT_DIR="$srcdir/cef_binary_${_cefver}_linux${CEF_ARCH}_minimal" \
    -DOBS_VERSION_OVERRIDE=$pkgver ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2:expandtab
