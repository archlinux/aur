# Maintainer: effeffe <filippo dot falezza at outlook dot it>

pkgname=osp-tracker
pkgver=6.1.1
arch=('x86_64')
pkgrel=1
pkgdesc='Tracker video analysis and modeling tool'
url='http://physlets.org/tracker/'
license=('GPL3')
depends=('gtk2'
         'gconf'
         'java-runtime')
makedepends=('xdg-user-dirs' 'xdg-utils')
_runname="Tracker-${pkgver}-linux-64bit-installer.run"
source=(
  "${url}/installers/${_runname}"
  "tracker.sh"
  "tracker.desktop"
)
sha256sums=(
  '1d3ba421122468aebef3f9a0f7d07ad8ca6dd699076f4baabb7f4a4568345b94'
  '0c36e09d4f2e2ab8cd39ee1ed896ce96db217bd2eff7a8522d426e15acf93f8d'
  '73664881f365a5640ca0c4ef83776105522ce3594f6961f2505766fea6bc361b'
)

package() {

  echo ${pkgdir}
  export XDG_UTILS_INSTALL_MODE=user
  msg2 'Starting Tracker installer'
  chmod +x ./${_runname}
  [ -f ~/.config/user-dirs.dirs ] || xdg-user-dirs-update
  ./${_runname} \
	  --mode unattended \
	  --tracker-home ${pkgdir}/opt/tracker \
	  --experiments-home ${pkgdir}/opt/tracker/share \
	  --enable-components Experiments \
	  --unattendedmodeui none || true #ignore errors due to attempts to copy files to /usr/share/applications

  msg2 'Creating desktop file and symlinks'
  install -D -m755 tracker.sh ${pkgdir}/usr/bin/${pkgname}
  install -D -m755 tracker.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m644 ${pkgdir}/opt/tracker/tracker_icon48.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

}
