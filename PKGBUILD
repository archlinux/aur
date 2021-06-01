# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

pkgname=obs-studio-tytan652
pkgver=26.1.2
pkgrel=9
pkgdesc="Free and open source software for video recording and live streaming. With Browser dock and sources, VST 2 filter, FTL protocol, working VLC sources and my bind interface PR."
arch=("i686" "x86_64")
url="https://github.com/obsproject/obs-studio"
license=("GPL2")
depends=("ffmpeg" "mbedtls" "jack" "gtk-update-icon-cache" "x264" "rnnoise"

         # "libxinerama" "qt5-svg" provided by "vlc-luajit"
         # "libxkbcommon-x11" provided by "qt5-base"
         # "jansson" "curl" provided by "ftl-sdk"

         # Needed by obs-browser
         "libxss" "libxrandr" "nss" "at-spi2-atk"
         
         # AUR Packages
         "vlc-luajit" "ftl-sdk")
# The official VLC package will make OBS crash when a VLC source is used.
# The issue is that VLC and OBS are compiled with different lua version.
# So I also created vlc-luajit, a VLC package compiled with the same lua as OBS.
# But to make people unable to install VLC official package with obs-studio-tytan652.
# I decided to make vlc-luajit a dependency of OBS rather than an optional one.
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "swig"
             "luajit" "python" "cef-minimal-obs") #"pipewire")
optdepends=(
            "libfdk-aac: FDK AAC codec support"
            "libxcomposite: XComposite capture support"
            #"pipewire: PipeWire capture support"
            #"xdg-desktop-portal-impl: PipeWire capture support"
            "libva-intel-driver: Hardware encoding"
            "libva-mesa-driver: Hardware encoding"
            "swig: Scripting"
            "luajit: Lua scripting"
            "python: Python scripting"
            "v4l2loopback-dkms: Virtual camera output"
)
provides=("obs-studio=$pkgver")
conflicts=("obs-studio" "obs-linuxbrowser")
source=(
        "obs-studio::git+https://github.com/obsproject/obs-studio.git#tag=$pkgver"
        "python_fix.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/3335.patch
        "use_system_ftl-sdk.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4018.patch
        "bind_iface.patch" # https://patch-diff.githubusercontent.com/raw/obsproject/obs-studio/pull/4219.patch
        #"en-US.ini" # Because the patch created by github can't manage different line endings
        "obs-browser::git+https://github.com/obsproject/obs-browser.git"
        "obs-vst::git+https://github.com/obsproject/obs-vst.git#commit=cca219fa3613dbc65de676ab7ba29e76865fa6f8"
)
sha256sums=(
        "SKIP"
        "430d7d0a7e1006c1f6309ad7d4912033dadd542b641f9d41259a5bad568379c9"
        "c19c48fa8cc2821281ae452acc19c3003010224ecf2f2080991a5398bac4ec2e"
        "109ffd8702b7b3973f4167f8821196b304df268205bf19e277281e65a0448182"
        #"a43f2ad974104888ef36eef49b3e60dc26f7cfc0f48300726c861978ae5ae3ea"
        #"b242289d5d186bee253ba82185ff43d5e93d7f89254055e9d4833350c6a1cc7a"
        "SKIP"
        "SKIP"
)

prepare() {
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
    -DBUILD_BROWSER=ON \
    -DCEF_ROOT_DIR=/opt/cef-obs \
    -DOBS_VERSION_OVERRIDE=$pkgver ..

  make
}

package() {
  cd obs-studio/build

  make install DESTDIR="$pkgdir"
}

# vim: ts=2:sw=2:expandtab
