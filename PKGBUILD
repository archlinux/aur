# Maintainer: Forest Crossman <cyrozap at gmail dot com>

pkgname=greenpak-designer
_pkgver=5.06
_pkgrel=2
pkgver=$_pkgver.$(printf "%03d" $_pkgrel)
pkgrel=1
pkgdesc="GreenPAK1-5 Designer"
arch=('i686' 'x86_64')
url="http://www.silego.com/softdoc/software.html"
license=('custom')
makedepends=('patchelf')
depends=('desktop-file-utils' 'graphviz' 'gtk-update-icon-cache' 'libusb' 'qt5-webengine' 'shared-mime-info')
conflicts=('greenpak-designer-dev')
replaces=('greenpak-designer-dev')
options=('!strip')
install=${pkgname}.install

source=("http://www.silego.com/uploads/resources/GP1-5_Designer_v${pkgver}_LNX_Setup.zip")
sha256sums=('3304e90957c2b19dd73ac0d73c7e87525134681faac64591dcc31ec28613b452')

if [[ $CARCH == 'i686' ]]; then
  _arch='i386'
elif [[ $CARCH == 'x86_64' ]]; then
  _arch='amd64'
fi

package() {
  # Extract the proper package
  ar p ${pkgname}_${_pkgver}-${_pkgrel}_${_arch}.deb data.tar.xz | \
    tar -xJ --exclude="usr/share/doc-base" --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Move /lib files to /usr/lib
  install -dm 755 "${pkgdir}/usr/lib"
  mv "${pkgdir}"/lib/* "${pkgdir}"/usr/lib/
  rm -r "${pkgdir}"/lib

  # Remove unneeded binaries
  rm -r "${pkgdir}/usr/local/${pkgname}/bin"/{platforms,QtWebEngineProcess}

  # Move binaries to /usr/bin
  mv "${pkgdir}/usr/local/${pkgname}/bin" "${pkgdir}"/usr/bin

  # Remove unneeded libraries
  rm -r "${pkgdir}/usr/local/${pkgname}/lib"/{graphviz,libcdt.so*,libcgraph.so*,libgvc.so*,libgvpr.so*,libpathplan.so*,libxdot.so*,libQt5*,libusb-1.0.so*}

  # Move libraries to subdirectory in /usr/lib
  install -dm 755 "${pkgdir}/usr/lib/${pkgname}"
  mv "${pkgdir}/usr/local/${pkgname}/lib"/* "${pkgdir}/usr/lib/${pkgname}"
  rm -r "${pkgdir}/usr/local/${pkgname}/lib"

  # Remove unneeded support files
  rm -r "${pkgdir}/usr/local/${pkgname}"/{plugins,resources,translations}

  # Move supporting files to /usr/share
  mv "${pkgdir}/usr/local/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
  rm -r "${pkgdir}"/usr/local

  # Redefine library search paths
  for _exec in "${pkgdir}/usr/bin"/*; do
    patchelf --set-rpath "\$ORIGIN/../lib:/usr/lib/${pkgname}" $_exec
  done
  for _lib in "${pkgdir}/usr/lib/${pkgname}"/*; do
    patchelf --set-rpath "\$ORIGIN/..:/usr/lib/${pkgname}" $_lib
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
