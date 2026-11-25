# Maintainer: stuartw-source <stuartpaulwebb@gmail.com>
#
# Development package: builds the latest commit on the main branch.

pkgname=micforge-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Microphone processor for PipeWire: voice-only gate, AI noise removal, effects, voice changer and VST3/LV2 plugin hosting (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/stuartw-source/micforge"
license=('GPL-3.0-or-later' 'MIT') # MIT: bundled parts of Steinberg's VST3 SDK
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'pipewire' 'rnnoise' 'lilv' 'hicolor-icon-theme'
         'gcc-libs' 'glibc')
makedepends=('git' 'lv2')
provides=('micforge')
conflicts=('micforge')
source=("micforge::git+$url.git"
        "vst3_base::git+https://github.com/steinbergmedia/vst3_base.git"
        "vst3_pluginterfaces::git+https://github.com/steinbergmedia/vst3_pluginterfaces.git"
        "vst3_public_sdk::git+https://github.com/steinbergmedia/vst3_public_sdk.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd micforge
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd micforge
  # Point the VST3 SDK submodules at makepkg's checkouts (pinned by the submodule commits).
  git submodule init
  git config submodule.third_party/vst3sdk/base.url "$srcdir/vst3_base"
  git config submodule.third_party/vst3sdk/pluginterfaces.url "$srcdir/vst3_pluginterfaces"
  git config submodule.third_party/vst3sdk/public.sdk.url "$srcdir/vst3_public_sdk"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd micforge
  mkdir -p build
  cd build
  qmake6 PREFIX=/usr ../micforge.pro
  make
}

package() {
  cd micforge/build
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../third_party/vst3sdk/base/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname%-git}/VST3_SDK_LICENSE.txt"
}
