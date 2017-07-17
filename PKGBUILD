# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=greenpak-designer
_pkgver=6.07
_pkgrel=2
pkgver=$_pkgver.$(printf "%03d" $_pkgrel)
pkgrel=1
pkgdesc="GreenPAK1-5 Designer"
arch=('i686' 'x86_64')
url="http://www.silego.com/softdoc/software.html"
license=('custom')
makedepends=('patchelf')
depends=('desktop-file-utils' 'graphviz' 'gtk-update-icon-cache' 'libusb' 'qt5-svg' 'qt5-webview' 'qwt' 'shared-mime-info')
conflicts=('greenpak-designer-dev')
replaces=('greenpak-designer-dev')
options=('!strip')
install=${pkgname}.install

source_i686=("http://www.silego.com/uploads/resources/gpd_LNX/GP1-5_Designer_v${pkgver}_Debian8_i386_Setup.deb")
sha256sums_i686=('ee3e2e7ea73ce2e1019dc85da7534b5dfea7995c978282470915601c06419ba3')
source_x86_64=("http://www.silego.com/uploads/resources/gpd_LNX/GP1-5_Designer_v${pkgver}_Debian8_amd64_Setup.deb")
sha256sums_x86_64=('85522a9743768c9bfad1f6c9f0484b26bcedc90a9da73aa508e5fac5914df216')

if [[ $CARCH == 'i686' ]]; then
  _arch='i386'
elif [[ $CARCH == 'x86_64' ]]; then
  _arch='amd64'
fi

package() {
  # Extract the proper package
  ar p GP1-5_Designer_v${pkgver}_Debian8_${_arch}_Setup.deb data.tar.xz | \
    tar -xJ --exclude="usr/share/doc-base" --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Move /lib files to /usr/lib
  install -dm 755 "${pkgdir}/usr/lib"
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib

  # Remove unneeded binaries
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}/usr/local/${pkgname}/bin"/{platforms,QtWebEngineProcess,slgspicebackend}

  # Move binaries to /usr/bin
  mv "${pkgdir}/usr/local/${pkgname}/bin" "${pkgdir}"/usr/bin
  ln -s "../lib/${pkgname}/slgspicebackend" "${pkgdir}"/usr/bin/slgspicebackend

  # Remove unneeded libraries
  rm -r "${pkgdir}/usr/local/${pkgname}/lib"/{libQt5*,libqwt*,libusb-1.0.so*}

  # Move libraries to subdirectory in /usr/lib
  install -dm 755 "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}/usr/local/${pkgname}/lib"{,exec}/* "${pkgdir}/usr/lib/${pkgname}"
  rm -r "${pkgdir}/usr/local/${pkgname}/lib"{,exec}

  # Remove unneeded support files
  rm -r "${pkgdir}/usr/local/${pkgname}"/{plugins,qml,resources,translations}

  # Move supporting files to /usr/share
  mv "${pkgdir}/usr/local/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
  rm -r "${pkgdir}"/usr/local

  # Redefine library search paths
  for _exec in "${pkgdir}/usr/bin"/*; do
    patchelf --set-rpath "\$ORIGIN/../lib/${pkgname}:\$ORIGIN/../lib" $_exec
  done
  for _lib in "${pkgdir}/usr/lib/${pkgname}"/{lib*,slgspicebackend}; do
    patchelf --set-rpath "\$ORIGIN:\$ORIGIN/.." $_lib
  done

  # Fix desktop launchers
  for _launcher in "${pkgdir}/usr/share/applications"/*.desktop; do
    sed -i "s!local/greenpak-designer/!!g" $_launcher
  done

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  ln -s "/usr/share/doc/${pkgname}/licence.rtf.gz" "${pkgdir}/usr/share/licenses/${pkgname}/license.rtf.gz"
}
