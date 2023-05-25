# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
# Contributor: Hugo Denizart <hugo at denizart dot pro>
_pkgname=obs-StreamFX
pkgname=${_pkgname,,}-unstable
pkgver=0.12.0b299
pkgrel=3
pkgdesc="Bring your stream back to life with modern effects! (unstable/testing version)"
arch=("x86_64")
url="https://github.com/Xaymar/$_pkgname"
license=("GPL2")
# same dependencies as OBS Studio + nlohmann-json + ninja makedepends
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt6-base" "curl" "gtk-update-icon-cache"
         "obs-studio>=29" "nlohmann-json")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "ninja")
provides=(${_pkgname,,})
conflicts=(${_pkgname,,})
source=("$_pkgname::git+$url.git#tag="$pkgver
        'Xaymar-cmake-clang::git+https://github.com/Xaymar/cmake-clang.git'
        'Xaymar-cmake-version::git+https://github.com/Xaymar/cmake-version.git'
        'Xaymar-msvc-redist-helper::git+https://github.com/Xaymar/msvc-redist-helper.git'
        'git+https://github.com/NVIDIA/MAXINE-AR-SDK.git'
        'git+https://github.com/NVIDIA/MAXINE-VFX-SDK.git'
        'git+https://github.com/obsproject/obs-studio.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  cd $_pkgname

  # Use packaged copy of nlohmann-json header
  git rm third-party/nlohmann-json
  mkdir -p third-party/nlohmann-json
  ln -s /usr/include/nlohmann third-party/nlohmann-json/single_include

  # Use local clones of submodules
  git submodule init
  git config submodule.cmake/clang.url "$srcdir/Xaymar-cmake-clang"
  git config submodule.cmake/version.url "$srcdir/Xaymar-cmake-version"
  git config submodule.third-party/msvc-redist-helper.url "$srcdir/Xaymar-msvc-redist-helper"
  git config submodule.third-party/nvidia-maxine-ar-sdk.url "$srcdir/MAXINE-AR-SDK"
  git config submodule.third-party/nvidia-maxine-vfx-sdk.url "$srcdir/MAXINE-VFX-SDK"
  git config submodule.third-party/obs-studio.url "$srcdir/obs-studio"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_pkgname

  cmake -H. -B"build/flux" -G"Ninja" -DCMAKE_INSTALL_PREFIX="build/distrib" -DENABLE_UPDATER=FALSE -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc

  cmake --build "build/flux" --config RelWithDebInfo --target install
}

package() {
  cd $_pkgname/build/distrib/plugins/StreamFX

  install -D -m 755 bin/64bit/StreamFX.so $pkgdir/usr/lib/obs-plugins/StreamFX.so

  mkdir -p $pkgdir/usr/share/obs/obs-plugins/StreamFX
  cp -R data/* $pkgdir/usr/share/obs/obs-plugins/StreamFX
  chmod u=rwX,g=rX,o=rX $pkgdir/usr/share/obs/obs-plugins/StreamFX/*/**/*
}

# vim: ts=2:sw=2:expandtab
