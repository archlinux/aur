# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=moonlight
_gitname=${pkgname}-pc
pkgver=0.7.5
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="http://moonlight-stream.com"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('java-runtime' 'sh')
makedepends=('apache-ant')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/moonlight-stream/${_gitname}/archive/v${pkgver}.tar.gz)
sha512sums=('944a1e86dd69d69429135742ffd61e6dbf84e643df1f6f4daff205ab7e4bf29ddc2a4306e5e7405448fc118a668ad113d0b95117a81b3de088b4f2a00873b3f1')

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
