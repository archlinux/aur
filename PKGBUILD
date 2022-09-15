# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Bleuzen <supgesu at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name="Surge XT"
_repo_name=surge
pkgname=surge-xt
pkgver=1.1.1
pkgrel=2
pkgdesc="An Open Source Digital Synthesizer"
arch=(x86_64 aarch64)
url="https://surge-synthesizer.github.io/"
license=(GPL3)
groups=(clap-plugins pro-audio vst3-plugins)
depends=(cairo fontconfig gcc-libs glibc libx11 libxcb
  libxkbcommon-x11 xcb-util xcb-util-cursor xcb-util-image
  xcb-util-keysyms xcb-util-renderutil xdg-utils)
makedepends=(cmake freetype2 libsndfile python libxrandr libxinerama libxcursor alsa-lib jack)
optdepends=(
  'clap-host: for CLAP plugins'
  'jack: backend for standalone'
  'vst3-host: for VST3 plugins'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/surge-synthesizer/releases-xt/releases/download/$pkgver/surge-src-$pkgver.tar.gz"
        "fix-crash.patch::https://patch-diff.githubusercontent.com/raw/surge-synthesizer/surge/pull/6608.patch")
sha256sums=('546181606fbedad2280a5d14d82355312e6bfd3b14285ed099335e5bb2c13485'
            'bdf1dcf70b4360474b65657345ea8f0eee1111e21d7b0aaf467f9bcd56a3588a')

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

  # https://github.com/surge-synthesizer/surge/pull/6608
  patch -p1 -i ../fix-crash.patch
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
