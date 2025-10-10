# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

_pkgname=photon
pkgname=${_pkgname}-geocoder
pkgver=0.7.4
_minorpkgver=${pkgver%.*}
pkgrel=1
_jdkver=21 # https://github.com/komoot/photon/blob/master/.github/workflows/ci.yml#L13
pkgdesc="Open source geocoder for openstreetmap data"
arch=(any)
url="https://github.com/komoot/${_pkgname}"
license=('Apache-2.0')
makedepends=("java-environment=${_jdkver}")
install="${_pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "photon.sh"
        "photon.service"
        "photon.sysusers"
        "photon.tmpfiles"
        "photon.install"
        "photon-update.sh"
        "photon-update.service"
        "photon-update.timer")
sha256sums=('985d166c775d9ca5371231c919a9e037dd49658842cbab007a52b6750d04d76d'
            '716279215bc38dd5f5e57a254dbca4b5272a4c1dd56021aa98a346cf62977b3e'
            'dd8a0d46f3a71104a2d1b55d5a01d5d9ef9a35556a7daa3a531e28f011c67598'
            'd51830a965f3136ffac27d91aed0f5364b9cd1e999e4fb88c7a625b8c4951fa4'
            '35b32ae060d99dfe5ccb55a7e77bfd786f7f2e54b091f5c8712107bb33d3827a'
            'f41ba18bbec31665fed92094489e76b4d2b73a3dd6eeff2c74ef6f2d2314e234'
            '4c136a92ded8433b1431b515991e0d31dc833d00dc20f17c02df2aaadee129ee'
            '96f0ef76904403600dc4ca83df29a8555b259c712dba37c5abdd230ed474ed07'
            'a38bbe2b167942df5431624cbd02bb9d51cbf4ac4592a525d5854f59fe0bd382')

prepare() {
  sed -i "s/PHOTON_MINOR_VERSION_SED/${_minorpkgver}/g" photon-update.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ls /usr/lib/jvm
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  ./gradlew build
}

package() {
  depends+=("java-runtime>=11") # https://github.com/komoot/photon/blob/master/build.gradle#L22

  install -m 644 -D "photon.sysusers" "$pkgdir/usr/lib/sysusers.d/photon.conf"
  install -m 644 -D "photon.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/photon.conf"
  install -m 755 -D "photon.sh" "${pkgdir}/usr/bin/photon"
  install -m 755 -D "photon-update.sh" "${pkgdir}/usr/bin/photon-update"
  install -m 644 -D "photon.service" "${pkgdir}/usr/lib/systemd/system/photon.service"
  install -m 644 -D "photon-update.service" "${pkgdir}/usr/lib/systemd/system/photon-update.service"
  install -m 644 -D "photon-update.timer" "${pkgdir}/usr/lib/systemd/system/photon-update.timer"

  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -m 644 -D "target/photon-opensearch-${pkgver}.jar" "${pkgdir}/usr/share/java/photon/photon-opensearch.jar"
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
