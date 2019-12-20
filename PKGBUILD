# Maintainer: Marcos M. Raimundo <marcosmrai@gmail.com>
# Maintainer: Patrick Klein <patrick@libklein.com>

pkgname=gurobi
pkgver=9.0.0
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
arch=('x86_64')
url="http://www.gurobi.com/products/gurobi-optimizer"
license=('custom')
depends=('python>=3.5.0' 'python2>=2.7.0')
optdepends=(
  'gcc: C/C++ programming interfaces support'
  'java-environment: Java programming interface support'
  'mono: .NET programming interface support'
  'matlab: MATLAB programming interface support, versions 2008b onwards'
)
source=(
  "https://packages.gurobi.com/9.0/gurobi9.0.0_linux64.tar.gz"
  "gurobi.sh"
  "gurobi_setup.m"
)
sha256sums=('07c48fe0f18097ddca6ddc6f5a276e1548a37b31016d0b8575bb12ec8f44546e'
            '30d535f7100627195dbe8d1c9a5ce603ed645b93eb8869984eb8a15e8db6d1c8'
            'fd328dc00b276258e7828b301c93574f9aa8e6f143caf5428a648851a6ecf93c')

prepare() {
  cd "$srcdir/${pkgname}${pkgver//./}/linux64/"

  rm bin/python3.7
  rm -r examples/build/

  # Adapt cross-platform scripts to Arch Linux
  cp ${srcdir}/gurobi.sh bin/
  cp ${srcdir}/gurobi_setup.m matlab/
}

package_gurobi() {
  install=${pkgname}.install

  cd "$srcdir/${pkgname}${pkgver//./}/linux64/"

#install -d "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/doc/${pkgname}/" \
#         "${pkgdir}/usr/include/" "${pkgdir}/usr/lib/${pkgname}/matlab/"

  # License
  install -D -m644 EULA.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"

  # Examples
  install -D -m644 bin/gurobi.env "${pkgdir}/usr/share/${pkgname}/gurobi.env"
  
  # Binaries and related files
  install -Dt "${pkgdir}/usr/bin/" bin/*
  rm "${pkgdir}/usr/bin/gurobi.env"
  # Gurobi interactive shell
  install -D lib/gurobi.py "${pkgdir}/usr/lib/${pkgname}/gurobi.py"

  # Documentation
  for _dir in examples quickstart_linux quickstart_mac quickstart_windows refman remoteservices; do
    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/${_dir}/html/"
    cp -rT "docs/${_dir}" "${pkgdir}/usr/share/doc/${pkgname}/${_dir}/html/"
    cp "docs/${_dir}.pdf" "${pkgdir}/usr/share/doc/${pkgname}/${_dir}/"
  done
  ln -sT quickstart_linux "${pkgdir}/usr/share/doc/${pkgname}/quickstart"
  cp -rT examples/ "${pkgdir}/usr/share/doc/${pkgname}/examples/"

  # Headers
  install -Dm644 -t "${pkgdir}/usr/include/" include/*.h 

  # Programming interfaces
  install -Dt "${pkgdir}/usr/lib/" lib/*.so*
  install -Dm644 -t "${pkgdir}/usr/lib/" lib/*.a
  ln -sf ./libgurobi.so.9.0.0 "${pkgdir}/usr/lib/libgurobi900.so"
  ln -sf ./libgurobi_g++5.2.a "${pkgdir}/usr/lib/libgurobi_c++.a"

  python setup.py install --root="$pkgdir" --optimize=1
#install -D "lib/python3.8_utf32/gurobipy/gurobipy.so" "${pkgdir}/usr/lib/python3.8/site-packages/gurobipy/"

  install -D -m644 lib/gurobi.jar "${pkgdir}/usr/share/java/${pkgname}/gurobi.jar"

  install -Dt "${pkgdir}/usr/lib/${pkgname}/matlab/" matlab/*.mexa64
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/matlab/" matlab/*.m
}
