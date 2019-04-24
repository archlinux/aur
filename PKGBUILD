# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: James Thomas <notrevolution at gmail dot com>

pkgname=epubcheck
pkgver=4.2.0
pkgrel=1
pkgdesc="A tool to validate epub files."
arch=('any')
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment' 'sh')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/w3c/epubcheck/archive/v${pkgver}.tar.gz"
        "epubcheck.1")
sha512sums=('79b2cd9ece1f78b492f8d4b3b6e0a206d795515513aa0b0c6e3f5dd1ca812b01e5a00c69e83600318d9857b200fd3f65ce1b00ac8a26bb317dc37de1653f1c6e'
            'f15527b6283053d3ae8e03679ed011b75b52e1d14b765a49565d17bb7d2aad785d57db477a692a3df89bfcacf80b03c7c98d652946d03ceb343edc48f40a635d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn clean package -Dmaven.test.skip=true -Dmaven.repo.local="${srcdir}/${pkgname}-${pkgver}"
}
            
package() {
  install -d "${pkgdir}/usr/share"/{java,docs,licenses}/"${pkgname}" "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/target/epubcheck.jar" "${pkgdir}/usr/share/java/${pkgname}/epubcheck.jar"    
  install -m644 "${srcdir}/${pkgname}-${pkgver}/target/lib"/*.jar "${pkgdir}/usr/share/java/${pkgname}/lib"
  install -m644 "${srcdir}/${pkgname}-${pkgver}"/*.md "${pkgdir}/usr/share/docs/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  install -Dm644 "${srcdir}/epubcheck.1" "${pkgdir}/usr/share/man/man1/epubcheck.1"

  mkdir -p "$pkgdir/usr/bin"

  cat >> "$pkgdir/usr/bin/${pkgname}" << EOF 
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/epubcheck/epubcheck.jar' "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
