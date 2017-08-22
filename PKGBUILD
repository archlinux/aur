# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albion-online-launcher-bin
pkgver=1.0.34.169
pkgrel=1
pkgdesc="The first true cross-platform Sandbox MMO -- launcher client"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
makedepends=('chrpath')
depends=('libgl' 'qt5-webengine' 'sndio' 'xdelta3' 'ttf-font')
optdepends=(albion-online-live-game-data-bin albion-online-staging-game-data-bin)
source=("https://live.albiononline.com/autoupdate/launcher-linux-setup-${pkgver}" "albion-online-launcher.desktop")


install=albion-online-launcher-bin.install
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('db72e3b97a0094b8bbdf337f2e8bd3bf'
         '14b5dfae0a7b3b0dc5e2f2975aa4892c')

prepare() {
  chrpath -d "${srcdir}/data/launcher/Albion-Online"

  pushd "${srcdir}/data/launcher"
  rm libQt5* qt.conf xdelta3 QtWebEngineProcess libicu*
  popd

  pushd "${srcdir}/data"
  sed -i '/export LD_LIBRARY_PATH=.*/d' Albion-Online
  sed -i '/export QT_QPA_PLATFORM_PLUGIN_PATH=.*/d' Albion-Online
  sed -i '/export QT_PLUGIN_PATH=.*/d' Albion-Online

  #sed -i 's,export LD_LIBRARY_PATH=.*,export LD_LIBRARY_PATH=/usr/lib,g' Albion-Online
  #sed -i 's,export QT_QPA_PLATFORM_PLUGIN_PATH=.*,export QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins/platforms,g' Albion-Online
  #sed -i 's,export QT_PLUGIN_PATH=.*,export QT_PLUGIN_PATH=/usr/lib/qt/plugins,g' Albion-Online
  sed -i 's,.*launcher/Albion-Online",QT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/opt/albion-online-launcher-bin/game_x64/Albion-Online_Data/Plugins/x86_64/libSDL2-2.0.so.0 "$SCRIPTPATH/launcher/Albion-Online",g' Albion-Online
  popd
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}"

  mkdir "${pkgdir}/opt/${pkgname}/staging_x64"
  chmod 775 "${pkgdir}/opt/${pkgname}/staging_x64"

  mkdir "${pkgdir}/opt/${pkgname}/game_x64"
  chmod 775 "${pkgdir}/opt/${pkgname}/game_x64"

  chmod 775 "${pkgdir}/opt/${pkgname}/launcher"
  
  # link launcher launcher
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/$pkgname/Albion-Online" "${pkgdir}/usr/bin/albion-online-launcher"

  # install .desktop file
  install -m755 -D "${srcdir}/albion-online-launcher.desktop" -t "${pkgdir}/usr/share/applications"

  # put the EULA somewhere
  install -Dm644 "${srcdir}/data/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

