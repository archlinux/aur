# Maintainer: Justin Kromlinger <hashworks@archlinux.org>

_pkgname=photon
pkgname=${_pkgname}-geocoder
pkgver=1.0.1
_minorpkgver=${pkgver%.*}
pkgrel=1
_jdkver=21 # https://github.com/komoot/photon/blob/master/.github/workflows/ci.yml#L13
pkgdesc="Open source geocoder for openstreetmap data"
arch=(any)
url="https://github.com/komoot/${_pkgname}"
license=('Apache-2.0')
depends=("curl" "tar" "bzip2")
makedepends=("java-environment=${_jdkver}" "git")
install="${_pkgname}.install"
source=("git+${url}.git#tag=${pkgver}"
        "photon.sh"
        "photon.service"
        "photon.sysusers"
        "photon.tmpfiles"
        "photon.install"
        "photon-update.sh"
        "photon-update.service"
        "photon-update.timer")
sha256sums=('985d9fbb088c120ce78b831d1ac9b4a86aba1c1f0f6ecb2a89a56861267f8fb1'
            '77406e3a566fbde059272ccf0c15c4757729c11d5287848c2fb4d702c78cd8cc'
            'dd8a0d46f3a71104a2d1b55d5a01d5d9ef9a35556a7daa3a531e28f011c67598'
            'd51830a965f3136ffac27d91aed0f5364b9cd1e999e4fb88c7a625b8c4951fa4'
            '35b32ae060d99dfe5ccb55a7e77bfd786f7f2e54b091f5c8712107bb33d3827a'
            '5950d3b4fddcb9b7b4bef5b617079f5f5322d309bb7bfb38d3f83c10daa34be7'
            '2662c2337b11af96be0bcd37c7cc6dc37d189f6394eae334646de6aa78ddd482'
            '412014b6ac4471275dfdc0cca9a676aed721e7f8c4380ecd7e98dbbda23213ed'
            'a38bbe2b167942df5431624cbd02bb9d51cbf4ac4592a525d5854f59fe0bd382')

prepare() {
  sed -i "s/PHOTON_MINOR_VERSION_SED/${_minorpkgver}/g" photon-update.sh
}

build() {
  cd "${srcdir}/${_pkgname}"
  ls /usr/lib/jvm
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH="/usr/lib/jvm/java-${_jdkver}-openjdk/bin:$PATH"
  ./gradlew build
}

package() {
  depends+=("java-runtime>=21") # https://github.com/komoot/photon/blob/master/build.gradle#L22

  install -m 644 -D "photon.sysusers" "${pkgdir}/usr/lib/sysusers.d/photon.conf"
  install -m 644 -D "photon.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/photon.conf"
  install -m 755 -D "photon.sh" "${pkgdir}/usr/bin/photon"
  install -m 755 -D "photon-update.sh" "${pkgdir}/usr/bin/photon-update"
  install -m 644 -D "photon.service" "${pkgdir}/usr/lib/systemd/system/photon.service"
  install -m 644 -D "photon-update.service" "${pkgdir}/usr/lib/systemd/system/photon-update.service"
  install -m 644 -D "photon-update.timer" "${pkgdir}/usr/lib/systemd/system/photon-update.timer"

  cd "${srcdir}/${_pkgname}"

  install -m 644 -D "target/photon-${pkgver}.jar" "${pkgdir}/usr/share/java/photon/photon.jar"
  install -m 644 -D "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644 -D "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
