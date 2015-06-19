# Maintainer:  Karthik K         <hashken.distro@gmail.com>

pkgname=gnome-shell-google-calendar-git
pkgver=20140817
pkgrel=1
pkgdesc="A D-Bus service that fetches events from Google Calendar and makes theme available for GNOME Shell to display."
arch=('any')
url="https://github.com/hashken/gnome-shell-google-calendar"
license=('unknown')
makedepends=('git')
depends=('python2-dbus' 'gnome-shell' 'pygtk' 'python2-iso8601' 'python2-gdata')
install="${pkgname}.install"
source=("${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('7da5e2796cf090cf4c7b0ddf3cd96bc0'
         'cbcf0c1f212a4916b030828467842d7f')

_gitroot="git://github.com/hashken/gnome-shell-google-calendar.git"
_gitname="gnome-shell-google-calendar"

build() {
  cd ${srcdir}
  msg "Connecting to github GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  # install pyfiles
  mkdir -p "${pkgdir}/usr/share/gnome-shell-google-calendar"
  install -Dm 0755 "${srcdir}/${_gitname}/gnome-shell-google-calendar.py" "${pkgdir}/usr/share/gnome-shell-google-calendar/gnome-shell-google-calendar.py"
  install -Dm 0755 "${srcdir}/${_gitname}/oauth.py" "${pkgdir}/usr/share/gnome-shell-google-calendar/oauth.py"
  install -Dm 0755 "${srcdir}/${_gitname}/config.py" "${pkgdir}/usr/share/gnome-shell-google-calendar/config.py"
  install -Dm 0755 "${srcdir}/${_gitname}/keyring.py" "${pkgdir}/usr/share/gnome-shell-google-calendar/keyring.py"

  # autostart
  mkdir -p "${pkgdir}/etc/xdg/autostart"
  install -Dm 0644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/etc/xdg/autostart/gnome-shell-google-calendar.desktop"
  install -Dm 0755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/share/gnome-shell-google-calendar/gnome-shell-google-calendar-startup.sh"
}

# vim:set ts=2 sw=2 et:
