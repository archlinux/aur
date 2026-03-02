# Maintainer:  Patrick Klein <patrick@libklein.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marcos M. Raimundo <marcosmrai@gmail.com>

pkgbase="gurobi"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
  "r-${pkgbase}"
)
pkgver=13.0.1
_pkgver="${pkgver%.*}"
pkgrel=1
pkgdesc="State-of-the-art solver for mathematical programming"
arch=(
  'aarch64' # armlinux64
  'x86_64'  # linux64
)
url="https://www.gurobi.com/products/gurobi-optimizer"
license=(
  'custom:Gurobi EULA'
)
makedepends=(
  'r'
)
_pkgsrc="${pkgbase}${pkgver//.}"
source_aarch64=(
  "https://packages.gurobi.com/${_pkgver}/${pkgbase}${pkgver}_armlinux64.tar.gz"
)
source_x86_64=(
  "https://packages.gurobi.com/${_pkgver}/${pkgbase}${pkgver}_linux64.tar.gz"
)
md5sums_aarch64=('92ec10aedf90286d8d2e647240427ff7')
md5sums_x86_64=('46d62f83205c4bf9ea52a1d07eadca46')
b2sums_aarch64=('6fa702b691ec2ce6dd61258a3e2f16fa5154078e6fb5ad7d2d36227b61ca2a96e29e737826d94555306383af190f09dbcae7fc3a0383b4928be250547ab6c549')
b2sums_x86_64=('5c9c68bb8e2a72d3a4683488a3e66fc29d82ee4019b11b125b8da32b70e4649b3ade63fbeb7aaedb409361fed05a3c382142daf2dba1875bc12308664fb8e87f')

if [ "${CARCH}" = 'aarch64' ]; then
  _arch=armlinux64
elif [ "${CARCH}" = 'x86_64' ]; then
  _arch=linux64
else _arch=DUMMY; fi

build() {
  cd "${srcdir}/${_pkgsrc}/${_arch}/src/build"
  make C++FLAGS="${CXXFLAGS} -fPIC"

  cd "${srcdir}/${_pkgsrc}/${_arch}/R"
  mkdir -p "build"
  R CMD INSTALL "${pkgbase}"*.tar.gz -l ./"build"
}

package_gurobi() {
  depends=(
    'glibc'
    'sh'
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

  cd "${srcdir}/${_pkgsrc}/${_arch}"
  install -vd "${pkgdir}/usr"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr" \
    "bin" "include"

  install -vd "${pkgdir}/usr/lib"
  find "lib" -type f,l -name 'lib*.so*' ! -name "libGurobiJni${_pkgver//.}.so" -exec \
    cp -va --no-preserve=ownership "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "EULA.pdf" "${pkgdir}/usr/share/licenses/${pkgbase}/EULA.pdf"

  cd "${srcdir}/${_pkgsrc}/${_arch}/src/build"
  install -vDm644 "libgurobi_c++.a" "${pkgdir}/usr/lib/libgurobi_g++8.5.a"

  cd "${srcdir}/${_pkgsrc}/${_arch}/examples"
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
  arch=(
    'any'
  )
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'java-runtime<=21'
    'java-runtime>=8'
  )

  cd "${srcdir}/${_pkgsrc}/${_arch}/lib"
  find . -type f -name '*.jar' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/java/${pkgbase}/{}" \;

  install -vd "${pkgdir}/usr/lib"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr/lib" \
    "libGurobiJni${_pkgver//.}.so"

  cd "${srcdir}/${_pkgsrc}/${_arch}/examples"
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
    'r>=4.5'
    'r-slam>=0.1.9'
  )

  cd "${srcdir}/${_pkgsrc}/${_arch}/R"
  install -vd "${pkgdir}/usr/lib/R/library"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}/usr/lib/R/library"

  cd "${srcdir}/${_pkgsrc}/${_arch}/examples"
  install -vd "${pkgdir}/usr/share/doc/${pkgbase}/examples"
  cp -va --no-preserve=ownership -t "${pkgdir}/usr/share/doc/${pkgbase}/examples" \
    "R"
}
