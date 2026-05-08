# Maintainer: Davi <davidev@snask.lang>
pkgname=snask
pkgver=0.4.1
pkgrel=1
pkgdesc="Snask Programming Language with Orchestrated Memory (OM)"
arch=('x86_64')
url="https://github.com/rancidavi-dotcom/TheSnask"
license=('MIT')
depends=('llvm18-libs' 'gtk3' 'zlib' 'sqlite')
makedepends=('rust' 'cargo' 'llvm18' 'clang18' 'lld18' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rancidavi-dotcom/TheSnask/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6297af794c633629cc1cbc46ada8c82a09e233cd0bdc79bb347b4dd5e3bd0f72')

build() {
  cd "${srcdir}/TheSnask-${pkgver}"
  
  # Variáveis para forçar o build do Rust a usar o LLVM dinâmico do Arch
  export LLVM_CONFIG_PATH=/usr/bin/llvm-config-18
  export LLVM_LINK_STATIC=0
  export LLVM_SYS_180_PREFIX=/usr/lib/llvm18
  
  cargo build --release --locked
  
  # Use a temporary home for snask setup
  mkdir -p "${srcdir}/temp_home"
  export HOME="${srcdir}/temp_home"
  
  # Garante que o binário recém-compilado encontre o LLVM dinâmico durante o setup
  export LD_LIBRARY_PATH="/usr/lib/llvm18/lib:${LD_LIBRARY_PATH:-}"
  ./target/release/snask setup
}

package() {
  cd "${srcdir}/TheSnask-${pkgver}"
  install -Dm755 target/release/snask "${pkgdir}/usr/bin/snask"
  
  install -dm755 "${pkgdir}/usr/lib/snask/runtime"
  install -dm755 "${pkgdir}/usr/lib/snask/stdlib"
  
  cp -r src/runtime/* "${pkgdir}/usr/lib/snask/runtime/"
  cp -r src/stdlib/* "${pkgdir}/usr/lib/snask/stdlib/"
  cp src/runtime.c "${pkgdir}/usr/lib/snask/runtime/"

  # Install generated runtimes from the temporary home
  install -m644 "${srcdir}/temp_home/.snask/lib"/runtime.* "${pkgdir}/usr/lib/snask/runtime/"
  install -m644 "${srcdir}/temp_home/.snask/lib"/runtime_tiny.* "${pkgdir}/usr/lib/snask/runtime/"
  install -m644 "${srcdir}/temp_home/.snask/lib"/runtime_nano.* "${pkgdir}/usr/lib/snask/runtime/"
  [ -f "${srcdir}/temp_home/.snask/lib/rt_extreme.o" ] && install -m644 "${srcdir}/temp_home/.snask/lib/rt_extreme.o" "${pkgdir}/usr/lib/snask/runtime/"
}
