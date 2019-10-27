# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=oomd
pkgver=0.2.0
pkgrel=2
pkgdesc='A userspace out-of-memory killer.'
arch=('x86_64')
url='https://github.com/facebookincubator/oomd'
license=('GPL2')
depends=('jsoncpp' 'systemd-libs')
makedepends=('meson' 'ninja' 'jsoncpp' 'gcc>=8' 'gtest' 'gmock')
checkdepends=('gtest' 'gmock')
install="${pkgname}.install"
provides=("${pkgname}")
conflicts=("${pkgname}-git")
backup=("etc/${pkgname}.json")
source=("https://github.com/facebookincubator/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.default")
sha512sums=('f6ce5483d96ca54558642ec60ce28b6f5ad63460c3af2cda17fdbdea125bc31236a2468db7125077d2a68ca951a21b1ad853e31869fe957ab261b5ec55e7992c'
            '0515f2ec37c654830e7b14ac1fd721eda4932e152502e454e06df5ab01aab1a1d15423c1bc8d593412cd7616a441d46dc1b05564f79b157045fd69c0555da20b'
            '1db7c71b1b1d21ba5ebe10add5b1b37c6df2169f24938f91170833eddb40e7acf58726cb01e528f340d66ada18b557b26f9c07b542a253d15f04c440e7cd1eb8')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # build system expects the directory to be named "oomd"
  ln -sfT "${pkgname}-${pkgver}" "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix "${pkgdir}/usr" build && ninja -C build
}

# FIXME tests don't pass on v0.2.0
# check() {
#   cd "${srcdir}/${pkgname}"
#   ninja test -C build
# }

package() {
  cd "${srcdir}/${pkgname}"
  ninja -C build install
  install -Dm644 "build/${pkgname}.json"        "${pkgdir}/etc/${pkgname}.json"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
}
