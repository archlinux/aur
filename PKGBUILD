# Maintainer: stuartw-source <stuartpaulwebb@gmail.com>
#
# Release package: builds the tagged GitHub release v$pkgver.
# After tagging a new release: bump pkgver, run `updpkgsums`, then `makepkg --printsrcinfo > .SRCINFO`.

pkgname=micforge
pkgver=0.1.0
pkgrel=1
pkgdesc="Microphone processor for PipeWire: voice-only gate, AI noise removal, effects, voice changer and VST3/LV2 plugin hosting"
arch=('x86_64' 'aarch64')
url="https://github.com/stuartw-source/micforge"
license=('GPL-3.0-or-later' 'MIT') # MIT: bundled parts of Steinberg's VST3 SDK
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'pipewire' 'rnnoise' 'lilv' 'hicolor-icon-theme'
         'gcc-libs' 'glibc')
makedepends=('git' 'lv2')
_vst3tag=v3.8.1_build_84
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "vst3_base::git+https://github.com/steinbergmedia/vst3_base.git#tag=$_vst3tag"
        "vst3_pluginterfaces::git+https://github.com/steinbergmedia/vst3_pluginterfaces.git#tag=$_vst3tag"
        "vst3_public_sdk::git+https://github.com/steinbergmedia/vst3_public_sdk.git#tag=$_vst3tag")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  # GitHub release tarballs don't include submodules: link in the VST3 SDK checkouts.
  mkdir -p third_party/vst3sdk
  rm -rf third_party/vst3sdk/{base,pluginterfaces,public.sdk}
  ln -s "$srcdir/vst3_base" third_party/vst3sdk/base
  ln -s "$srcdir/vst3_pluginterfaces" third_party/vst3sdk/pluginterfaces
  ln -s "$srcdir/vst3_public_sdk" third_party/vst3sdk/public.sdk
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p build
  cd build
  qmake6 PREFIX=/usr ../micforge.pro
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make INSTALL_ROOT="$pkgdir" install
  install -Dm644 ../third_party/vst3sdk/base/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/VST3_SDK_LICENSE.txt"
}
