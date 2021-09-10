# Maintainer: Henrik Grimler <henrik@grimler.se>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Butui Hu <hot123tea123@gmal.com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=imagej2
pkgver=2.2.0
_pkgver=${pkgver//_/-}
pkgrel=1
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
source=("https://github.com/imagej/imagej2/archive/refs/tags/imagej-${_pkgver}.tar.gz"
        "0001-application-do-not-try-to-install-imagej-launcher-.j.patch"
        "0002-application-fix-path-to-images.patch")
sha256sums=('84846e5399f486fe23651935e51e203c8f8b16032e69d53ef2b3ad16a9c818fa'
            'fc577554b96eb1d728b192aab5ed175cea907a202dd6b907c54c73d1b01bec30'
            'c968e91a790dccfb5e938e62e80512351b41acbb6d8122b7920d1af400ca4917')

prepare() {
  echo 'Creating desktop file'
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories 'Graphics;Science;Biology;' \
    --icon "${pkgname}" \
    --exec "${pkgname} %f"

  cd imagej2-imagej-${_pkgver}
  patch -Np1 -i "${srcdir}"/0001-application-do-not-try-to-install-imagej-launcher-.j.patch
  patch -Np1 -i "${srcdir}"/0002-application-fix-path-to-images.patch
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
  cp -r "${srcdir}/${pkgname}-imagej-${_pkgver}/ImageJ.app" "${pkgdir}/opt/${pkgname}"
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
  install -Dm644 "${srcdir}/${pkgname}-imagej-${_pkgver}/logo/${pkgname}-v1/imagej.png" \
          "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
          "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-imagej-${_pkgver}/ImageJ.app/LICENSE.txt" \
          -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
