# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=greenpak-designer
_pkgver=6.25
_pkgrel=3
pkgver=$_pkgver.$(printf "%03d" $_pkgrel)
pkgrel=1
pkgdesc="GreenPAK3-6 Designer"
arch=('i686' 'x86_64')
url="https://www.dialog-semiconductor.com/greenpak-designer-software"
license=('custom')
makedepends=('patchelf')
depends=('desktop-file-utils' 'graphviz' 'gtk-update-icon-cache' 'libusb' 'qt5-svg' 'qt5-webview' 'qwt' 'shared-mime-info')
conflicts=('greenpak-designer-dev')
replaces=('greenpak-designer-dev')
options=('!strip')
install=${pkgname}.install

source_i686=("https://support.dialog-semiconductor.com/downloads/GP_Designer_v${pkgver}_Debian-testing_i386_Setup.deb")
sha256sums_i686=('34bea41fdd706d4a7ed34ee18769ff0fa299c0950f2d477a11fa06109671f349')
source_x86_64=("https://support.dialog-semiconductor.com/downloads/GP_Designer_v${pkgver}_Debian-testing_amd64_Setup.deb")
sha256sums_x86_64=('93f6ba4899bf9efe7e3316eb497763a52db1cfa93ef2806c6d83536db9a39095')

package() {
  # Extract the package data
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

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
}
