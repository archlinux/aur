# Maintainer:
# Contributor: Davide Depau <davide@depau.eu>

_pkgname="tinygo"
pkgname="$_pkgname-git"
pkgver=0.41.1.r6.g1a1506ef
pkgrel=1
pkgdesc="Go compiler for small places. Microcontrollers, WebAssembly, and command-line tools. Based on LLVM."
arch=('x86_64' 'aarch64')
url="https://tinygo.org/"
license=('BSD-3-Clause')

depends=('go>=1.23')
makedepends=(
  'cmake'
  'git'
  'go>=1.23'
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

options=(!lto !debug)

# To check for submodule changes upstream:
#   cd src/tinygo && git config --file .gitmodules --get-regexp 'submodule\..*\.(path|url)'
# Also check sub-submodules: lib/binaryen/.gitmodules, lib/wasi-libc/.gitmodules
_pkgsrc="$_pkgname"
source=(
  "$_pkgname"::"git+https://github.com/tinygo-org/tinygo.git"
  "llvm-project"::"git+https://github.com/tinygo-org/llvm-project#branch=tinygo_20.x"

  # tinygo submodules
  'CMSIS'::'git+https://github.com/ARM-software/CMSIS.git'
  'avr'::'git+https://github.com/avr-rust/avr-mcu.git'
  'bdwgc'::'git+https://github.com/ivmai/bdwgc.git'
  'binaryen'::'git+https://github.com/WebAssembly/binaryen.git'
  'cmsis-svd'::'git+https://github.com/cmsis-svd/cmsis-svd-data.git'
  'macos-minimal-sdk'::'git+https://github.com/aykevl/macos-minimal-sdk.git'
  'mingw-w64'::'git+https://github.com/mingw-w64/mingw-w64.git'
  'musl'::'git+https://github.com/tinygo-org/musl-libc.git'
  'nrfx'::'git+https://github.com/NordicSemiconductor/nrfx.git'
  'picolibc'::'git+https://github.com/picolibc/picolibc.git'
  'stm32-svd'::'git+https://github.com/tinygo-org/stm32-svd'
  'wasi-cli'::'git+https://github.com/WebAssembly/wasi-cli'
  'wasi-libc'::'git+https://github.com/WebAssembly/wasi-libc'
  'net'::'git+https://github.com/tinygo-org/net.git'

  # binaryen submodules
  'googletest'::'git+https://github.com/google/googletest.git'

  # wasi-libc submodules
  'WASI'::'git+https://github.com/WebAssembly/WASI'
)
sha256sums=('SKIP'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgsrc"

  # Wire up submodules from .gitmodules, verifying each has a matching source
  local _path _name
  while IFS= read -r _path; do
    _name="${_path##*/}"
    if [ ! -d "${srcdir}/${_name}" ]; then
      echo "ERROR: source '${_name}' not found in srcdir for submodule '${_path}'"
      echo "Add '${_name}'::'git+<url>' to the PKGBUILD source array."
      return 1
    fi
    git submodule init "$_path"
    git submodule set-url "$_path" "${srcdir}/${_name}"
    git -c protocol.file.allow=always submodule update "$_path"
  done < <(git config --file .gitmodules --get-regexp 'submodule\..*\.path' | awk '{print $2}')

  # binaryen submodules
  (
    cd lib/binaryen
    git submodule init third_party/googletest
    git submodule set-url third_party/googletest "${srcdir}/googletest"
    git -c protocol.file.allow=always submodule update third_party/googletest
  )

  # wasi-libc submodules
  (
    cd lib/wasi-libc
    git submodule init tools/wasi-headers/WASI
    git submodule set-url tools/wasi-headers/WASI "${srcdir}/WASI"
    git -c protocol.file.allow=always submodule update tools/wasi-headers/WASI
  )

  # link llvm-project source
  ln -sf "${srcdir}/llvm-project" llvm-project
}

build() {
  cd "$srcdir/$_pkgsrc"
  make llvm-build
  make build/release
}

package() {
  cd "$srcdir/$_pkgsrc"

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/lib/tinygo
  cp -a build/release/tinygo/* "$pkgdir"/usr/lib/tinygo
  ln -s /usr/lib/tinygo/bin/tinygo "$pkgdir"/usr/bin/tinygo

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
