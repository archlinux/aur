# Maintainer:  Marcos M. Raimundo <marcosmrai@gmail.com>
# Maintainer:  Patrick Klein <patrick@libklein.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="gurobi"
pkgname=({,java-,r-}"${pkgbase}")
pkgver=12.0.3
_pkgver="${pkgver%.*}"
pkgrel=2
pkgdesc="State-of-the-art solver for mathematical programming"
arch=('aarch64' 'x86_64')
url="https://www.gurobi.com/products/gurobi-optimizer"
license=('custom:Gurobi EULA')
makedepends=('r')
_pkgsrc="${pkgbase}${pkgver//./}" # "${pkgbase}-${pkgver}"
source=("${pkgbase}.sh")
source_aarch64=("${pkgbase}-${pkgver}-aarch64.tar.gz::https://packages.gurobi.com/${_pkgver}/${pkgname}${pkgver}_armlinux64.tar.gz")
source_x86_64=("${pkgbase}-${pkgver}-x86_64.tar.gz::https://packages.gurobi.com/${_pkgver}/${pkgname}${pkgver}_linux64.tar.gz")
md5sums=('1f34712dbc8df686d987b6bf129811fd')
md5sums_aarch64=('2365a298a88900856441766350e3a917')
md5sums_x86_64=('7cb948ba0906faf0d666b77a40687cc2')
b2sums=('1e78921a5fe8c04a73ac595f80c8116919fd3174c946715ca836c375950785b5b13e5dbb8c6b1356ed6b4b993a0a2efcbc0ad458cfe2563d9945a5a7678381d0')
b2sums_aarch64=('2b801d8778e2bf462a15153a027edb9e6d1ae3b7ea99c800ba52cec555be80cbf8e0a8359912d3d90fd34a821f701030319a7958450e644c61076e390c89ceac')
b2sums_x86_64=('5dd5419d105e273da774423880b59f7dd13b6ee6136acd4710ef59357bb95faa8811b4f9d1b7ec616995241e483083d6f50d9482a805e9c7b1c894642004cf6e')

if [ "${CARCH}" = 'aarch64' ]; then
  _arch=armlinux64
elif [ "${CARCH}" = 'x86_64' ]; then
  _arch=linux64
else _arch=DUMMY; fi

prepare() {
  cd "${srcdir}/${_pkgsrc}/${_arch}"
  # Remove Python version distributed with Gurobi
  find . -name 'python3.*' -exec rm -rf "{}" +

  # Adapt cross-platform scripts to Arch Linux
  cp "${srcdir}/${pkgname}.sh" ./bin/
}

build() {
  cd "${srcdir}/${_pkgsrc}/${_arch}/src/build"
  make C++FLAGS="${CXXFLAGS} -fPIC"

  cd "${srcdir}/${_pkgsrc}/${_arch}/R"
  mkdir -p "build"
  R CMD INSTALL "${pkgbase}"*.tar.gz -l ./"build"
}

package_gurobi() {
  depends=('glibc' 'sh')
  optdepends=("java-${pkgbase}: Java bindings"
    "matlab-${pkgbase}: MATLAB bindings"
    'python-gurobipy: Python bindings, interactive shell'
    "r-${pkgbase}: R bindings")
  provides=("lib${pkgbase}.so")
  install="${pkgbase}.install"

  cd "${srcdir}/${_pkgsrc}/${_arch}"
  find "bin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "include" -type f -name '*.h' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vdm755 "${pkgdir}/usr/lib"
  find "lib" -type f,l -name 'lib*.so*' -exec \
    cp -vaP "{}" "${pkgdir}/usr/{}" \;

  install -vDm755 "lib/${pkgbase}.py" "${pkgdir}/usr/lib/${pkgbase}/${pkgbase}.py"
  install -vDm644 "EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgbase}/EULA.pdf"

  cd "${srcdir}/${_pkgsrc}/${_arch}/src/build"
  install -vDm644 "libgurobi_c++.a" "${pkgdir}/usr/lib/libgurobi_g++8.5.a"

  cd "${srcdir}/${_pkgsrc}/${_arch}/examples"
  find "build" "c" "c#" "c++" "data" "python" "vb" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgbase}/examples/{}" \;

  cd "${pkgdir}/usr/lib"
  for lib in lib*.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done

  ln -vsf "libgurobi_g++8.5.a" "libgurobi_c++.a"
  ln -vsf "libgurobi.so.${pkgver}" "libgurobi${pkgver//./}.so"
}

package_java-gurobi() {
  pkgdesc+=" (Java bindings)"
  arch=('any')
  depends=("${pkgbase}=${pkgver}-${pkgrel}" 'java-runtime<=21' 'java-runtime>=8')

  cd "${srcdir}/${_pkgsrc}/${_arch}/lib"
  find . -type f -name '*.jar' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/java/${pkgbase}/{}" \;

  cd "${srcdir}/${_pkgsrc}/${_arch}/examples"
  find "java" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgbase}/examples/{}" \;
}

package_r-gurobi() {
  pkgdesc+=" (R bindings)"
  license+=('LGPL-2.1-only')
  depends=("${pkgbase}=${pkgver}-${pkgrel}" 'glibc' 'r>=4.5' 'r-slam>=0.1.9')

  cd "${srcdir}/${_pkgsrc}/${_arch}/R"
  install -vdm755 "${pkgdir}/usr/lib/R/library"
  cp -va --no-preserve=ownership "build"/* "${pkgdir}/usr/lib/R/library"

  cd "${srcdir}/${_pkgsrc}/${_arch}/examples"
  find "R" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgbase}/examples/{}" \;
}
