# Maintainer:  Patrick Klein <patrick@libklein.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marcos M. Raimundo <marcosmrai@gmail.com>

pkgbase="gurobi"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
  "r-${pkgbase}"
)
pkgver=13.0.3
_pkgver="${pkgver%.*}"
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
declare -Ag _arch=(
  ['aarch64']='armlinux64'
  ['x86_64']='linux64'
)
arch=(
  "${!_arch[@]}"
)
url="https://www.gurobi.com/products/gurobi-optimizer"
license=(
  'custom:Gurobi EULA'
)
makedepends=(
  'r'
)
_pkgsrc="${pkgbase}${pkgver//.}"
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  'https://packages.gurobi.com/${_pkgver}/${pkgbase}${pkgver}_${_arch[${_carch}]}.tar.gz'
)"
done
md5sums_aarch64=('61622a2a229a3b440770d681cde592cf')
md5sums_x86_64=('4c7f9f984636eaa701eaa0620153af98')
b2sums_aarch64=('6402e70513e7f8425b359b5dc80d66bb115e3f605f8828ba57bf8f58e2c06220f3bb526b760523b1d1e50cbf283b9c50e3d7a33c2139260e228fcc9600344a02')
b2sums_x86_64=('2cfb26fc9fd566c3b63c00cc3cd7c9436f689264a3099bb511ab458c9daca7d24d7a32a221659425fcfebbdbd3eba21b476bfb366decca479e304a4ca7fccdf2')

build() {
  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/src/build"
  make C++FLAGS="${CXXFLAGS} -fPIC"

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/R"
  mkdir -p "build"
  R CMD INSTALL "${pkgbase}"*.tar.gz -l ./"build"
}

package_gurobi() {
  depends=(
    'glibc'
  )
  optdepends=(
    "java-${pkgbase}: Java bindings"
    "matlab-${pkgbase}: MATLAB bindings"
    'python-gurobipy: Python bindings'
    "r-${pkgbase}: R bindings"
  )
  # provides=(
  #   "lib${pkgbase}.so"
  # )
  install="${pkgbase}.install"

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr" \
    "bin" "include"

  install -vd "${pkgdir}/usr/lib"
  find "lib" -type f,l -name 'lib*.so*' ! -name "libGurobiJni${_pkgver//.}.so" -exec \
    cp -va --no-preserve=ownership "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgbase}/EULA.pdf"

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/src/build"
  install -vDm644 "libgurobi_c++.a" "${pkgdir}/usr/lib/libgurobi_g++8.5.a"

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/examples"
  install -vd "${pkgdir}/usr/share/doc/${pkgbase}/examples"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr/share/doc/${pkgbase}/examples" \
    "build" "c" "c#" "c++" "data" "python" "vb"

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
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'glibc'
    'java-runtime-headless<=21'
    'java-runtime-headless>=8'
  )

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/lib"
  find . -type f -name '*.jar' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/java/${pkgbase}/{}" \;

  install -vd "${pkgdir}/usr/lib"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr/lib" \
    "libGurobiJni${_pkgver//.}.so"

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/examples"
  install -vd "${pkgdir}/usr/share/doc/${pkgbase}/examples"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr/share/doc/${pkgbase}/examples" \
    "java"
}

package_r-gurobi() {
  pkgdesc+=" (R bindings)"
  license+=(
    'LGPL-2.1-only'
  )
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'glibc'
    'r>=4.5.0'
    'r-slam>=0.1_9'
  )

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/R"
  install -vd "${pkgdir}/usr/lib/R/library"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}/usr/lib/R/library"

  cd "${srcdir}/${_pkgsrc}/${_arch[${CARCH}]}/examples"
  install -vd "${pkgdir}/usr/share/doc/${pkgbase}/examples"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr/share/doc/${pkgbase}/examples" \
    "R"
}
