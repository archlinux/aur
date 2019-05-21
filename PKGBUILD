# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: James Thomas <notrevolution at gmail dot com>

pkgname=epubcheck
pkgver=4.2.1
pkgrel=1
pkgdesc="A tool to validate epub files."
arch=('any')
url="https://github.com/IDPF/epubcheck"
license=('BSD')
depends=('java-environment' 'sh')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/w3c/epubcheck/archive/v${pkgver}.tar.gz"
        "epubcheck.1")
sha512sums=('7e5928282dcc5011eed6cd49b7f63637b3eb6c9a88b18fcdfaadfcd26c6dd067498949645d5736e1b0fb14d46c5d10c752b2a7495c876f254c9333a7cff6abe9'
            'f0387379d4d73ef57143c9dcc77cf85c28bbf5a9f7a1badc056764850665c2c2fd2d55a262da7952f5d6659320673de9d115527668c03602d17758021f4f99fd')

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
