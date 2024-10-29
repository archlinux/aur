# Maintainer: Kiri <kiri@vern.cc>
# Contributor: Guoyi Zhang <myname@malacology.net>
# Contributor: Henrik Grimler <henrik@grimler.se>
# Contributor: Pelle Windestam <pelle@windestam.se>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Butui Hu <hot123tea123@gmal.com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

pkgname=imagej2
pkgver=2.16.0
# _pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc='Open scientific N-dimensional image processing
         https://doi.org/10.1186/s12859-017-1934-z'
arch=('x86_64')
url='https://imagej.net'
license=('BSD-2-Clause')
depends=(
  'glibc'
  'java-runtime=8'
  'sh'
  'hicolor-icon-theme'
)
makedepends=(
  'gendesk'
  'java-environment=8'
  'maven'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/imagej/imagej2/archive/refs/tags/imagej-${pkgver}.tar.gz")
sha256sums=('bbd66b3b812f12a42881f26555f66d4e2b61b188f1daf125f95528ff0d89fc7f')
_M2_REPO=$(mktemp -d)

prepare() {
  cd ${srcdir}
  echo 'Creating desktop file'
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "Open scientific N-dimensional image processing" \
    --categories=Science \
    --icon "${pkgname}" \
    --exec "${pkgname} %f"

  echo 'Creating launcher file'
  cat > "${pkgname}.sh" << EOF
#!/usr/bin/env sh
if [ -d /usr/lib/jvm/java-8-openjdk/jre/bin/ ]; then
  PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:\${PATH} /usr/share/${pkgname}/ImageJ-linux64
else
  echo "Error, no compatiable java found! ${pkgname} depends on java 8"
fi
EOF
}

build() {
  cd "${pkgname}-imagej-${pkgver}"

  # only building with Java 8 is supported
  # https://github.com/imagej/imagej/issues/197#issuecomment-403531162
  export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
  # With -Dmaven.install.skip=true we prevent dependencies being
  # installed to ~/.m2/
  mvn -Dmaven.repo.local=${_M2_REPO} \
    clean \
    package \
    -Papp -Ppopulate-app \
    -Dmaven.test.skip=true \
    -Dmaven.install.skip=true
}

package() {
  cd ${srcdir}
  install -Dm755 "${pkgname}.sh" \
                 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/${pkgname}-imagej-${pkgver}/ImageJ2.app"
  install -Dm644 jars/* \
              -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm644 about/* \
              -t "${pkgdir}/usr/share/${pkgname}/about"
  install -Dm644 images/* \
              -t "${pkgdir}/usr/share/${pkgname}/images"
  install -Dm644 plugins/* \
              -t "${pkgdir}/usr/share/${pkgname}/plugins"
  install -Dm644 "LICENSE.txt" \
              -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "ImageJ-linux64" \
                 "${pkgdir}/usr/share/${pkgname}"

  cd "${srcdir}/${pkgname}-imagej-${pkgver}/logo"
  local r
  for r in 16 32 64 128 256; do
    install -Dm 644 "${r}x${r}-shadow.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${r}x${r}/apps/${pkgname}.png"
  done
  install -Dm 644 "imagej2.ico" \
                  "${pkgdir}/usr/share/icons/${pkgname}.ico"

  install -d "${pkgdir}/usr/share/${pkgname}/jars"
  ln -sr ${pkgdir}/usr/share/java/${pkgname}/* \
        "${pkgdir}/usr/share/${pkgname}/jars"
}
