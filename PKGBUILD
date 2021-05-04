# Maintainer: tytan652 <tytan652 at tytanium dot xyz>
pkgname=obs-studio-tytan652
# Use same CEF as obs project PPA
_cefname=cef_binary_76.1.13+gf19c584+chromium-76.0.3809.132
pkgver=26.1.2
pkgrel=6
pkgdesc="Free and open source software for video recording and live streaming. Built with Browser, VST plugins and my bind interface PR. No FTL"
# Why no FTL ? Because Mixer is dead
# Why no Python ? Because it doesn't work out of the box with Python 3.9
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11" "mbedtls"
         "qt5-svg" "qt5-x11extras" "curl" "jack" "gtk-update-icon-cache")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264"
             "vlc" "swig" "luajit" 'python')
optdepends=(
            "libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            "libva-intel-driver: hardware encoding"
            "libva-mesa-driver: hardware encoding"
            "vlc: VLC Media Source"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: scripting support"
            "v4l2loopback-dkms: Virtual camera output"
)
provides=("obs-studio=$pkgver")
conflicts=("obs-studio" "obs-linuxbrowser")
source=(
        "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
        "bind_iface.patch::https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch"
        "python_fix.patch::https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3335.patch"
        "obs-browser::git+https://github.com/obsproject/obs-browser.git"
        "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
)
source_x86_64=("https://cef-builds.spotifycdn.com/${_cefname}_linux64_minimal.tar.bz2")
source_i686=("https://cef-builds.spotifycdn.com/${_cefname}_linux32_minimal.tar.bz2")
sha256sums=(
        "SKIP"
        "SKIP"
        "SKIP"
        "SKIP"
        "SKIP"
)
sha256sums_x86_64=("6b0dfa8ddafcec822fcd20018cf081959ffa6d0565be3793da1f596ac0733c38")
sha256sums_i686=("baa0624e2d6b86a60d18117cb65e125f882ef66cf413cd7ac63a480d904004f0")

prepare() {
  if [[ $CARCH == 'x86_64' ]]; then
    export CEF=ON
    export CEF_ARCH=64
  elif [[ $CARCH == 'i686' ]]; then
    export CEF=ON
    export CEF_ARCH=32
  else
    export CEF=OFF
  fi

  # Build CEF wrapper
  cd "$srcdir/${_cefname}_linux${CEF_ARCH}_minimal"

  sed -i 's/-Werror/#-Werror/g' cmake/cef_variables.cmake
  cmake .
  make libcef_dll_wrapper

  # Fix CEF read permissions
  chmod 644 libcef_dll_wrapper/libcef_dll_wrapper.a

  cd "$srcdir/obs-studio"
  git config submodule.plugins/obs-browser.url $srcdir/obs-browser
  git submodule update
  # Add network interface binding for RTMP on Linux (https://github.com/obsproject/obs-studio/pull/4219)
  patch -Np1 < "$srcdir/bind_iface.patch"
  # libobs/util: Fix loading Python binary modules on *nix (https://github.com/obsproject/obs-studio/pull/3335)
  patch -Np1 < "$srcdir/python_fix.patch"

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
    -DCEF_ROOT_DIR="$srcdir/${_cefname}_linux${CEF_ARCH}_minimal" \
    -DOBS_VERSION_OVERRIDE=$pkgver ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2:expandtab
