# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=xscreensaver-dbus-screenlock
pkgver=1
pkgrel=2
pkgdesc="Emulate gnome-screensaver's dbus for integrated screen-locking in gnome-derivatives"
arch=('i686' 'x86_64')
url="http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175"
license=('GPL')
depends=('xscreensaver' 'python' 'dbus' 'gnome-settings-daemon-compat')
optdepends=('indicator-session: Activate "Lock" from indicator')
provides=('gnome-screensaver')
conflicts=('gnome-screensaver')
source=('xscreensaver-dbus-screenlock.py'
	'xscreensaver-dbus-screenlock.desktop')
md5sums=('0a1f60e3834481b1b3043d484d4ffcf7'
         'd334857a577f92413ddf5d16df79c15c')

package() {

  # Don't install xscreensaver-dbus-screenlock.py script if user has a personalized copy
  if [ ! -f "/usr/local/sbin/xscreensaver-dbus-screenlock.py" ]; then
    install -Dm755 {${srcdir},${pkgdir}/usr/bin}/xscreensaver-dbus-screenlock.py
  fi

  # This startup script runs in user sesssions with user permissions.
  # Because dbus sessions are exclusive, both gnome-session and indicator session expect this.
  # It might be more secure to run the process as root, but users would be locked out of sessions!
  # Regardless, gnome-screensaver works just the same way so whatever...
  install -Dm644 {${srcdir},${pkgdir}/etc/xdg/autostart}/xscreensaver-dbus-screenlock.desktop

  # Redirect gnome-screensaver-command calls to xscreensaver-command
  install -Ddm755 "${pkgdir}/usr/bin/"
  ln -s /usr/bin/xscreensaver-command "${pkgdir}/usr/bin/gnome-screensaver-command"

}
