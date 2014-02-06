# Contributor : Anish Bhatt <anish[removethis][at]gatech[dot]edu>

pkgname=flashplugin-beta
_licensefile='PlatformClients_PC_WWEULA_Combined_20100108_1657.pdf'
pkgver=11.2.202.336
pkgrel=1

pkgdesc='Adobe Flash Player 11 Beta'
# Thanks Det for the correct URL
url='http://labs.adobe.com/downloads/flashplayer11-2.html'
arch=('i686' 'x86_64')

source=(flash_player_beta-${pkgver}.tar.gz::http://fpdownload.macromedia.com/get/flashplayer/pdc/$pkgver/install_flash_player_11_linux.i386.tar.gz
	mms.cfg
	LICENSE)
md5sums=('bd7f77dfd0a03bbbd5d124febb8c83d5'
	 '245c04e582a6cb993a2c2a1c3f62e7a2'
	 '05ccdb2de8f04af6641675975a807cf5')
_lib=lib
if [[ $CARCH == x86_64 ]]; then
source[0]=flash_player_beta-${pkgver}.tar.gz::http://fpdownload.macromedia.com/get/flashplayer/pdc/$pkgver/install_flash_player_11_linux.x86_64.tar.gz
md5sums[0]=63d0a9b141f5a52cf9c7a71bd4f785f2
_lib=lib64
fi
_licensefile='LICENSE'

depends=('mozilla-common' 'libxt' 'gtk2' 'nss' 'curl')
optdepends=('libvdpau: GPU acceleration on Nvidia card' 'libvdpau-git-flashpatch: libvdpau with fixed for blue overlay issue')
conflicts=('flashplugin')
provides=('flashplayer' 'flashplugin')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)

package() {
  # flash plugin
  install -D -m755 libflashplayer.so ${pkgdir}/usr/lib/mozilla/plugins/libflashplayer.so
 
  # kde kcm plugin & standalone settings executable 
  install -D -m755 ${srcdir}/usr/${_lib}/kde4/kcm_adobe_flash_player.so ${pkgdir}/usr/lib/kde4/kcm_adobe_flash_player.so
  install -D -m755 ${srcdir}/usr/bin/flash-player-properties ${pkgdir}/usr/bin/flash-player-properties

  # desktop entries for kde & gnome
  install -D -m644 ${srcdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop ${pkgdir}/usr/share/kde4/services/kcm_adobe_flash_player.desktop
  install -D -m644 ${srcdir}/usr/share/applications/flash-player-properties.desktop ${pkgdir}/usr/share/applications/flash-player-properties.desktop

  # icons
  install -D -m644 ${srcdir}/usr/share/pixmaps/flash-player-properties.png ${pkgdir}/usr/share/pixmaps/flash-player-properties.png
  for i in 16 22 24 32 48; do
    install -D -m644 usr/share/icons/hicolor/${i}x${i}/apps/flash-player-properties.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/flash-player-properties.png"
  done

  # license & config file (defaults to hardware offload disabled)
  install -D -m644 ${_licensefile} ${pkgdir}/usr/share/licenses/${pkgname}/${_licensefile}
  install -D -m644 mms.cfg ${pkgdir}/etc/adobe/mms.cfg
}


