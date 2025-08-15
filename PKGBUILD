# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-starter
_pkgname=starter
pkgver=8.4
_pkgver=Starter-${pkgver}
pkgrel=2
groups=("tango-controls")
pkgdesc="This device server is able to control Tango device servers."
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("glibc" "gcc-libs" "omniorb" "tango-cpp")
makedepends=("cmake")
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${_pkgver}/downloads/${_pkgname}-with-submodules-${_pkgver}.tar.gz"
  "tango-starter.service" "tango-sys.conf" "fortify.patch"
)
sha256sums=(
  "4ff742da1ad8535cd14f013b58201e9753293e50a3f78f6649edd2606be0e6e5"
  "c00c64ee4c3cda870471cb8bfe0a7e2273bf2b69056bd0687bac9d9be2cb984b"
  "befddd224a022acbded2cc0bd9ff217902cd2f7e092a901ff0c6b4065e550659"
  "65cafb5ad5068582e5fa8e89dfc3cd2081dd037ae77e1b5b7b2591982d34bfd5"
)

prepare() {
  cd "${_pkgname}-with-submodules-${_pkgver}"
  patch -N -p1 --input="${srcdir}/fortify.patch"
}

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
