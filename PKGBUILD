# Maintainer: effeffe <filippo.falezza at outlook dot it>
# Maintainer: Zookah <zookah77 at gmail dot com>
# Maintainer: Ydallilar <yigit dot dallilar at gmail dot com>
# Contributor: Qinq-net

pkgname=osp-tracker
pkgver=5.1.4
arch=('x86_64')
pkgrel=2
pkgdesc='Tracker video analysis and modeling tool'
url='http://physlets.org/tracker/'
license=('GPL3')
depends=('gtk2'
         'gconf'
         'java-runtime')
makedepends=('xdg-user-dirs' 'xdg-utils')
_runname="Tracker-${pkgver}-linux-64bit-installer.run"
source=("${url}/installers/${_runname}"
        "tracker.sh"
        "tracker.desktop")
md5sums=('6a340f4e2e15e73caf81c418676c7bd9'
         '4f457c6b8231a48eb3cd302c7629fd9d'
         '805138863c7eb51258022e4d66edab92')

package() {

  echo "${pkgdir}"
  export XDG_UTILS_INSTALL_MODE=user
  msg2 'Starting Tracker installer'
  chmod +x "./${_runname}"
  [ -f ~/.config/user-dirs.dirs ] || xdg-user-dirs-update
  ./${_runname} \
	  --mode unattended \
	  --tracker-home "${pkgdir}/opt/tracker" \
	  --experiments-home "${pkgdir}/opt/tracker/share" \
	  --enable-components Experiments \
	  --unattendedmodeui none || true #ignore errors due to attempts to copy files to /usr/share/applications

  msg2 'Creating desktop file and symlinks'
  install -D -m755 "tracker.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m755 "tracker.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${pkgdir}/opt/tracker/tracker_icon48.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}
