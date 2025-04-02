# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="lua"
pkgver=4.0.1
_api="${pkgver%.*}"
pkgname="${_name}${_api//./}"
pkgrel=2
pkgdesc="Powerful lightweight programming language designed for extending applications"
arch=('i686' 'x86_64')
url="https://www.lua.org"
license=('MIT')
depends=('glibc')
provides=("lib${_name}"{,lib}"${_api}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/ftp/${_pkgsrc}.tar.gz"
        "${pkgname}_strip.patch"
        "${pkgname}_cflags.patch"
        "${pkgname}_ldflags.patch"
        "${pkgname}_version.patch")
sha256sums=('df746e149cf6939e90009d2e540eee918d585b4d1bc6d68b19316a050d484d2a'
            '6956f1e3ef68381d11bbbf3a3e0370997b83639cfeab681061c352055d416c58'
            '2b21e98d1629471dfa98e590cdaf9e3ea234c30aa4d3e700b45989813998bf7f'
            '4a77aaed0536305656fd2637f6f152411a647965e721dd0c97ba567870584a4e'
            'd410c202a495d858b5371a16496588bcde975177776c18ba9bce13cd2304af63')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_strip.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_cflags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_ldflags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_version.patch"
}

build() {
  [[ "${CARCH}" == 'x86_64' ]] && export CFLAGS+=" -fPIC"

  cd "${srcdir}/${_pkgsrc}"
  # make MYCFLAGS="${CFLAGS}" all so sobin

  make MYCFLAGS="${CFLAGS}" all

  gcc -o "lib/liblua${_api}.so.${pkgver}"    ${LDFLAGS} -shared src/*.o     -Wl,-soname="liblua${_api}.so.${pkgver}"
  gcc -o "lib/liblualib${_api}.so.${pkgver}" ${LDFLAGS} -shared src/lib/*.o -Wl,-soname="liblualib${_api}.so.${pkgver}" "lib/liblua${_api}.so.${pkgver}" -lm

  cd "lib"
  for lib in liblua liblualib; do
    for ver in "${_api}" "${pkgver}"; do
      ln -vsf "${lib}${_api}.so.${ver}" "${lib}.so.${ver}"
    done

    ln -vsf "${lib}${_api}.so.${pkgver}" "${lib}${_api}.so"
    ln -vsf "${lib}${_api}.so.${pkgver}" "${lib}${_api}.so.${_api}"
  done

  cd "${srcdir}/${_pkgsrc}"
  make MYCFLAGS="${CFLAGS}" sobin
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make \
    INSTALL_ROOT="${pkgdir}/usr" \
    INSTALL_INC="${pkgdir}/usr/include/${_name}${_api}" \
    INSTALL_MAN="${pkgdir}/usr/share/man/man1" \
    INSTALL_DATA="cp -d" \
    install
  
  find "doc" -type f ! -name '*.1' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/html/{}" \;

  install -vDm644 "HISTORY"   "${pkgdir}/usr/share/doc/${pkgname}/HISTORY"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "UPDATE"    "${pkgdir}/usr/share/doc/${pkgname}/UPDATE"
  install -vDm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

  cd "${pkgdir}/usr"
  rm -f ./lib/*.a

  cd "share/man/man1"
  for man in *.1; do 
    mv -f "${man}" "${man%.1}${_api}.1"
  done
}
