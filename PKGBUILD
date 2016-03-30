# Maintainer: Guillaume ALAUX <Guillaume at ALAUX dot net>
_libname=sitefilter
_libver=4.0.9
_libdate=20150602
_libdate_fix=20150603
pkgbase="zvelo-${_libname}"
pkgname=("${pkgbase}-lib" "${pkgbase}-lib-devel" "${pkgbase}-lib-java")
pkgver=${_libver}_${_libdate}
pkgver_fix=${_libver}_${_libdate_fix}
_pkgver=${pkgver/_/-}
_pkgver_fix=${pkgver_fix/_/-}
pkgrel=1
pkgdesc="Zvelo sitefilter lib"
arch=('x86_64')
url="https://zvelo.com/"
license=('custom')
_shname="zveloDB-SDK-${_libver}-Debian-8.0.libcurl.${_libdate}.x86_64.sh"
source=("https://zvelo.com/dl/sdk/${_libver}/${_shname}")
sha256sums=('2eac1806150696a7273d8daacd226b768356651991697c86fc65a7b7ead8d77b')

prepare() {
  sed -e '1,/^---MARKER---$/d' "${_shname}" | zcat 2>/dev/null | tar xvf -
  for l in ${_libname}-lib ${_libname}-lib-devel ${_libname}-lib-java; do
    _name=${l}_${_pkgver_fix}_amd64
    mkdir -p ${_name}
    pushd ${_name}
    ar x ../${_name}.deb
    mkdir -p pkg
    tar xf data.tar.xz -C pkg
    popd
  done
}

package_zvelo-sitefilter-lib() {
  pkgdesc="Zvelo sitefilter lib"
  depends=('libcurl-gnutls')

  cd "${_libname}-lib_${_pkgver_fix}_amd64/pkg"
  install -d -m 755 ${pkgdir}/usr/
  cp -r usr/bin/ ${pkgdir}/usr/
  cp -r usr/lib/x86_64-linux-gnu/ ${pkgdir}/usr/lib/
}

package_zvelo-sitefilter-lib-devel() {
  pkgdesc="Zvelo sitefilter lib - dev tools"
  depends=('zvelo-sitefilter-lib')

  cd "${_libname}-lib-devel_${_pkgver_fix}_amd64/pkg"
  install -d -m 755 ${pkgdir}/usr/share/
  cp -r usr/share/sitefilter/ ${pkgdir}/usr/share/
  cp -r usr/include/ ${pkgdir}/usr/include/
  install -d -m 755 ${pkgdir}/usr/bin
  ln -s /usr/share/sitefilter/samples/c-api-tool \
    ${pkgdir}/usr/bin/
}

package_zvelo-sitefilter-lib-java() {
  pkgdesc="Zvelo sitefilter lib - Java bindings"
  depends=('java-runtime' 'zvelo-sitefilter-lib')

  cd "${_libname}-lib-java_${_pkgver_fix}_amd64/pkg"
  install -d -m 755 ${pkgdir}/usr/share/java/ \
                    ${pkgdir}/usr/lib
  cp -r usr/lib/x86_64-linux-gnu/jni/* ${pkgdir}/usr/lib/
  cp -r usr/share/java ${pkgdir}/usr/share/
}
