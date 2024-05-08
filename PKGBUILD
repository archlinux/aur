pkgname=wasip2-libc
pkgver=0+374+9e8c5423
_commit=9e8c542319242a5e536e14e6046de5968d298038 # main
pkgrel=1
epoch=1
pkgdesc='WASI preview 2 libc implementation for WebAssembly'
arch=('any')
url='https://github.com/WebAssembly/wasi-libc'
license=('Apache' 'MIT')
makedepends=('git' 'llvm' 'clang')
source=("git+https://github.com/WebAssembly/wasi-libc.git#commit=${_commit}")
b2sums=('b38704e419dba9be28004d2615800082832769874573d8d9534e4c0386cf9a93214872bda7ce2d3793ec7a5a16bd444adef0b221cfbe60e38216b53b1cf02346')
options=('staticlibs')

pkgver() {
  cd wasi-libc
  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local make_options=(
    WASM_CC=/usr/bin/clang
    WASM_AR=/usr/bin/llvm-ar
    WASM_NM=/usr/bin/llvm-nm

    # Remove bulk memory support
    # https://bugzilla.mozilla.org/show_bug.cgi?id=1773200#c4
    BULK_MEMORY_SOURCES=
    WASI_SNAPSHOT=p2
  )

  cd wasi-libc
  make "${make_options[@]}"
}

package() {
  cd wasi-libc
  install -dm755 "${pkgdir}"/usr/share
  cp -dr --preserve=mode,timestamp sysroot "${pkgdir}"/usr/share/wasi-sysroot
}
