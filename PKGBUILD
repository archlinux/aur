# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: James Thomas <notrevolution at gmail dot com>

pkgname=epubcheck
pkgver=4.2.2
pkgrel=2
pkgdesc="A tool to validate epub files."
arch=('any')
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment' 'sh')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/w3c/epubcheck/archive/v${pkgver}.tar.gz"
        "epubcheck.1")
sha512sums=('ba122677c6d0250d4b94d2c280f6613a4673d8fccee9b2919ce9e2cd738f7c2c914e9144f5d5da67c853427b7fd303aedcc3389ca2a5ac0f208b104e01a948cf'
            'adec024c0d9a10aff846a0ece557426e943d2d696e9a1dc1d85859bc6b8bf5569ad39f9fd3832465e9f990a2364dc93d1915778aee2afc746722d5c0112c4d54')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn clean package -Dmaven.test.skip=true -Dmaven.repo.local="${srcdir}/${pkgname}-${pkgver}"
}
            
package() {
  install -d "${pkgdir}/usr/share"/{java,doc,licenses}/"${pkgname}" "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/target/epubcheck.jar" "${pkgdir}/usr/share/java/${pkgname}/epubcheck.jar"    
  install -m644 "${srcdir}/${pkgname}-${pkgver}/target/lib"/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -m644 "${srcdir}/${pkgname}-${pkgver}"/*.md "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  install -Dm644 "${srcdir}/epubcheck.1" "${pkgdir}/usr/share/man/man1/epubcheck.1"

  mkdir -p "$pkgdir/usr/bin"

  cat >> "$pkgdir/usr/bin/${pkgname}" << EOF 
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/epubcheck/epubcheck.jar' "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
