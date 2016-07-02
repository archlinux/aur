# Maintainer: Manuel Coenen <manuel dot coenen at gmail dot com>
pkgname=ser4010-tools-git
pkgver=r26.21fdaf0
pkgrel=1
pkgdesc="Tools for UART controllable SI4010 based tunable OOK/FSK RF transmitter"
arch=('any')
url="https://github.com/dimhoff/ser4010"
license=('custom')
makedepends=('git'
'cmake'
'make'
'gcc')
optdepends=('si4010prog: si4010 chip programming',
'ser4010_firmware: firmware to be flashed to si4010 chip')
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/dimhoff/ser4010.git"
'cmake_c_flags_fix.patch')
md5sums=('SKIP'
         '896dc38975f112e0885d6bb37d40c28d')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}/build"
  rm -rf *
  patch "$srcdir/${pkgname%-git}"/CMakeLists.txt "$srcdir"/cmake_c_flags_fix.patch
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDEFAULT_SERIAL_DEV=/dev/ttyAMA0 \
    ../
  make
}

package() {
  cd "$srcdir/${pkgname%-git}/build/tools"
  install -Dm755 ser4010_dump "${pkgdir}"/usr/bin/ser4010_dump
  install -Dm755 ser4010_test_comm "${pkgdir}"/usr/bin/ser4010_test_comm
  install -Dm755 ser4010_somfy "${pkgdir}"/usr/bin/ser4010_somfy
  install -Dm755 ser4010_kaku "${pkgdir}"/usr/bin/ser4010_kaku
  install -Dm755 ser4010_si443x "${pkgdir}"/usr/bin/ser4010_si443x

  cd "$srcdir/${pkgname%-git}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
