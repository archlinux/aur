# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Thomas Kuther <tom@kuther.net>
# Contributor: Alexandre Berthaud <alexandre at berthaud dot me>

_pkgname=kse
pkgname=keystore-explorer
pkgver=5.5.2
pkgrel=1
pkgdesc='KeyStore Explorer is a free GUI replacement for the Java command-line utilities keytool and jarsigner'
arch=('any')
url='https://keystore-explorer.org'
license=('GPL3')
depends=('java-runtime')
makedepends=('gradle' 'java-environment')
conflicts=('keystore-explorer-bin' 'keystore-explorer-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kaikramer/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-fix-419.patch")
b2sums=('8bf8db4539231f2c4390b7369f44aed3d82ec2967dfbcbe928a9ac25b2beebb3583ab0fa54f826d98fb2747883ca0b79b6ac59e863413bfe85c18668b11e38dd'
        'f2b62374c5896c308b5f76fd354635e39493074acd1cc06b94ed09cdd7f9ce460655b0af2e42c9d3eacbafcf20f41e53a11a0d632842a9259feccffeca788d94')

prepare() {
  patch -d "${pkgname}-${pkgver}" -p1 <"${pkgname}-fix-419.patch"
}

build() {
  cd "${pkgname}-${pkgver}"/${_pkgname}
  gradle clean build
}

package() {
  cd "${pkgname}-${pkgver}"
  # Extract package data
  bsdtar -xf "${_pkgname}/build/distributions/${_pkgname}-${pkgver}.tar"

  # JAR
  install -dm755 "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}/lib/"*.jar "${pkgdir}/usr/share/java/${pkgname}"
  ln -sf . "${pkgdir}/usr/share/java/${pkgname}/lib"

  # Binary
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${_pkgname}-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/share/java/${pkgname}"
  ln -sf "/usr/share/java/${pkgname}/lib/kse" "${pkgdir}/usr/bin/kse"

  # Desktop
  for size in 16 32 48 128 256 512; do
    install -Dm644 "${_pkgname}/icons/${_pkgname}_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_pkgname}.png"
  done
  install -Dm644 "${_pkgname}/icons/${_pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm644 "${_pkgname}/res/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Doc
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_pkgname}/res/readme.txt" "${pkgdir}/usr/share/doc/${pkgname}/readme.txt"
}
