# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=moonlight-vrr
pkgver=6.1.0_vrr18
pkgrel=1
pkgdesc="GameStream client for PCs, fork of moonlight-qt with smooth VRR pacing"
arch=('x86_64')
url="https://github.com/Nonary/moonlight-qt"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'glibc' 'hicolor-icon-theme' 'libdrm' 'libgcc' 'libglvnd' 'libplacebo'
         'libstdc++' 'libva' 'libx11' 'openssl' 'opus' 'qt6-base' 'qt6-declarative'
         'qt6-svg' 'sdl2-compat' 'sdl2_ttf' 'wayland')
makedepends=('vulkan-headers')
optdepends=('libva-intel-driver: hardware acceleration for Intel GPUs up to Coffee Lake'
            'intel-media-driver: hardware acceleration for Intel GPUs from Broadwell on')
provides=('moonlight-qt')
conflicts=('moonlight-qt')
# upstream tags use hyphens (v6.1.0-vrr18), which pkgver must not contain
_upver="${pkgver//_/-}"
# The tag tarball has none of the git submodules. Each is pinned to the commit
# the tag references, synced by pkg.sh. enet and nanors are submodules of
# moonlight-common-c.
_common_c="d6a11bc685b41037b352a96f29d08276fe5359ba"
_enet="aca87840b57f045a1f7f9299e4b1b9b8e2a5e2f1"
_nanors="b1e3c22ca0cdc0bb83e3cd6ed1a2fc77869ed99a"
_qmdnsengine="920c097ffa742e2968290f15d4dde6693aec02e5"
_gamecontrollerdb="8d9fefd7b810f2541f78cc7a8ccbd185bc84c7a5"
_h264bitstream="34f3c58afa3c47b6cf0a49308a68cbf89c5e0bff"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${_upver}.tar.gz"
        "moonlight-common-c-${_common_c}.tar.gz::https://github.com/Nonary/moonlight-common-c/archive/${_common_c}.tar.gz"
        "enet-${_enet}.tar.gz::https://github.com/cgutman/enet/archive/${_enet}.tar.gz"
        "nanors-${_nanors}.tar.gz::https://github.com/sleepybishop/nanors/archive/${_nanors}.tar.gz"
        "qmdnsengine-${_qmdnsengine}.tar.gz::https://github.com/cgutman/qmdnsengine/archive/${_qmdnsengine}.tar.gz"
        "SDL_GameControllerDB-${_gamecontrollerdb}.tar.gz::https://github.com/gabomdq/SDL_GameControllerDB/archive/${_gamecontrollerdb}.tar.gz"
        "h264bitstream-${_h264bitstream}.tar.gz::https://github.com/aizvorski/h264bitstream/archive/${_h264bitstream}.tar.gz")
sha256sums=('c5daa59fe3ec058500f57fbae61a3c6697d020a2c3649f36cd2232ea7e999bff' '55e62d1735f6e676193d792077c732edb4b467fcff1f4d3bf36ea75be030aca2' '6bb1a151e6d21e1756baeff5a95eaf85a5b6731aeda6d0bc255651192ba4a32d' '41edc0309b255b0eeb5e8eb1ad79f7c7e9e6c31db1bd79a16d73271c62867003' 'f12236ff3ebce99adb083434756ca17aaf845f11248d2eeb9e68c530304e0299' 'e260456d9c7bdff5f2f8a0db0f772316b44d3e4f7833f72ff8328e95b30eb0ec' '04fdcd690de01fa29221f65431f93dc156db146dbaf9e0c27346f3e0cee1a193')

# _link <submodule path> <extracted dir>
_link() {
  rm -rf "$1"
  ln -s "$srcdir/$2" "$1"
}

prepare() {
  cd "$srcdir/moonlight-common-c-${_common_c}"
  _link enet "enet-${_enet}"
  _link nanors "nanors-${_nanors}"

  cd "$srcdir/moonlight-qt-${_upver}"
  _link moonlight-common-c/moonlight-common-c "moonlight-common-c-${_common_c}"
  _link qmdnsengine/qmdnsengine "qmdnsengine-${_qmdnsengine}"
  _link app/SDL_GameControllerDB "SDL_GameControllerDB-${_gamecontrollerdb}"
  _link h264bitstream/h264bitstream "h264bitstream-${_h264bitstream}"
}

build() {
  cd "moonlight-qt-${_upver}"

  # the version the app shows; app/version.txt only has the base version
  export CI_VERSION="$_upver"
  qmake6 PREFIX=/usr moonlight-qt.pro
  make release
}

package() {
  cd "moonlight-qt-${_upver}"
  make INSTALL_ROOT="$pkgdir" install
}
