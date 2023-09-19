# Maintainer: Popolon <popolon@popolon.org>

pkgname=silice-git
_pkgname=Silice
pkgver=3d12246b
pkgrel=8
pkgdesc="An open source language that simplifies prototyping and writing algorithms on FPGA architectures."
arch=('i686' 'x86_64' 'armv7h' 'armv8' 'riscv64')
url="https://github.com/sylefeb/Silice"
license=('GPLv3')
depends=('yosys' 'icestorm-git' 'prjoxide-git' 'prjapicula' 'nextpnr-git' 'vtr' 'verilator' 'iverilog' 'freeglut' 'java-runtime>=11')
optdepends=('openfpgaloader' 'tinyprog' 'java-environment>=11')
provides=("silice")
source=("${_pkgname}::git+https://github.com/sylefeb/${_pkgname}.git"
        frameworks_path.patch)
sha512sums=('SKIP'
            'faea4abdb6df04b7e4b0ac8a80a71f301e20085e3e9e1823b6b6d3f4ffc8a4d2d84ea077666799ce087ea2c341459a358d90c5e01c7bc6848ee5f042d66274a7')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-parse --short HEAD
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  #patch -Np1 -i ${srcdir}/frameworks_path.patch
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
  install -Dm755 bin/report-cycles.py ${pkgdir}/usr/bin/report-cycles.py
  install -Dm755 bin/silice-make.py ${pkgdir}/usr/bin/silice-make.py
  mkdir -p ${pkgdir}/usr/share/doc/silice/
  cp -a learn-silice ${pkgdir}/usr/share/doc/silice/
  cp -a projects ${pkgdir}/usr/share/doc/silice/
  # Licenses
  mkdir -p ${pkgdir}/usr/src/libs
  cp -a src/libs/LibSL-small ${pkgdir}/usr/src/libs/
  mkdir -p ${pkgdir}/usr/share/silice
  cp -a frameworks ${pkgdir}/usr/share/silice/
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp -a LICENSE.md LICENSE_GPLv3 LICENSE_MIT  "${pkgdir}/usr/share/licenses/${pkgname}"
}
