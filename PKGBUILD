# Maintainer: Bleuzen <supgesu at gmail dot com>
# Original author of surge package: David Runge <dvzrv@archlinux.org>

# This currently only builds VST3 plugins
# lv2 would need custom JUCE:
# https://github.com/lv2-porting-project/JUCE
# or simply wait for JUCE 7 release which will officially support lv2

_name="Surge XT"
_repo_name="surge"
pkgname=surge-xt
pkgver=1.0.1
pkgrel=2
pkgdesc="An Open Source Digital Synthesizer"
arch=('x86_64')
url="https://surge-synthesizer.github.io/"
license=('GPL3')
groups=('pro-audio' 'vst3-plugins')
# groups=('lv2-plugins' 'pro-audio' 'vst3-plugins')
depends=('cairo' 'fontconfig' 'gcc-libs' 'glibc' 'libx11' 'libxcb'
'libxkbcommon-x11' 'xcb-util' 'xcb-util-cursor' 'xcb-util-image'
'xcb-util-keysyms' 'xcb-util-renderutil' 'xdg-utils')
makedepends=('cmake' 'freetype2' 'libsndfile' 'python' 'libxrandr' 'libxinerama' 'libxcursor' 'alsa-lib' 'jack')
# makedepends=('cmake' 'freetype2' 'libsndfile' 'lv2' 'python')
optdepends=(
  # 'lv2-host: for the LV2 plugin'
  'vst3-host: for the VST3 plugin'
  'jack: backend for standalone'
)
# checkdepends=('lv2lint')
source=("${pkgname}-${pkgver}.tgz::https://github.com/surge-synthesizer/releases-xt/releases/download/${pkgver}/surge-src-${pkgver}.tar.gz")
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
  cd "$pkgname-$pkgver"
  # binaries and shared libs have executable stack:
  # https://github.com/surge-synthesizer/surge/issues/1701
  export LDFLAGS="${LDFLAGS},-z,noexecstack"
  # build surge-headless
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -W no-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

# check() {
#   cd "$pkgname-$pkgver"
#   lv2lint -Mpack -I "build-test/surge_xt_products/${_name}.lv2" \
#     "https://surge-synthesizer.github.io/lv2/surge" \
#     || echo "Known to fail: https://github.com/surge-synthesizer/surge/issues/2392"
# 
#   mkdir -vp test_data/${pkgname}
#   cp -av resources/data/* test_data/${pkgname}
#   XDG_DATA_HOME=test_data build/surge-headless
# }

package() {
  depends+=('libfreetype.so')
  cd "$pkgname-$pkgver"

  # install lv2
#   install -vDm 755 "build/surge_xt_products/${_name}.lv2/${_name}.so" \
#     -t "${pkgdir}/usr/lib/lv2/${_name}.lv2/"
#   install -vDm 644 "build/surge_xt_products/${_name}.lv2/"*.ttl \
#     -t "${pkgdir}/usr/lib/lv2/${_name}.lv2/"
#   install -vDm 755 "build/surge_xt_products/${_name} Effects.lv2/${_name} Effects.so" \
#     -t "${pkgdir}/usr/lib/lv2/${_name} Effects.lv2/"
#   install -vDm 644 "build/surge_xt_products/${_name} Effects.lv2/"*.ttl \
#     -t "${pkgdir}/usr/lib/lv2/${_name} Effects.lv2/"

  # install vst3
  install -vDm 755 "build/surge_xt_products/${_name}.vst3/Contents/${CARCH}-linux/${_name}.so" \
    -t "${pkgdir}/usr/lib/vst3/${_name}.vst3/Contents/${CARCH}-linux/"
  install -vDm 755 "build/surge_xt_products/${_name} Effects.vst3/Contents/${CARCH}-linux/${_name} Effects.so" \
    -t "${pkgdir}/usr/lib/vst3/${_name} Effects.vst3/Contents/${CARCH}-linux/"

  # install standalone
  install -vDm 755 "build/surge_xt_products/${_name}" \
    -t "${pkgdir}/usr/bin/"
  install -vDm 755 "build/surge_xt_products/${_name} Effects" \
    -t "${pkgdir}/usr/bin/"

  # install resources
  install -vdm 755 "${pkgdir}/usr/share/${pkgname}"
  cp -av resources/data/* "${pkgdir}/usr/share/${pkgname}"
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
