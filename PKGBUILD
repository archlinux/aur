# Maintainer:
# Contributor: Davide Depau <davide@depau.eu>

_pkgname="tinygo"
pkgname="$_pkgname-git"
pkgver=0.29.0.r0.gdc449882
pkgrel=1
pkgdesc="Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://tinygo.org/"
license=('BSD')

depends=(
  #'clang'
  #'lld'
  #'llvm-libs'
)
makedepends=(
  'cmake'
  'git'
  'go'
  'llvm'
  'ninja'
  'python'
)
optdepends=(
  'avr-gcc: Arduino Uno support'
  'avrdude: Arduino Uno support'
  'openocd: BBC Micro:bit support'
  'arm-none-eabi-gdb: tinygo gdb support'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  url="https://github.com/tinygo-org/tinygo"
fi

options=(!strip !lto)

_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+https://github.com/tinygo-org/tinygo.git"
  "git+https://github.com/espressif/llvm-project#branch=xtensa_release_15.x"
  "llvm_build_j1.patch"

  # tinygo submodules
  'CMSIS'::'git+https://github.com/ARM-software/CMSIS.git'
  'avr'::'git+https://github.com/avr-rust/avr-mcu.git'
  'binaryen'::'git+https://github.com/WebAssembly/binaryen.git'
  'cmsis-svd'::'git+https://github.com/tinygo-org/cmsis-svd'
  'macos-minimal-sdk'::'git+https://github.com/aykevl/macos-minimal-sdk.git'
  'mingw-w64'::'git+https://github.com/mingw-w64/mingw-w64.git'
  'musl'::'git+git://git.musl-libc.org/musl'
  'nrfx'::'git+https://github.com/NordicSemiconductor/nrfx.git'
  'picolibc'::'git+https://github.com/keith-packard/picolibc.git'
  'renesas-svd'::'git+https://github.com/tinygo-org/renesas-svd.git'
  'stm32-svd'::'git+https://github.com/tinygo-org/stm32-svd'
  'wasi-libc'::'git+https://github.com/CraneStation/wasi-libc'

  # wasi-libc submodules
  'WASI'::'git+https://github.com/WebAssembly/WASI'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'a5352a32ed89120af415825fa5b73a0e7bb907fa6efaa63529ad721a53cf4844'

  # tinygo submodules
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'

  # wasi-libc submodules
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  ( # tinygo submodules
    cd "$srcdir/$_pkgsrc"
    _submodules=(
      'lib/CMSIS'
      'lib/avr'
      'lib/binaryen'
      'lib/cmsis-svd'
      'lib/macos-minimal-sdk'
      'lib/mingw-w64'
      'lib/musl'
      'lib/nrfx'
      'lib/picolibc'
      'lib/renesas-svd'
      'lib/stm32-svd'
      'lib/wasi-libc'
    )
    for submodule in ${_submodules[@]} ; do
      git submodule init ${submodule}
      git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
      git -c protocol.file.allow=always submodule update ${submodule}
    done
  )

  ( # wasi-libc submodules
    cd "$srcdir/$_pkgsrc"
    cd 'lib/wasi-libc'
    _submodules=(
      'tools/wasi-headers/WASI'
    )
    for submodule in ${_submodules[@]} ; do
      git submodule init ${submodule}
      git submodule set-url ${submodule} "${srcdir}/${submodule##*/}"
      git -c protocol.file.allow=always submodule update ${submodule}
    done
  )

  cd "$srcdir/$_pkgsrc"
  ln -sf ../llvm-project
  patch -p1 -i ../llvm_build_j1.patch
}

build() {
  cd "$srcdir/$_pkgsrc"
  make llvm-build
  make build/release
}

package() {
  cd "$srcdir/$_pkgsrc"

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/lib/tinygo
  mv build/release/tinygo/* "$pkgdir"/usr/lib/tinygo
  ln -s /usr/lib/tinygo/bin/tinygo "$pkgdir"/usr/bin/tinygo

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
