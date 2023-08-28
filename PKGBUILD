# Maintainer: Popolon <popolon@popolon.org>

pkgname=silice-git
_pkgname=Silice
pkgver=3d12246b
pkgrel=2
pkgdesc="An open source language that simplifies prototyping and writing algorithms on FPGA architectures."
arch=('i686' 'x86_64' 'armv7h' 'armv8' 'riscv64')
url="https://github.com/sylefeb/Silice"
license=('GPLv3')
depends=('yosys' 'icestorm-git' 'prjoxide-git' 'prjapicula' 'nextpnr-git' 'vtr' 'verilator' 'iverilog' 'freeglut' 'jdk11-openjdk')
optdepends=('openfpgaloader' 'tinyprog')
provides=("silice")
source=("${_pkgname}::git+https://github.com/sylefeb/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-parse --short HEAD
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${_pkgname}"
  if [ ! -e BUILD ]; then mkdir BUILD; fi
  cd BUILD
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
  export PATH=$PATH:$DIR/jdk-14.0.1/bin/
  if [ ! -e build-silice ]; then mkdir build-silice; fi
  cd build-silice
  cmake -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../..
  make 
}

package() {
  cd "${srcdir}/${_pkgname}/"
  install -Dm755 BUILD/build-silice/silice ${pkgdir}/usr/bin/silice
  # Licenses
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a LICENSE.md LICENSE_GPLv3 LICENSE_MIT  "${pkgdir}/usr/share/licenses/${pkgname}"
}
