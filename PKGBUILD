# Maintainer: Marcos M. Raimundo <marcosmrai@gmail.com>
# Maintainer: Patrick Klein <patrick@libklein.com>

pkgname=gurobi
pkgver=12.0.1
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
arch=('x86_64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom')
depends=('python>=3.11')
optdepends=(
  'gcc: C/C++ programming interfaces support'
  'java-environment: Java programming interface support'
  'mono: .NET programming interface support'
  'matlab: MATLAB programming interface support, versions 2008b onwards'
)
source=(
  "https://packages.gurobi.com/${pkgver:0:4}/gurobi${pkgver}_linux64.tar.gz"
  "gurobi.sh"
  "gurobi_setup.m"
)
md5sums=(
  'e56f0813a6869d55475e417dd22cdbbf'
  '1f34712dbc8df686d987b6bf129811fd'
  'fde2cef01f075e2d28188576a2639b34')

prepare() {
  cd "$srcdir/${pkgname}${pkgver//./}/linux64/"

  rm -r examples/build/
  # Remove python version distributed with gurobi
  rm -rf bin/python3.11
  rm -rf lib/python3.11

  # Adapt cross-platform scripts to Arch Linux
  cp ${srcdir}/gurobi.sh bin/
  cp ${srcdir}/gurobi_setup.m matlab/
}

package_gurobi() {
  install=${pkgname}.install

  cd "$srcdir/${pkgname}${pkgver//./}/linux64/"

  # License
  install -D -m644 EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Binaries and related files
  install -Dt "${pkgdir}/usr/bin/" bin/*
  # Gurobi interactive shell
  install -D lib/gurobi.py "${pkgdir}/usr/lib/${pkgname}/gurobi.py"

  # Examples
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/examples/"
  cp -rT examples/ "${pkgdir}/usr/share/doc/${pkgname}/examples/"

  # Headers
  install -Dm644 -t "${pkgdir}/usr/include/" include/*.h

  # Programming interfaces
  install -Dt "${pkgdir}/usr/lib/" lib/*.so*
  install -Dm644 -t "${pkgdir}/usr/lib/" lib/*.a
  ln -sf ./libgurobi.so.${pkgver} "${pkgdir}/usr/lib/libgurobi.so"
  ln -sf ./libgurobi.so.${pkgver} "${pkgdir}/usr/lib/libgurobi$(echo $pkgver | sed 's/\.//g').so"
  ln -sf ./libgurobi_g++8.5.a "${pkgdir}/usr/lib/libgurobi_c++.a"

  install -D -m644 lib/gurobi.jar "${pkgdir}/usr/share/java/${pkgname}/gurobi.jar"

  install -Dt "${pkgdir}/usr/lib/${pkgname}/matlab/" matlab/*.mexa64
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/matlab/" matlab/*.m
}
