# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=greenpak-designer
_pkgver=6.12
_pkgrel=3
pkgver=$_pkgver.$(printf "%03d" $_pkgrel)
pkgrel=1
pkgdesc="GreenPAK1-6 Designer"
arch=('i686' 'x86_64')
url="https://www.dialog-semiconductor.com/greenpak-designer-software"
license=('custom')
makedepends=('patchelf')
depends=('desktop-file-utils' 'graphviz' 'gtk-update-icon-cache' 'libusb' 'qt5-svg' 'qt5-webview' 'qwt' 'shared-mime-info')
conflicts=('greenpak-designer-dev')
replaces=('greenpak-designer-dev')
options=('!strip')
install=${pkgname}.install

source_i686=("http://www.silego.com/uploads/resources/gpd_LNX/GP1-6_Designer_v${pkgver}_Debian8.10_i386_Setup.deb")
sha256sums_i686=('fd4ae936845acfffe1bc5dc72c795d1eb76d49b311a8b42dfb3215d9b0fd88c4')
source_x86_64=("http://www.silego.com/uploads/resources/gpd_LNX/GP1-6_Designer_v${pkgver}_Debian8.10_amd64_Setup.deb")
sha256sums_x86_64=('cfe4abf73075405ef4b4818244a394dd79efc5fc5a6397ff41a1ffef69233255')

if [[ $CARCH == 'i686' ]]; then
  _arch='i386'
elif [[ $CARCH == 'x86_64' ]]; then
  _arch='amd64'
fi

package() {
  # Extract the proper package
  ar p GP1-6_Designer_v${pkgver}_Debian8.10_${_arch}_Setup.deb data.tar.xz | \
    tar -xJ --exclude="usr/share/doc-base" --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Move /lib files to /usr/lib
  install -dm 755 "${pkgdir}/usr/lib"
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib

  # Remove unneeded binaries and files
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}/usr/local/${pkgname}/bin"/{platforms,QtWebEngineProcess,slgspicebackend,qt.conf}

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
