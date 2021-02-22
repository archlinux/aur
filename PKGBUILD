# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=python-qiling-git
pkgver=1.2.2.r62.ge4f07cf1
pkgrel=1
pkgdesc="An advanced binary emulation framework"
url='https://qiling.io/'
arch=('x86_64')
license=('GPL2')
depends=('python' 'python-capstone' 'python-unicorn' 'python-pefile'
         'python-registry' 'python-keystone' 'python-pyelftools'
         'python-gevent')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git://github.com/qilingframework/qiling.git#branch=dev)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"
	export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}" -O1 --skip-build
}

check() {
    cd "${srcdir}/${pkgname}/tests"
    python3 ./test_posix.py && 
    python3 test_elf_multithread.py &&
    python3 test_android.py && 
    python3 ./test_debugger.py && 
    python3 ./test_uefi.py && 
    python3 ./test_shellcode.py && 
    python3 ./test_edl.py
}
