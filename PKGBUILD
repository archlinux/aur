# Maintainer: Henrik Grimler <henrik@grimler.se>
# Contributor: Pelle Windestam <pelle@windestam.se>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Butui Hu <hot123tea123@gmal.com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=imagej2
pkgver=2.9.0
_pkgver=${pkgver//_/-}
pkgrel=0
pkgdesc='Open scientific N-dimensional image processing'
arch=('x86_64')
url='https://imagej.net'
license=('BSD')
depends=(
  'glibc'
  'java-runtime=8'
)
makedepends=(
  'gendesk'
  'java-environment=8'
  'maven'
)
source=("https://github.com/imagej/imagej2/archive/refs/tags/imagej-${_pkgver}.tar.gz")
sha256sums=('21c584411a7c70bc44ad435970cf6f00c7af0c03b97bc9274e05956109fb0c80')

prepare() {
  echo 'Creating desktop file'
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories 'Graphics;Science;Biology;' \
    --icon "${pkgname}" \
    --exec "${pkgname} %f"
}

build() {
  cd "${pkgname}-imagej-${_pkgver}"

  # only building with Java 8 is supported
  # https://github.com/imagej/imagej/issues/197#issuecomment-403531162
  export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
  # With -Dmaven.install.skip=true we prevent dependencies being
  # installed to ~/.m2/
  mvn -Papp -Ppopulate-app -Dmaven.install.skip=true
}

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps"
  cp -r "${srcdir}/${pkgname}-imagej-${_pkgver}/ImageJ2.app" "${pkgdir}/opt/${pkgname}"
  rm -rfv "${pkgdir}/opt/${pkgname}/Contents" "${pkgdir}/opt/${pkgname}"/*.exe

  cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/bash
if [ -d /usr/lib/jvm/java-8-jdk/bin ]; then
  PATH=/usr/lib/jvm/java-8-jdk/bin:${PATH} /opt/${pkgname}/ImageJ-linux64
elif [ -d /usr/lib/jvm/java-8-openjdk/bin ]; then
  PATH=/usr/lib/jvm/java-8-openjdk/bin:${PATH} /opt/${pkgname}/ImageJ-linux64
else
  echo "Error, no compatiable java found! ${pkgname} depends on java 8"
fi
EOF

  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-imagej-${_pkgver}/logo/${pkgname}-v1/128x128.png" \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
          "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-imagej-${_pkgver}/ImageJ2.app/LICENSE.txt" \
          -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
