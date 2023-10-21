pkgname=ipmiview
pkgver=2.21.1
_pkghash=230720
pkgrel=3
pkgdesc="Supermicro IPMI tool"
makedepends=('tar')
depends=("glibc" "java-runtime")
arch=('x86_64')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"

backup=(
    "opt/${pkgname}/account.properties"
    "opt/${pkgname}/email.properties"
    "opt/${pkgname}/iKVM.properties"
    "opt/${pkgname}/IPMIView.properties"
    "opt/${pkgname}/stunnel.properties"
    "opt/${pkgname}/timeout.properties"
    )

source=(
    "https://www.supermicro.com/Bios/sw_download/588/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64.tar.gz"
    'ipmiview.desktop'
    'ipmiview.png'
    'patch-jvm-version-check.patch'
    )

sha512sums=('103cc4c12f3ad6a503877db85abd89ad4e0dfdb48d99d30483ab3b97534e7f1729cc94b19ad0ff45c381986807a443d45338df24e7edc41839ed7e718804d46a'
            '82f6d4a9f6ff031f0c7e7ab78a550ea76b8e297df62aaa9837a37fe4f0b4a8b4dfa4aae59c0edc9ee2f0b7e249548ba4f5f50a44e0682a7f7b6f098163a17879'
            'd1fb8e68ca057e3b2bc1c6e51cda226443c729db5166363d637a536afc07aab285ba46f9da5f656837e2423685a0ae421789a4768acee5ac8185ecb04318fc81'
            '9b3830c995503116d3ab76ee71d1df1d4ba1b33ab59f1ce197d979fcc29f18bcafa3e6eeffcb3208f78709d496a86dcf3fc5940973e1e61e28dd136758c7188d')

prepare() {
  cd ${srcdir}
  patch --forward --strip=1 --input="./patch-jvm-version-check.patch"
}

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/applications

  pushd ${srcdir}/IPMIView_${pkgver}_build.${_pkghash}_bundleJRE_Linux_x64
  rm -rf jre/ # Remove bundled jre
  cp -rf . ${pkgdir}/opt/${pkgname}
  popd

  touch ${pkgdir}/opt/${pkgname}/account.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/account.properties

  touch ${pkgdir}/opt/${pkgname}/email.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/email.properties

  touch ${pkgdir}/opt/${pkgname}/iKVM.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/iKVM.properties

  touch ${pkgdir}/opt/${pkgname}/IPMIView.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/IPMIView.properties

  touch ${pkgdir}/opt/${pkgname}/stunnel.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/stunnel.properties

  touch ${pkgdir}/opt/${pkgname}/timeout.properties
  chmod a+rw ${pkgdir}/opt/${pkgname}/timeout.properties

  ln -s /opt/${pkgname}/IPMIView20 ${pkgdir}/usr/bin/${pkgname}
  install -m 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  install -m 0644 "${srcdir}/${pkgname}.png" "${pkgdir}/opt/${pkgname}/"
}
