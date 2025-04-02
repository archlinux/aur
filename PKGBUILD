# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="lua"
pkgver=3.2.2
_api="${pkgver%.*}"
pkgname="${_name}${_api//./}"
pkgrel=1
pkgdesc="Powerful lightweight programming language designed for extending applications"
arch=('i686' 'x86_64')
url="https://www.lua.org"
license=('MIT')
depends=('glibc')
provides=("lib${_name}"{,lib}"${_api}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/ftp/${_pkgsrc}.tar.gz"
        "${pkgname}_cflags.patch"
        "${pkgname}_ldflags.patch"
        "${pkgname}_version.patch")
sha256sums=('4e04059f43acdcde5f7fd491c731df9279dac87d288a08c6eaeb31760c9876e0'
            'a87fa36e77ef22ae2aa56ed29e0d840d7b3e67eab5e42f608addf52b50b4d235'
            '52a14cb01e5ced24892249986d98c0e4aa1228f2021471aaeada2da3923b2b90'
            '7477ce78990c111a6bc035fa7bf10c4366d8921619eb54cb6f962f4acda9d234')

prepare() {
  cd "${srcdir}/${_name}"
  patch -Np1 -i "${srcdir}/${pkgname}_cflags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_ldflags.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_version.patch"
}

build() {
  [[ "${CARCH}" == 'x86_64' ]] && export CFLAGS+=" -fPIC"

  cd "${srcdir}/${_name}"
  make MYCFLAGS="${CFLAGS}"

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

  cd "${srcdir}/${_name}"
  rm -f ./bin/*

  make MYCFLAGS="${CFLAGS}"
}

package() {
  cd "${srcdir}/${_name}"
  find "bin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "doc/${_name}c.man" "${pkgdir}/usr/share/man/man1/${_name}c${_api}.1"
  find "doc" -type f -name '*.html' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/html/{}" \;

  find "include" -type f -name '*.h' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/include/${_name}${_api}/{}" \;

  install -d "${pkgdir}/usr/lib"
  find "lib" -type f,l ! -name '*.a' -exec \
    cp -vd "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "HISTORY"   "${pkgdir}/usr/share/doc/${pkgname}/HISTORY"
  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
