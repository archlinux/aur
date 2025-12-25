# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_pkgname=airrohr-firmware-flasher
pkgname=$_pkgname-git
pkgver=0.3.3.r77.g654bf12
pkgrel=1
pkgdesc="Airrohr firmware flasher tool for Sensor.Community"
arch=('x86_64')
url="https://github.com/opendata-stuttgart/airrohr-firmware-flasher"
license=('MIT')
depends=(
    'glibc'
    'zlib'
)
makedepends=( # Creates one big BLOB using PyInstaller
    'esptool'
    'git'
    'pyinstaller'
    'python'
    'python-altgraph'
    'python-chardet'
    'python-idna'
    'python-macholib'
    'python-netifaces'
    'python-pefile'
    'python-pyaes'
    'python-pyqt5'
    'python-pyqt5-sip'
    'python-pyserial'
    'python-requests'
    'python-urllib3'
    'python-zeroconf'
    'qt5-tools'
)
source=(
    "git+https://github.com/opendata-stuttgart/airrohr-firmware-flasher.git"
    "0000-remove-python-NotSupportedError-import.patch"
)
b2sums=('SKIP'
        '868b62f78c5ef68c4099d08975b6dd909f8e44758d6df0e54d01255a7c59f5ca0156a9fb750ea3467c303e1ca5704236ec1ef69011eb2454b48b5746e0a7df42')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch --forward --strip=1 --input=../0000-remove-python-NotSupportedError-import.patch
}


build() {
    cd "${srcdir}/${_pkgname}"
    make dist
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D -m755 ./dist/airrohr-flasher -t $pkgdir/usr/bin
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
