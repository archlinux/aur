# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Firef0x <Firefgx (at) gmail (dot) com>
# Contributor: sh0 <mee@sh0.org>
# Contributor: Lekensteyn <lekensteyn@gmail.com>

pkgname=smali
pkgver=2.0.7
pkgrel=1
pkgdesc="An assembler/disassembler for Android's dex format"
arch=('any')
url="https://github.com/JesusFreke/smali"
license=('BSD')
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'gradle')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/JesusFreke/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('64285c967ad5b7567ab4b901710da2b56629151f7afa062774ce9e9c1131da4453b8c5fbde59f8c5cad459393b9ac233191a15058611781fd7b0f8a749c38c9f')

prepare() {
  cd ${pkgname}-${pkgver}
  for file in baksmali smali; do
    # prevent from printing path on launch
    sed '/echo ${newProg}/d' -i scripts/${file}
    # fix ls path
    sed 's|/bin/ls|/usr/bin/ls|' -i scripts/${file}
  done
}

check() {
  cd ${pkgname}-${pkgver}
  gradle --gradle-user-home=. test
}

build() {
  cd ${pkgname}-${pkgver}
  gradle --gradle-user-home=. build
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/bin"
  for file in baksmali smali; do
    install -Dm 644 "${file}/build/libs/${file}-${pkgver}-dev.jar" "${pkgdir}/usr/share/java/${pkgname}/${file}.jar"
    install -Dm 755 scripts/${file} "${pkgdir}/usr/share/java/${pkgname}/${file}"
    ln -s "/usr/share/java/${pkgname}/${file}" "${pkgdir}/usr/bin/${file}"
  done
  install -Dm 644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
