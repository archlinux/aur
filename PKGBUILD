pkgname=ipmiview
pkgver=2.22.0
pkgrel=1
_pkghash=241017
_softwareID=832
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
    "IPMIView_${pkgver}-${_pkghash}.tar.gz::https://www.supermicro.com/support/resources/getfile.php?SoftwareItemID=${_softwareID}&type=serversoftwarefile"
    'ipmiview.desktop'
    'ipmiview.png'
    'patch-jvm-version-check.patch'
    )

sha512sums=('b9e698443095ecaf018caee4a9a4bda2341a3c8eb7e8136d201a9351564222bdd2373524cd16492c1a0264882e961f128de8fd9121c130a302a28d4effcbac7f'
            '82f6d4a9f6ff031f0c7e7ab78a550ea76b8e297df62aaa9837a37fe4f0b4a8b4dfa4aae59c0edc9ee2f0b7e249548ba4f5f50a44e0682a7f7b6f098163a17879'
            'd1fb8e68ca057e3b2bc1c6e51cda226443c729db5166363d637a536afc07aab285ba46f9da5f656837e2423685a0ae421789a4768acee5ac8185ecb04318fc81'
            '5e7c8dc78907ce40a64a2bdd146899b4e32fa6b52cdfb4f193e1182da02076113fc373535f4b56567c6f0d2048e1c9ef23f9b679cf1b5f3881b81b00e0674c37')

prepare() {
  cd ${srcdir}
  patch --forward --strip=0 --input="./patch-jvm-version-check.patch"
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
