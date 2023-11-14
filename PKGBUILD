# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='3b92a1b641824e649d1847aa650a0808574db0b0'
_kernver="$(</usr/src/linux/version)"
pkgname='lg4l'
pkgver='2017.08.09'
pkgrel='2'
pkgdesc="Logitech for Linux"
arch=('i686' 'x86_64')
url="https://github.com/CMoH/lg4l"
license=('GPL')
makedepends=('linux' 'linux-headers')
source=("https://github.com/CMoH/${pkgname}/archive/${_commit}.tar.gz"
        "90-lg4l.rules" "hid-g19.patch" "hid-gfb.patch" "${pkgname}.install")
b2sums=('f0d4ad22cb7c6d799ca53799fee222e1c275ea3b84b6304ea8e595125e6076c41251cdf5f3c56bfeb155b5373b8cf20a4f31db49595cf1adbdd4175ec9dda224'
        'ea85b5b1d5354fca5616f43e4dd2a8d924b82ce33e7ae33a8a66286baaf86a043194520cc8b350d936916b4294273ce6a53558d3bde2d46838ccd626d9d61ca3'
        'f560b3613e7b13181fa9b058f52951e5d4f26db96d384e2badc5b043c6f79b482a0b911ba4053ee9e51ec48a3dc9d2ea18b7ca305d06f25a2c907446c8605f8d'
        'eaaab91031c4524e8193c76ad4c989596a4ab8d92fe4e60a45be4a9256e5218ab7a33d683e076dc7ded1638909c86f8054dd320e0d5494fe7ce1b4da5eef5647'
        '6c4e36b10a749dfaea6b482a724ae82a64fbda1e233bedc1a8ad03f932d6f6216f9a6df65cb010d51e1eda38d0c228324e38e90e5e8226fd2dab8e9248311b34')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${_commit}"
  patch -Np1 -i ../hid-g19.patch
  patch -Np1 -i ../hid-gfb.patch
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
