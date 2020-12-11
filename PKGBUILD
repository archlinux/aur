# Maintainer: stiglers-eponym
pkgname=beamerpresenter
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple dual screen pdf presentation software"
arch=('x86_64')
url="https://github.com/stiglers-eponym/BeamerPresenter"
license=('GPL3')
depends=('poppler-qt5>=0.41.0' 'qt5-multimedia>=5.5.1' 'hicolor-icon-theme')
optdepends=('mupdf-tools: external rendering'
    'gst-libav: video support'
    'gst-plugins-good: multimedia support'
    'wmctrl: embedding external programs in Xorg')
conflicts=('beamerpresenter-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4acf279613637487201cbe6fcdf37592fd1a7891a58f7918f561c86f01489b4d')
backup=("etc/xdg/${pkgname}/${pkgname}.conf" "etc/xdg/${pkgname}/pid2wid.sh")

build() {
  cd "${srcdir}/BeamerPresenter-${pkgver}"

  ## Uncomment the following line to exclude strange "embedding" of
  ## applications which only works with an X server:
  #sed -i 's/^\([^#]*\)\(DEFINES *+= *EMBEDDED_APPLICATIONS_ENABLED\)/\1#\2/' beamerpresenter.pro

  ## Uncomment the following line to avoid checks of you QPA platform. You
  ## should then only start BeamerPresenter in window managers where it does
  ## not cause any problems:
  #sed -i 's/^\([^#]*\)\(DEFINES *+= *CHECK_QPA_PLATFORM\)/\1#\2/' beamerpresenter.pro

  qmake && make
}

package() {
  cd "${srcdir}/BeamerPresenter-${pkgver}"
  install -Dm755 beamerpresenter "${pkgdir}/usr/bin/${pkgname}"
  sed -ie 's/^pid2wid=.*$/pid2wid=\/etc\/xdg\/beamerpresenter\/pid2wid.sh/' config/beamerpresenter.conf
  install -Dm644 config/beamerpresenter.conf "${pkgdir}/etc/xdg/${pkgname}/${pkgname}.conf"
  install -Dm644 config/pid2wid.sh "${pkgdir}/etc/xdg/${pkgname}/pid2wid.sh"
  [ -f man/beamerpresenter.1 ] && gzip -f9 man/beamerpresenter.1
  [ -f man/beamerpresenter.conf.5 ] && gzip -f9 man/beamerpresenter.conf.5
  install -Dm644 man/beamerpresenter.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 man/beamerpresenter.conf.5.gz "${pkgdir}/usr/share/man/man5/${pkgname}.conf.5.gz"
  install -Dm644 src/icons/beamerpresenter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/beamerpresenter.svg"
  install -Dm644 share/applications/beamerpresenter.desktop "${pkgdir}/usr/share/applications/beamerpresenter.desktop"
}
