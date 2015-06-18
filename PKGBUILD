# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

_pkgname=moonlight
pkgname=${_pkgname}-git
pkgver=0.6.0.383.16fbe17
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="http://moonlight-stream.com"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('java-runtime' 'sh')
makedepends=('git' 'apache-ant')
provides=('moonlight')
conflicts=("moonlight")
source=(${pkgname}::git+https://github.com/moonlight-stream/moonlight-pc)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  cat > ${_pkgname} <<EOF
#!/bin/sh
exec /usr/bin/java -jar "/usr/share/java/${_pkgname}/${_pkgname}.jar" "\$@"
EOF
}

build() {
  cd ${pkgname}
  if [ "${CARCH}" == "x86_64" ]; then
    ant limelight-lin64
  elif [ "${CARCH}" == "i686" ]; then
    ant limelight-lin32
  fi
}

package() {
  cd ${pkgname}
  if [ "${CARCH}" == "x86_64" ]; then
    install -Dm 644 ./build/limelight-lin64.jar "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  elif [ "${CARCH}" == "i686" ]; then
    install -Dm 644 ./build/limelight-lin32.jar "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
  fi
  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
