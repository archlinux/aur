# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=tinygo
pkgname=${_pkgname}-git
pkgver=v0.15.0.r0.ge8615d10
pkgrel=1
pkgdesc="Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://tinygo.org/"
license=('custom:Apache 2.0 with LLVM Exception' 'BSD')
depends=(
  'go>=1.11.0'
  'gcc-libs'
)
makedepends=(
  'llvm'
)
optdepends=(
  'avr-gcc: Arduino Uno support'
  'avrdude: Arduino Uno support'
  'openocd: BBC Micro:bit support'
  'arm-none-eabi-gdb: tinygo gdb support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "${_pkgname}::git+https://github.com/tinygo-org/tinygo.git"
  "LICENSE.llvm::https://llvm.org/LICENSE.txt"
  "LICENSE.golang::https://raw.githubusercontent.com/golang/go/master/LICENSE"
)
sha256sums=('SKIP'
            'f72b120d1385408e9e380acc020756eb6ba1b461d66c328ea67327ba08d7dcfd'
            '2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        .
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -m644 "$srcdir/LICENSE.llvm" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.llvm"
    install -m644 "$srcdir/LICENSE.golang" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.golang"
}
