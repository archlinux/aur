# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Dan Johansen <strit83 at gmail dot com>
# Contributor: Oleg Rakhmanov <oleg [at] archlinuxarm [dot] org>

pkgname=opentracker
pkgver=2.0.0
pkgrel=1
epoch=1
pkgdesc='A free and open torrent tracker'
arch=(x86_64 i686 armv7h aarch64)
url='http://erdgeist.org/arts/software/opentracker/'
license=('LicenseRef-Beerware')
depends=(
  glibc
  zlib
)
makedepends=(gcc)
checkdepends=(clang)
backup=('etc/opentracker/opentracker.conf')
source=(
  "https://erdgeist.org/arts/software/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
  'opentracker.service'
  'opentracker.sysusers'
  'opentracker.tmpfiles'
  'LICENSE-opentracker'
)
sha256sums=('fbac9eeaeb6ae81a24f89390cd09839e6e477f13b2bb9ac176e7b786003a750f'
            '6bd91237855a0ed06eeaf4182d565a9125dbf89f2dfb3e83b5607f7c9a89d00d'
            'c0097bc231e0f6f7c8ff17e3cca99f2215218cc227476a4390936b04300c8fc7'
            '0c7f180db96168dd7546b30cb276ab1058201c919059b251d84868fe63990f08'
            '1af823e3e21daa72e354d3f163f3a19276a2738542296930636bc363c522e7fb')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check-all
}

package() {
  cd "${pkgname}-${pkgver}"
  PREFIX=/usr DESTDIR="${pkgdir}" make install
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}.conf.sample" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"

  cd "${srcdir}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "LICENSE-opentracker" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
