# Maintainer: Marcos M. Raimundo <marcosmrai@gmail.com>
# Maintainer: Patrick Klein <patrick@libklein.com>

pkgname=gurobi
pkgver=9.1.2
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
arch=('x86_64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom')
depends=('python>=3.5.0')
optdepends=(
  'gcc: C/C++ programming interfaces support'
  'java-environment: Java programming interface support'
  'mono: .NET programming interface support'
  'matlab: MATLAB programming interface support, versions 2008b onwards'
)
source=(
    "https://packages.gurobi.com/${pkgver:0:3}/gurobi${pkgver}_linux64.tar.gz"
  "gurobi.sh"
  "gurobi_setup.m"
)
md5sums=('022f454faaa37207b3f2526a1abf928f'
         '1f34712dbc8df686d987b6bf129811fd'
         'e0b5a5d7bf4ba8b7b38beea44affabdf')

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

  # Binaries and related files
  install -Dt "${pkgdir}/usr/bin/" bin/*
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
  ln -sf ./libgurobi.so.${pkgver} "${pkgdir}/usr/lib/libgurobi.so"
  ln -sf ./libgurobi.so.${pkgver} "${pkgdir}/usr/lib/libgurobi$(echo $pkgver | sed 's/\.//g').so"
  ln -sf ./libgurobi_g++5.2.a "${pkgdir}/usr/lib/libgurobi_c++.a"

  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 lib/gurobi.jar "${pkgdir}/usr/share/java/${pkgname}/gurobi.jar"

  install -Dt "${pkgdir}/usr/lib/${pkgname}/matlab/" matlab/*.mexa64
  install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/matlab/" matlab/*.m
}
