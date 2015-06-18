# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=moonlight
_gitname=${pkgname}-pc
pkgver=0.6.0
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="http://moonlight-stream.com"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('java-runtime' 'sh')
makedepends=('apache-ant')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/moonlight-stream/${_gitname}/archive/v${pkgver}.tar.gz)
sha512sums=('ecdd1893ab2c2cfd217bea44ef0d5e20ada167132d6400e621d50f4ea48d6e01fd8e70a602cbd5dc989a1517f3aa65e7fc705f09c02f764bac2f04a27f1ae278')

prepare() {
  cd ${_gitname}-${pkgver}
  cat > ${pkgname} <<EOF
#!/bin/sh
exec /usr/bin/java -jar "/usr/share/java/${pkgname}/${pkgname}.jar" "\$@"
EOF
}

build() {
  cd ${_gitname}-${pkgver}
  if [ "${CARCH}" == "x86_64" ]; then
    ant limelight-lin64
  elif [ "${CARCH}" == "i686" ]; then
    ant limelight-lin32
  fi
}

package() {
  cd ${_gitname}-${pkgver}
  if [ "${CARCH}" == "x86_64" ]; then
    install -Dm 644 ./build/limelight-lin64.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  elif [ "${CARCH}" == "i686" ]; then
    install -Dm 644 ./build/limelight-lin32.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  fi
  install -Dm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
