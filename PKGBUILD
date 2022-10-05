# Thanks: Forest Crossman <cyrozap at gmail dot com>
# Maintainer: Stephanie Wilde-Hobbs <gpg@stephanie.is>

pkgname=go-configure-sw-hub
_pkgver_major=6.32
_pkgver_minor=002
pkgver=$_pkgver_major.$_pkgver_minor
pkgrel=1
pkgdesc="Renesas/Dialog/Silego Go Configure software hub (greenpak designer)"
arch=('x86_64')
url="https://www.renesas.com/us/en/software-tool/go-configure-software-hub"
license=('custom')
makedepends=('patchelf')
depends=('desktop-file-utils' 'graphviz' 'gtk-update-icon-cache' 'libusb' 'qt5-svg' 'qt5-webview' 'qt5-serialport' 'qwt' 'shared-mime-info')
conflicts=('greenpak-designer-dev' 'greenpak-designer')
replaces=('greenpak-designer-dev' 'greenpak-designer')
options=('!strip')

source=("https://renesasweb-greenpak.s3.us-west-2.amazonaws.com/v${_pkgver_major}/go-configure-sw-hub-v${pkgver}-debian-testing-amd64-external.deb")
sha256sums=('2787e52ff890c18fac125854ca59ea025464926bbf15d6938e64b0870376deaa')

package() {
  # Extract the package data
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Move /lib files to /usr/lib
  install -dm 755 "${pkgdir}/usr/lib"
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib

  # Remove unneeded binaries and files
  rm -r "${pkgdir}"/usr/bin
  rm -r "${pkgdir}/usr/local/${pkgname}/bin"/{platforms,QtWebEngineProcess,qt.conf}

  # Move binaries to /usr/bin
  mv "${pkgdir}/usr/local/${pkgname}/bin" "${pkgdir}"/usr/bin
  ln -s "../lib/${pkgname}/slgspicebackend" "${pkgdir}"/usr/bin/slgspicebackend

  # Remove unneeded libraries
  rm -r "${pkgdir}/usr/local/${pkgname}/lib"/{libQt5*,libusb-1.0.so*}

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
    [[ -d $_exec ]] && continue
    patchelf --set-rpath "\$ORIGIN/../lib/${pkgname}:\$ORIGIN/../lib" $_exec
  done
  for _lib in "${pkgdir}/usr/lib/${pkgname}"/{lib*,slgspicebackend}; do
    patchelf --set-rpath "\$ORIGIN:\$ORIGIN/.." $_lib
  done

  # Fix desktop launchers
  for _launcher in "${pkgdir}/usr/share/applications"/*.desktop; do
    sed -i "s!local/${pkgname}/!!g" $_launcher
  done

  # Install license file
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
