# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=oomd
pkgver=0.1.0
pkgrel=1
pkgdesc='A userspace out-of-memory killer.'
arch=('x86_64')
url='https://github.com/facebookincubator/oomd'
license=('GPL2')
depends=('jsoncpp' 'systemd-libs' 'linux>=4.20')
makedepends=('meson' 'ninja' 'jsoncpp' 'gcc>=8' 'gtest' 'gmock')
checkdepends=('gtest' 'gmock')
install="${pkgname}.install"
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.json")
source=("https://github.com/facebookincubator/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.default"
        "${pkgname}-fix-example-config.patch")
sha512sums=('141acac213ea62c88806ec6c984757f135d178465a9386faa61c7cf000c768ea885b7dc5e41151354e01f240c3c1c543aea3fa25b0240f9d2561fd4e8148780a'
            'b1bba1648c97ed0f681966dd3efd3ac25b018d310a566b937bece055d5d1a91a0739d96ca141914b8db3f9424b02093dd6f5cf501f7f55922e441fb447a4bd2c'
            '1db7c71b1b1d21ba5ebe10add5b1b37c6df2169f24938f91170833eddb40e7acf58726cb01e528f340d66ada18b557b26f9c07b542a253d15f04c440e7cd1eb8'
            '667cb3e45bcf1135706ce9e46c334c0dc6f1d2b251c7bcba39c2f30585ae39f11c663d6f3cfdf633288a2e581e0546cf277c9511986455c93c796623a263097e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # build system expects the directory to be named "oomd"
  ln -s "${pkgname}-${pkgver}" "${srcdir}/${pkgname}"

  # example config is invalid
  patch -p 0 --forward --input="${srcdir}/${pkgname}-fix-example-config.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix "${pkgdir}/usr" build && ninja -C build
}

check() {
  cd "${srcdir}/${pkgname}"
  ninja test -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  ninja -C build install
  install -Dm644 "etc/desktop.json" "${pkgdir}/etc/${pkgname}.json"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
}
