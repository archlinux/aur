# Maintainer: Popolon <popolon@popolon.org>

pkgname=silice-git
_pkgname=Silice
pkgver=3d12246b
pkgrel=6
pkgdesc="An open source language that simplifies prototyping and writing algorithms on FPGA architectures."
arch=('i686' 'x86_64' 'armv7h' 'armv8' 'riscv64')
url="https://github.com/sylefeb/Silice"
license=('GPLv3')
depends=('yosys' 'icestorm-git' 'prjoxide-git' 'prjapicula' 'nextpnr-git' 'vtr' 'verilator' 'iverilog' 'freeglut' 'jdk11-openjdk')
optdepends=('openfpgaloader' 'tinyprog')
provides=("silice")
source=("${_pkgname}::git+https://github.com/sylefeb/${_pkgname}.git"
        frameworks_path.patch)
sha512sums=('SKIP'
            '4a8f13b488fe114a1d3fe69868883874c5a3e6a04958482e8c964b4ae01b1f9afb416e21645a43cdabe52d7e630285af916280a4181e254bc8be4797ead4cec6')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-parse --short HEAD
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  patch -Np1 -i ${srcdir}/frameworks_path.patch
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
