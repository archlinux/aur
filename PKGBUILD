# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# If you think this package is shit, contact me with patch

pkgname=keystore-explorer-git
pkgver=v5.4.3+5+gb86412f
pkgrel=2
pkgdesc="KeyStore Explorer is a free GUI replacement for the Java command-line utilities keytool and jarsigner."
arch=('any')
url="https://keystore-explorer.org/"
license=('GPLv3')
depends=('java-environment' 'bash' 'desktop-file-utils')
makedepends=( 'unzip' 'gradle' 'java-environment')
conflicts=('keystore-explorer' 'keystore-explorer-bin')
source=('git+file:///tmp/keystore-explorer')
sha256sums=('SKIP')
_pkgname=keystore-explorer
_short_pkgname=kse
_short_pkgver=543

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${_pkgname}/${_short_pkgname}"
  gradle zip # -g .gradle
  cd "${srcdir}"
  unzip -o ${_pkgname}/${_short_pkgname}/build/distributions/${_short_pkgname}-${_short_pkgver}.zip
}

package() {
  cd "${srcdir}/${_short_pkgname}-${_short_pkgver}"

  # create dir structure in pkgdir
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}/licenses"
  install -d "${pkgdir}/opt/${_pkgname}/lib"

  # copy app files
  install -D -m644 *.jar "${pkgdir}"/opt/"${_pkgname}"
  install -D -m755 kse.sh "${pkgdir}"/opt/"${_pkgname}"
  install -D -m644 readme.txt "${pkgdir}"/opt/"${_pkgname}"
  install -D -m644 licenses/license-*.txt "${pkgdir}/opt/${_pkgname}/licenses"
  install -D -m644 lib/*.jar "${pkgdir}/opt/${_pkgname}/lib"

  # install desktop file to system
  install -D -m644 ${srcdir}/${_pkgname}/${_short_pkgname}/res/kse.desktop ${pkgdir}/usr/share/applications/kse.desktop

  # generate icons
  for i in 16 32 48 128 256 512; do
      install -Dm644 ${srcdir}/${_pkgname}/${_short_pkgname}/res/icons/kse_${i}.png \
      ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/kse.png
  done

  # provide 'kse' executable
  ln -sf /opt/${_pkgname}/kse.sh "${pkgdir}/usr/bin/kse"

}