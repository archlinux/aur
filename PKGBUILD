# Maintainer: Marcos M. Raimundo <marcosmrai@gmail.com>

# Before building this PKGBUILD, you must download the Gurobi Optimizer
# archive at http://www.gurobi.com/download/gurobi-optimizer and put it
# in the same directory as this PKGBUILD. Registration at gurobi.com is
# required, though free of charge, to be able to download the archive.

pkgname=('gurobi')
_basename=gurobi
pkgver=7.0.1
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
arch=('x86_64')
url="http://www.gurobi.com/products/gurobi-optimizer"
license=('custom')
depends=('python>=3.5.0' 'python<3.7')
optdepends=(
  'gcc: C/C++ programming interfaces support'
  'java-environment: Java programming interface support'
  'mono: .NET programming interface support'
  'matlab: MATLAB programming interface support, versions 2008b to 2015b'
)
source=(
  "${_basename}${pkgver}_linux64.tar.gz::file://${_basename}${pkgver}_linux64.tar.gz"
  "gurobi.sh"
  "gurobi_setup.m"
)
sha256sums=('5fbf84f2526d5bac8b1ccc40c3d58c0bd57daa7286fd062b288942b4a9d46165'
            '30d535f7100627195dbe8d1c9a5ce603ed645b93eb8869984eb8a15e8db6d1c8'
            'fd328dc00b276258e7828b301c93574f9aa8e6f143caf5428a648851a6ecf93c')

prepare() {
  cd "$srcdir/${_basename}${pkgver//./}/linux64/"

  rm bin/python2.7
  rm -r examples/build/

  # Adapt cross-platform scripts to Arch Linux
  cp ${srcdir}/gurobi.sh bin/
  cp ${srcdir}/gurobi_setup.m matlab/
}

package_gurobi() {
  install=${_basename}.install

  cd "$srcdir/${_basename}${pkgver//./}/linux64/"

  install -d "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/doc/${_basename}/" \
          "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/${_basename}/matlab/"

  # License
  install -D -m644 EULA.pdf "${pkgdir}/usr/share/licenses/${_basename}/EULA.pdf"

  # Examples
  install -D -m644 bin/gurobi.env "${pkgdir}/usr/share/${_basename}/gurobi.env"
  cp -r examples/ "${pkgdir}/usr/share/${_basename}/"
  
  # Binaries and related files
  install bin/* "${pkgdir}/usr/bin/"
  rm "${pkgdir}/usr/bin/gurobi.env"
  install -D lib/gurobi.py "${pkgdir}/usr/lib/${_basename}/gurobi.py"

  # Documentation
  cp -rT docs/ "${pkgdir}/usr/share/doc/${_basename}/"

  # Headers
  install -m644 include/*.h "${pkgdir}/usr/include/"

  # Programming interfaces
  install lib/*.so* "${pkgdir}/usr/lib/"
  install -m644 lib/*.a "${pkgdir}/usr/lib/"
  ln -sf ./libgurobi.so.7.0.1 "${pkgdir}/usr/lib/libgurobi65.so"
  ln -sf ./libgurobi_g++5.2.a "${pkgdir}/usr/lib/libgurobi_c++.a"

  python2 setup.py install --root="$pkgdir" --optimize=1
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -D "lib/python3.5_utf32/gurobipy/gurobipy.so" "${pkgdir}/usr/lib/python3.5/site-packages/gurobipy/"

  install -D -m644 lib/gurobi.jar "${pkgdir}/usr/share/java/${_basename}/gurobi.jar"

  install matlab/*.mexa64 "${pkgdir}/usr/lib/${_basename}/matlab/"
  install -m644 matlab/*.m "${pkgdir}/usr/lib/${_basename}/matlab/"
}
