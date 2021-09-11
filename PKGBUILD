# Maintainer: Serene-Arc
pkgname=qmk-git
pkgver=1.0.0.r0.g710dc3e
_qmk_pkgver=master
pkgrel=5
pkgdesc="CLI tool for customizing supported mechanical keyboards."
arch=('any')
url="https://github.com/qmk/qmk_cli"
license=('MIT')
_branch=qmk_cli
depends=(
    'arm-none-eabi-binutils'
    'arm-none-eabi-gcc'
    'arm-none-eabi-newlib'
    'avr-binutils'
    'avr-gcc'
    'avr-libc'
    'avrdude'
    'clang'
    'dfu-programmer'
    'dfu-util'
    'diffutils'
    'flake8'
    'gcc'
    'git'
    'libusb-compat'
    'python-dotty-dict'
    'python-hidapi'
    'python-hjson'
    'python-jsonschema'
    'python-milc'
    'python-pyusb'
    'unzip'
    'wget'
    'zip'
)
makedepends=(
    'python'
    'python-build'
    'python-pip'
)
conflicts=('qmk')
provides=('qmk')
source=(
    'git+https://github.com/qmk/qmk_cli.git'
    "50-qmk.rules_${_qmk_pkgver}::https://raw.githubusercontent.com/qmk/qmk_firmware/${_qmk_pkgver}/util/udev/50-qmk.rules"
)
sha256sums=(
    'SKIP'
    '8fede515a21d808ac25844db77e13f517e035121471001fc7b7f84273d48c4b1'
)

pkgver() {
  cd "$_branch"
  echo $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
    cd "$_branch"
    python -m build --skip-dependency-check --wheel
}

package() {
    cd "$_branch"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
    python -O -m compileall "${pkgdir}"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -d "${pkgdir}/usr/lib/udev/rules.d"
    install -Dm644 "${srcdir}/50-qmk.rules_${_qmk_pkgver}" "${pkgdir}/usr/lib/udev/rules.d/50-qmk.rules"
}
