# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='3b92a1b641824e649d1847aa650a0808574db0b0'
_kernver="$(</usr/src/linux/version)"
pkgname='lg4l'
pkgver='2017.08.09'
pkgrel='1'
pkgdesc="Logitech for Linux"
arch=('i686' 'x86_64')
url="https://github.com/CMoH/lg4l"
license=('GPL')
makedepends=('linux' 'linux-headers')
source=("https://github.com/CMoH/${pkgname}/archive/${_commit}.tar.gz"
        "90-lg4l.rules" "hid-g19.patch" "${pkgname}.install")
sha256sums=('020013b2ea8cb09f0e8ec40f2f6cfdb37e12cc56c018f2a4c5a8a0bef083232f'
            '3271223ac9c5732c01688d02d8fb23430028a53093eecbf3662f99b9fec146eb'
            'b69d2b2a6af51557df15cffcac01d39ddf287a79c945dc7182a8cc41f8059e21'
            '7594f658e584f4f2069277b27ea22fad2d4fba032917b8b46de1b5738b5d2f63')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${_commit}"
  patch -Np1 -i ../hid-g19.patch
}

build() {
  cd "${pkgname}-${_commit}"
  make
}

package() {
  cd "${pkgname}-${_commit}"

  # install modules
  install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/extramodules" \
    -m0644 *.ko

  # compress each module individually
  find "${pkgdir}" -name '*.ko' -exec xz -T1 {} +

  # install rebind
  install -dm755 "${pkgdir}/usr/bin/"
  install -m0755 rebind "${pkgdir}/usr/bin/lg4l-rebind"

  # install rules
  install -dm755 "${pkgdir}/usr/lib/udev/rules.d/"
  install -m0644 ../90-lg4l.rules "${pkgdir}/usr/lib/udev/rules.d/"
}
