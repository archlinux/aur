# Maintainer: William Huang <wp /at/ nerde /period/ pw>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Akaash Suresh <https://github.com/Curry>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

_pkgname=qmk
pkgname=qmk-lite
pkgver=1.1.6
_qmk_udev_pkgver=0.1.1
pkgrel=1
pkgdesc="CLI tool for customizing supported mechanical keyboards - device-specific dependencies set as optional"
arch=('any')
url="https://github.com/qmk/qmk_cli"
license=('MIT')
depends=('python-appdirs' 'python-argcomplete' 'python-colorama'
         'python-milc' 'python-dotty-dict' 'python-jsonschema' 'git' 
         'python-hjson' 'python-pygments'
         'python-hid' 'python-pyusb' 'python-pyserial' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('gcc'
            'libffi'
            'libusb-compat'
            'clang: chibios-upgrader'
            'zip: some distribution script'
            'wget: some update scripts'
            'diffutils: some update scripts'
            'arm-none-eabi-binutils: ARM support'
            'arm-none-eabi-gcc: ARM support'
            'arm-none-eabi-newlib: ARM support'
            'avr-gcc: AVR support'
            'avr-libc: AVR support'
            'avr-binutils: AVR support'
            'avrdude'
            'dfu-programmer'
            'dfu-util'
          )
provides=('qmk')
conflicts=('qmk')
source=("https://files.pythonhosted.org/packages/source/q/qmk/qmk-${pkgver}.tar.gz"
        "qmk-udev-${_qmk_udev_pkgver}.tar.gz::https://github.com/qmk/qmk_udev/archive/refs/tags/v${_qmk_udev_pkgver}.tar.gz")
sha256sums=('dc436cdbabf2f8cec6dbad453de3832be01bac8e7e9c19075c29866ee22a8b50'
            'e6cde001890e1d030d13bbe18799b76754aaea8a6d1309ce8c7956d713714920')

build() {
  make -C qmk_udev-${_qmk_udev_pkgver}
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  make -C qmk_udev-${_qmk_udev_pkgver} DESTDIR="$pkgdir" PREFIX=/usr install
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
