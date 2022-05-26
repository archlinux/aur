# Maintainer: Bleuzen <supgesu at gmail dot com>
# Original author of surge package: David Runge <dvzrv@archlinux.org>

# This currently only builds VST3 plugins
# lv2 would need custom JUCE:
# https://github.com/lv2-porting-project/JUCE
# or simply wait for JUCE 7 release which will officially support lv2

_name="Surge XT"
_repo_name=surge
pkgname=surge-xt
pkgver=1.0.1
pkgrel=3
pkgdesc="An Open Source Digital Synthesizer"
arch=(x86_64 aarch64)
url="https://surge-synthesizer.github.io/"
license=(GPL3)
groups=(pro-audio vst3-plugins)
depends=(cairo fontconfig gcc-libs glibc libx11 libxcb
  libxkbcommon-x11 xcb-util xcb-util-cursor xcb-util-image
  xcb-util-keysyms xcb-util-renderutil xdg-utils)
makedepends=(cmake freetype2 libsndfile python libxrandr libxinerama libxcursor alsa-lib jack)
optdepends=(
  'vst3-host: for the VST3 plugin'
  'jack: backend for standalone'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/surge-synthesizer/releases-xt/releases/download/$pkgver/surge-src-$pkgver.tar.gz")
sha256sums=('100b536f741c62529800fc26e3773567591385d4152db305382b4315f6e39c55')

prepare() {
  mv -v "$_repo_name" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # first shot at improving reproducibility:
  # https://github.com/surge-synthesizer/surge/issues/2389
  sed -e 's/@SURGE_BUILD_DATE@/0/g' \
      -e 's/@SURGE_BUILD_TIME@/0/g' \
      -e 's/@SURGE_BUILD_HASH@/0/g' \
      -e 's/@SURGE_BUILD_FQDN@/None/g' \
      -e "s/@SURGE_BUILD_ARCH@/${CARCH}/g" \
      -e "s/@SURGE_FULL_VERSION@/${pkgver}/g" \
      -i src/common/version.cpp.in
}

build() {
  cd $pkgname-$pkgver
  # binaries and shared libs have executable stack:
  # https://github.com/surge-synthesizer/surge/issues/1701
  export LDFLAGS="$LDFLAGS,-z,noexecstack"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -W no-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  depends+=('libfreetype.so')
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 AUTHORS -t "${pkgdir}/usr/share/doc/${pkgname}"
}
