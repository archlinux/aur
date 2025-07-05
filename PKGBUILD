# Maintainer:  Marcos M. Raimundo <marcosmrai@gmail.com>
# Maintainer:  Patrick Klein <patrick@libklein.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="gurobi"
pkgname=({,java-,r-}"${pkgbase}")
pkgver=12.0.2
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
md5sums_aarch64=('4b27456406bfa57eefb29a64b10b21ee')
md5sums_x86_64=('a29179c21aa02c511df847a28e4561a2')
b2sums=('1e78921a5fe8c04a73ac595f80c8116919fd3174c946715ca836c375950785b5b13e5dbb8c6b1356ed6b4b993a0a2efcbc0ad458cfe2563d9945a5a7678381d0')
b2sums_aarch64=('20c96e062e218bac2939b4f1ddc2781c3278104dc05b000c478521179d2c220396168298106a006468bb642141cbbb70bb37b721024ea5bbecec1c9ea7064fa8')
b2sums_x86_64=('437fef3e89dff4fc64d6b9ef181fdf4cee432eeaba1b062b83dc1a076ce2a9de62d43dd0d375f334142ebee2a91cd640a1249412f011fc8a4f9c2d3f639de44d')

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
