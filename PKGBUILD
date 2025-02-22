# Maintainer: Frederik “Freso” S. Olesen <archlinux at freso.dk>
# Contributor: Hugo Denizart <hugo at denizart dot pro>
_pkgname=obs-StreamFX-free
pkgname=$(sed 's/free$/unstable/' <<< "${_pkgname,,}")
pkgver=0.12.0b372
pkgrel=2
pkgdesc="Bring your stream back to life with modern effects! (unstable/testing version)"
arch=("x86_64" "x86_64_v3")
url="https://github.com/DAMIOSKIDEV/$_pkgname"
license=('GPL-2.0-only') # no "any later version" mention in source tree
# same dependencies as OBS Studio + nlohmann-json + ninja makedepends
depends=("ffmpeg" "jansson" "libxinerama" "libxkbcommon-x11"
         "qt6-base" "curl" "gtk-update-icon-cache"
         "obs-studio>=29" "nlohmann-json")
makedepends=("cmake" "git" "libfdk-aac" "libxcomposite" "x264" "jack"
             "vlc" "swig" "luajit" "python" "ninja")
provides=(${pkgname%-unstable})
conflicts=(${pkgname%-unstable})
source=("$_pkgname::git+$url.git#tag="$pkgver
        'Xaymar-cmake-clang::git+https://github.com/Xaymar/cmake-clang.git'
        'Xaymar-cmake-version::git+https://github.com/Xaymar/cmake-version.git'
        'Xaymar-msvc-redist-helper::git+https://github.com/Xaymar/msvc-redist-helper.git'
        'MAXINE-AR-SDK::git+https://codeberg.org/Freso/NVIDIA-MAXINE-AR-SDK.git'
        'MAXINE-AFX-SDK::git+https://codeberg.org/Freso/NVIDIA-MAXINE-AFX-SDK.git'
        'MAXINE-VFX-SDK::git+https://codeberg.org/Freso/NVIDIA-MAXINE-VFX-SDK.git'
        'git+https://github.com/obsproject/obs-studio.git')
b2sums=('cba3585f64b48054c075f2cd73b923e545ea739720de93d34d004ff15576852b94c19cc2bff8f6761a3bd7afcb962b71c7085be6087550191c90f1bbf3279069'
        'SKIP'
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
  git config submodule.third-party/nvidia-maxine-afx-sdk.url "$srcdir/MAXINE-AFX-SDK"
  git config submodule.third-party/nvidia-maxine-vfx-sdk.url "$srcdir/MAXINE-VFX-SDK"
  git config submodule.third-party/obs-studio.url "$srcdir/obs-studio"

  git -c protocol.file.allow=always submodule update

  sed -i 's/AV_PIX_FMT_XVMC/AV_PIX_FMT_XV30/' components/ffmpeg/source/ffmpeg/tools.cpp
  sed -i 's/AV_OPT_TYPE_CHANNEL_LAYOUT/AV_OPT_TYPE_CHLAYOUT/' components/ffmpeg/source/encoders/ffmpeg/debug.cpp
}

build() {
  cd $_pkgname

  cmake -H. -B"build/flux" -G"Ninja" -DCMAKE_INSTALL_PREFIX="build/distrib" -DENABLE_UPDATER=FALSE -DCMAKE_CXX_COMPILER=g++ -DCMAKE_C_COMPILER=gcc

  cmake --build "build/flux" --config RelWithDebInfo --target install
}

package() {
  cd $_pkgname/build/distrib/plugins/StreamFX

  install -D -m 755 bin/64bit/StreamFX.so $pkgdir/usr/lib/obs-plugins/StreamFX.so

  mkdir -p "$pkgdir"/usr/share/obs/obs-plugins/StreamFX
  cp -R data/* "$pkgdir"/usr/share/obs/obs-plugins/StreamFX
  chmod u=rwX,g=rX,o=rX "$pkgdir"/usr/share/obs/obs-plugins/StreamFX/*/**/*
}

# vim: ts=2:sw=2:expandtab
