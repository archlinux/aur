# Maintainer: Angel Sartonev <work@asart.bg>
pkgname=fwknop-gui
pkgver=1.3
pkgrel=3
pkgdesc='Official desktop client for the fwknop daemon'
url='https://incomsystems.biz/fwknop-gui/'
license=('GPL3')
arch=('i686' 'x86_64')
depends=(fwknop wxwidgets-gtk3 qrencode)
provides=(fwknop-gui)
conflicts=(fwknop-gui)
makedepends=(cmake asciidoc)
optdepends=()
source=(https://github.com/jp-bennett/fwknop-gui/archive/refs/tags/v${pkgver}-release.tar.gz)

md5sums=('2a6312cde3d80cbdbb2d5960dcb51b12')
prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-release"

  # Work around broken GPGME detection (no gpgme-config on Arch):
  # make sure fwknop-gui is always linked with libgpgme.
  sed -i \
    's/\${GPGME_VANILLA_LIBRARIES})/\${GPGME_VANILLA_LIBRARIES} gpgme)/' \
    CMakeLists.txt

  # wxWidgets 3.2: EXPAND + alignment is invalid; alignment is ignored.
  # Drop the useless alignment flags to avoid sizer assertions.
  sed -i \
    's/wxALIGN_LEFT | wxEXPAND | wxALL/wxEXPAND | wxALL/g' \
    fwknop_guiMain.cpp

  sed -i \
    's/wxALIGN_CENTER_HORIZONTAL | wxBOTTOM | wxEXPAND/wxBOTTOM | wxEXPAND/g' \
    fwknop_guiMain.cpp
}
build() { 
	cmake \
            -B "${srcdir}/${pkgname}-${pkgver}-release" \
            -S "${srcdir}/${pkgname}-${pkgver}-release" \
            -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
            -DCMAKE_INSTALL_PREFIX:PATH='/usr'
	make -C "${srcdir}/${pkgname}-${pkgver}-release"
}
package() {
        make -C "${srcdir}/${pkgname}-${pkgver}-release" DESTDIR="${pkgdir}" install
}

