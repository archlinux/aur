# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# If you think this package is shit, contact me with patch

pkgname=keystore-explorer-git
pkgver=v5.5.0+4+g444df8cb
pkgrel=1
pkgdesc="KeyStore Explorer is a free GUI replacement for the Java command-line utilities keytool and jarsigner."
_pkgname=keystore-explorer
_short_pkgname=kse
_short_pkgver=5.5.0
arch=('any')
url="https://keystore-explorer.org/"
license=('GPLv3')
depends=('java-environment' 'bash' 'desktop-file-utils')
makedepends=('unzip' 'gradle' 'java-environment')
conflicts=('keystore-explorer' 'keystore-explorer-bin')
provides=('keystore-explorer')
source=('git+https://github.com/kaikramer/keystore-explorer.git')
sha256sums=('SKIP')

# prepare() {
#     cd "${_pkgname}"
#     patch --forward --strip=1 --input="${srcdir}/fix282.patch"
# }

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${_pkgname}/${_short_pkgname}"

  # get current version from source
  _v=$(grep 'KSE.Version' src/org/${_short_pkgname}/version.properties | sed 's/KSE.Version=//')
  export _current_short_pkgver=${_v:-$_short_pkgver}

  # build it
  gradle clean build

  # extract freshly built dist file
  cd "${srcdir}"
  unzip -o ${_pkgname}/${_short_pkgname}/build/distributions/${_short_pkgname}-${_current_short_pkgver}.zip
}

package() {
  cd "${_short_pkgname}-${_current_short_pkgver}"

  # create dir structure in pkgdir
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt/${_pkgname}/bin"
  install -d "${pkgdir}/opt/${_pkgname}/licenses"
  install -d "${pkgdir}/opt/${_pkgname}/lib"

  # copy app files
  install -D -m755 bin/kse   "${pkgdir}/opt/${_pkgname}/bin"
  install -D -m644 lib/*.jar "${pkgdir}/opt/${_pkgname}/lib"

  # copy some reading material
  install -D -m644 ${srcdir}/${_pkgname}/${_short_pkgname}/res/readme.txt "${pkgdir}/opt/${_pkgname}"
  install -D -m644 ${srcdir}/${_pkgname}/${_short_pkgname}/licenses/*.txt "${pkgdir}/opt/${_pkgname}/licenses"
  
  # install desktop file to system
  install -D -m644 ${srcdir}/${_pkgname}/${_short_pkgname}/res/kse.desktop ${pkgdir}/usr/share/applications/kse.desktop

  # generate icons
  for i in 16 32 48 128 256 512; do
      install -Dm644 ${srcdir}/${_pkgname}/${_short_pkgname}/icons/kse_${i}.png \
      ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/kse.png
  done

  # provide 'kse' command
  ln -sf /opt/${_pkgname}/bin/${_short_pkgname} "${pkgdir}/usr/bin/${_short_pkgname}"

}
