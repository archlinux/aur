# Maintainer:  Patrick Klein <patrick@libklein.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marcos M. Raimundo <marcosmrai@gmail.com>

pkgbase="gurobi"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
  "r-${pkgbase}"
)
pkgver=13.0.2
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
md5sums_aarch64=('9b2766ad534ac9220d0505a458735499')
md5sums_x86_64=('f12dcad337ae1d8f9b8c2b3f51b92bb5')
b2sums_aarch64=('974b7492d0f8acf222d83a119425b397bd0ae1fb6bd3f95ea758d08a43740a8af8cc5787a66f595ef196d00fc8c64707135cc17f5470bf7452e2967938ed8c2b')
b2sums_x86_64=('24d3676740308144793806ed46c1ba9da1a886249c6ad6061f50c970eadac969e0867d59db1a90af6e815a734c5c80a254a456d9291a2c400accdc969452ef88')

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
