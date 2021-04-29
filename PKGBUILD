# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albion-online-launcher-bin
pkgver=1.16
pkgrel=2
pkgdesc="The first true cross-platform Sandbox MMO -- launcher client"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
makedepends=('chrpath')
depends=('libgl' 'qt5-webengine' 'sndio' 'xdelta3' 'ttf-font')
optdepends=(albion-online-live-game-data-bin albion-online-staging-game-data-bin)
source=("https://live.albiononline.com/clients/20210419110001/albion-online-setup"
	"albion-online-launcher.desktop" "albion-online")
install=albion-online-launcher-bin.install
options=(!strip docs libtool emptydirs !zipman staticlibs)
sha256sums=('e220437b7a943769af42196ed23df2e6652b147f2eb78f6ad8f60a0c0028b078'
            '4d94016e053c4d670c88631cbeb89442b1d0447265a2993e44337037288143c2'
            '5127e055b747d3deb0a8563daeeb3dfacd123c108e027d286759e0ea3938a17e')

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
  #sed -i 's,.*launcher/Albion-Online",QT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/opt/albion-online-launcher-bin/game_x64/Albion-Online_Data/Plugins/x86_64/libSDL2-2.0.so.0 LD_PRELOAD=/usr/lib/libsndio.so "$SCRIPTPATH/launcher/Albion-Online",g' Albion-Online
  sed -i 's,.*launcher/Albion-Online",sed -i -e "/Screenmanager Resolution Height/d" "$HOME/.config/unity3d/Sandbox Interactive GmbH/Albion Online Client/prefs"\nsed -i -e "/Screenmanager Resolution Width/d" "$HOME/.config/unity3d/Sandbox Interactive GmbH/Albion Online Client/prefs"\nQT_AUTO_SCREEN_SCALE_FACTOR=0 LD_PRELOAD=/opt/albion-online-launcher-bin/game_x64/Albion-Online_Data/Plugins/x86_64/libSDL2-2.0.so.0 "$SCRIPTPATH/launcher/Albion-Online",g' Albion-Online
  popd
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -a "${srcdir}/data" "${pkgdir}/opt/${pkgname}"
  chmod 777 $pkgdir/opt

  mkdir "${pkgdir}/opt/${pkgname}/staging_x64"
  chmod 775 "${pkgdir}/opt/${pkgname}/staging_x64"
  mkdir -p "${pkgdir}/opt/${pkgname}/game_x64"

  chmod 775 "${pkgdir}/opt/${pkgname}/launcher"

  # make the game think it's using the right version of libsndio
  mkdir -p "${pkgdir}/usr/lib"
  ln -s /usr/lib/libsndio.so "${pkgdir}/usr/lib/libsndio.so.6.1"
  
  # link launcher launcher
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 -D "${srcdir}/albion-online" "${pkgdir}/usr/bin"

  # install .desktop file
  install -m755 -D "${srcdir}/albion-online-launcher.desktop" -t "${pkgdir}/usr/share/applications"

  # put the EULA somewhere
  install -Dm644 "${srcdir}/data/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

