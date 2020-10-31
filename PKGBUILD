# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=tinygo
pkgname=${_pkgname}-git
pkgver=v0.15.0.r0.ge8615d10
pkgrel=6
pkgdesc="Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://tinygo.org/"
license=('custom:Apache 2.0 with LLVM Exception' 'BSD')
depends=(
  'llvm-libs'
  'clang'
  'lld'
)
makedepends=(
  'go>=1.11.0'
  'llvm<11.0.0'
  'git'
)
optdepends=(
  'avr-gcc: Arduino Uno support'
  'avrdude: Arduino Uno support'
  'openocd: BBC Micro:bit support'
  'arm-none-eabi-gdb: tinygo gdb support'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source=(
  "git+https://github.com/tinygo-org/tinygo.git"
  "git+https://github.com/NordicSemiconductor/nrfx"
  "git+https://github.com/ARM-software/CMSIS"
  "git+https://github.com/avr-rust/avr-mcu"
  "git+https://github.com/tinygo-org/cmsis-svd"
  "git+https://github.com/llvm-mirror/compiler-rt#branch=release_80"
  "git+https://github.com/CraneStation/wasi-libc"
  "git+https://github.com/keith-packard/picolibc"
  "disable_static_llvm.patch"
  "0001-AUR-Use-package-TINYGOROOT-by-default-if-not-specifi.patch"
  "LICENSE.llvm::https://llvm.org/LICENSE.txt"
  "LICENSE.golang::https://raw.githubusercontent.com/golang/go/master/LICENSE"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '7648bd3b4b78174d912908d35bff6f2b0fe5dfdf78e4aa2d3824b929fb244335'
            '27574eabf8278634274cccc9ca106e5bc400c836c4c04a79079f1bd49e67fbe6'
            'f72b120d1385408e9e380acc020756eb6ba1b461d66c328ea67327ba08d7dcfd'
            '2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    git submodule init
    git config -f .gitmodules 'submodule.lib/nrfx.url' "$srcdir/nrfx"
    git config -f .gitmodules 'submodule.lib/CMSIS.url' "$srcdir/CMSIS"
    git config -f .gitmodules 'submodule.lib/avr.url' "$srcdir/avr-mcu"
    git config -f .gitmodules 'submodule.lib/cmsis-svd.url' "$srcdir/cmsis-svd"
    git config -f .gitmodules 'submodule.lib/compiler-rt.url' "$srcdir/compiler-rt"
    git config -f .gitmodules 'submodule.lib/wasi-libc.url' "$srcdir/wasi-libc"
    git config -f .gitmodules 'submodule.lib/picolibc.url' "$srcdir/picolibc"
    git submodule sync
    git submodule update

    patch -Np1 < "$srcdir"/disable_static_llvm.patch
    patch -Np1 < "$srcdir"/0001-AUR-Use-package-TINYGOROOT-by-default-if-not-specifi.patch
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"  
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    export TINYGOROOT="$srcdir/tinygo/build/release/tinygo"
    make build/release
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -dm755 "$pkgdir"/usr/bin "$pkgdir"/usr/lib/tinygo
    cp -a build/release/tinygo/* "$pkgdir"/usr/lib/tinygo
    ln -s ../lib/tinygo/bin/tinygo "$pkgdir"/usr/bin/tinygo

    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m644 "$srcdir/LICENSE.llvm" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.llvm"
    install -m644 "$srcdir/LICENSE.golang" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.golang"
}
