# Maintainer : Nicolas Perrin <booloki@lokizone.net>

_pkgbase=ccextractorfluttergui
pkgname=ccextractor-gui
pkgver=0.5.2
pkgrel=1
pkgdesc="CCExtractor flutter GUI (from sources)."
arch=('x86_64')
url="https://ccextractor.org/public/general/flutter_gui/"
license=('MIT')
makedepends=('flutter' 'cmake' 'ninja' 'clang')
depends=('gtk3' 'ccextractor')
conflicts=('ccextractor-gui-bin')
replaces=('ccextractor-gui-bin')
source=(
        https://github.com/CCExtractor/${_pkgbase}/archive/refs/tags/v$pkgver.tar.gz
        ccextractor-gui.desktop
)
sha512sums=('36ebc29eb05b4bcf70c7af3f72a00ba8fd333b702f6af94b17aea33bdfd5a4e7c8071d619f52ca7c8a447a34fc7bd1069926ce32631cb0c13aadd11bc3d34a1f'
            'f068beb0b6e76897c3bad91d3621e05cf266a23e891f03c4613b69bfc9c3b932121989ce47459f326e437fddcac1e891a9b53fd8ad2f20f9fbc13afe859dcc91')

prepare() {
  cd "$srcdir/${_pkgbase}-${pkgver}"
  sudo gpasswd -a $(whoami) flutterusers
  sudo chown -R $(whoami):flutterusers /opt/flutter
  flutter config --no-analytics
  flutter config --enable-linux-desktop
  source /etc/profile
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  flutter build linux
}

package() {
  # /opt
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -ra "${srcdir}/${_pkgbase}-${pkgver}/build/linux/x64/release/bundle"/* "${pkgdir}/opt/${pkgname}"
  rm "${pkgdir}/opt/${pkgname}/data/flutter_assets/assets/ccextractor"

  # executable binary
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/ccxgui" "${pkgdir}/usr/bin/ccxgui"

  # icon
  install -dm755 "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/data/flutter_assets/assets/ccx.svg" "${pkgdir}/usr/share/pixmaps/ccx.svg"

  # desktop entry
  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 ccextractor-gui.desktop "${pkgdir}/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
