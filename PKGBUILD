# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-starter
_pkgname=starter
pkgver=8.3
_pkgver=Starter-${pkgver}
pkgrel=1
groups=(tango-controls)
pkgdesc="This device server is able to control Tango device servers."
arch=(x86_64)
url="https://gitlab.com/tango-controls/${_pkgname}"
license=(GPL3)
depends=(tango-cpp)
makedepends=(cmake)
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${_pkgver}/downloads/${_pkgname}-with-submodules-${_pkgver}.tar.gz"
  "tango-starter.service" "tango-sys.conf"
)
sha256sums=(
  "65546fd92087a0f233635af4b276bdf88e0b545a4ad9ac7728aec8de095c44c4"
  "c00c64ee4c3cda870471cb8bfe0a7e2273bf2b69056bd0687bac9d9be2cb984b"
  "befddd224a022acbded2cc0bd9ff217902cd2f7e092a901ff0c6b4065e550659"
)

build() {
  cmake -B bld -S "${_pkgname}-with-submodules-${_pkgver}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build bld 
}

package() {
  DESTDIR="${pkgdir}" cmake --install bld

  install -Dm 644 "${srcdir}/tango-starter.service" "${pkgdir}/usr/lib/systemd/system/tango-starter.service"

  mkdir -p ${pkgdir}/usr/lib/sysusers.d
  install -Dm 644 tango-sys.conf "${pkgdir}"/usr/lib/sysusers.d/tango-sys.conf
}
