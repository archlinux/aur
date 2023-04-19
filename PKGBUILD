# Maintainer: David Runge <dvzrv@archlinux.org>

_name=Surge
pkgname=surge
pkgver=1.9.0
pkgrel=3
pkgdesc="An Open Source Digital Synthesizer"
arch=('x86_64')
url="https://surge-synthesizer.github.io/"
license=('GPL3')
groups=('lv2-plugins' 'pro-audio' 'vst3-plugins')
depends=('cairo' 'fontconfig' 'gcc-libs' 'glibc' 'libx11' 'libxcb'
'libxkbcommon-x11' 'xcb-util' 'xcb-util-cursor' 'xcb-util-image'
'xcb-util-keysyms' 'xcb-util-renderutil' 'xdg-utils')
makedepends=('cmake' 'freetype2' 'libsndfile' 'lv2' 'python')
optdepends=(
  'lv2-host: for the LV2 plugin'
  'vst3-host: for the VST3 plugin'
)
checkdepends=('lv2lint')
replaces=('surge-synthesizer')
source=("${pkgname}-${pkgver}.tgz::https://github.com/surge-synthesizer/releases/releases/download/${pkgver}/SurgeSrc_${pkgver}.tgz"
        "${pkgname}-1.9.0-test.patch::https://github.com/surge-synthesizer/surge/pull/4397/commits/077fbdda1c70413b6ff1af26f5ee0a7b814aa934.patch")
sha512sums=('f06caae297026e9bbccdb097a47341dc1abd17dc7988d8d46368bec202fe701b1b7c9614b441f8d00a5a3a4f386d870a2da86c422ddd7324db216de7baa00836'
            '90d5760b64bcbd782c6318d92ac19a89f84eb63bfe96c5122830cbdd1a78806e8422d1969bc1a8888e20fa2fd0872c69c0d298b909b3006067993fb2177ab2d5')
b2sums=('b6574a48feefe6173afb2185be64423bb70d51d7376e9b5c44c4882d8e3e078c6b0430cb33aa23f9858a21db0be7b0dddfeebb57625149d79f066bb23639882e'
        '7ca2599f7340e63f0f5f5e4d097c28fbc4d68d06c4de33da63b55b50404ebf14007717aa803dea28c0d124b70887848d4479ff19a640f752e13839fbf6f0a7f3')

prepare() {
  mv -v "$pkgname" "$pkgname-$pkgver"
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
  # fix issue with a unit test:
  # https://github.com/surge-synthesizer/surge/issues/4387
  patch -Np1 -i ../"${pkgname}-1.9.0-test.patch"
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

check() {
  cd "$pkgname-$pkgver"
  lv2lint -Mpack -I "build-test/surge_products/${_name}.lv2" \
    "https://surge-synthesizer.github.io/lv2/surge" \
    || echo "Known to fail: https://github.com/surge-synthesizer/surge/issues/2392"

  mkdir -vp test_data/${pkgname}
  cp -av resources/data/* test_data/${pkgname}
  XDG_DATA_HOME=test_data build/surge-headless
}

package() {
  depends+=('libfreetype.so')
  cd "$pkgname-$pkgver"
  # install lv2 and vst3 plugins
  install -vDm 755 "build/surge_products/${_name}.lv2/${_name}.so" \
    -t "${pkgdir}/usr/lib/lv2/${_name}.lv2/"
  install -vDm 644 "build/surge_products/${_name}.lv2/"*.ttl \
    -t "${pkgdir}/usr/lib/lv2/${_name}.lv2/"
  install -vDm 755 "build/surge_products/${_name}.vst3/Contents/${CARCH}-linux/${_name}.so" \
    -t "${pkgdir}/usr/lib/vst3/${_name}.vst3/Contents/${CARCH}-linux/"
  install -vdm 755 "${pkgdir}/usr/share/${pkgname}"
  # install resources
  cp -av resources/data/* "${pkgdir}/usr/share/${pkgname}"
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
