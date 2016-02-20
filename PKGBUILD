# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=moonlight
_gitname=${pkgname}-pc
pkgver=0.7.1
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="http://moonlight-stream.com"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('java-runtime' 'sh')
makedepends=('apache-ant')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/moonlight-stream/${_gitname}/archive/v${pkgver}.tar.gz)
sha512sums=('74e592cb6428a6e72636d6e56741054a65bb2ca89210e72256e102047ac8f8b42841eda0bdc690189b93a648a5285df4daa4b3f8bf0a6b36b46c47a6f64b3ec0')

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
    ant moonlight-lin64
  elif [ "${CARCH}" == "i686" ]; then
    ant moonlight-lin32
  fi
}

package() {
  cd ${_gitname}-${pkgver}
  if [ "${CARCH}" == "x86_64" ]; then
    install -Dm 644 ./build/moonlight-lin64.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  elif [ "${CARCH}" == "i686" ]; then
    install -Dm 644 ./build/moonlight-lin32.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  fi
  install -Dm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
