# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Stefan Luecke <arch-aur@glaxx.net>

_pkgname=bumblebee-status
pkgname=bumblebee-status-git
pkgver=r2150.92ab1a3
pkgrel=2
pkgdesc='Modular, theme-able status line generator for the i3 window manager'
arch=('any')
url="https://github.com/tobi-wan-kenobi/bumblebee-status"
license=('MIT')
depends=('python' 'python-netifaces' 'python-psutil' 'python-requests')
optdepends=('xorg-xbacklight: to display a displays brightness'
            'xorg-xset: enable/disable automatic screen locking'
            'libnotify: enable/disable automatic screen locking'
            'dnf: display DNF package update information'
            'xorg-setxkbmap: display/change the current keyboard layout'
            'redshift: display the redshifts current color'
            'pulseaudio: control pulseaudio sink/sources'
            'xorg-xrandr: enable/disable screen outputs'
            'pacman: display current status of pacman'
            'iputils: display a ping'
            'i3ipc-python: display titlebar'
            'fakeroot: dependency of the pacman module'
            'python-pytz: timezone conversion for datetimetz module'
            'python-tzlocal: retrieve system timezone for datetimetz module'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/tobi-wan-kenobi/bumblebee-status')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/${_pkgname}/bumblebee_status/{core,util} \
    "$pkgdir"/usr/share/${_pkgname}/bumblebee_status/modules/{core,contrib} \
    "$pkgdir"/usr/share/${_pkgname}/themes/icons
  ln -s /usr/share/${_pkgname}/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
  ln -s /usr/share/${_pkgname}/bumblebee-ctl "$pkgdir"/usr/bin/bumblebee-ctl

  cd "$srcdir/${_pkgname}"
  cp -a --parents ${_pkgname} bumblebee_status/{,core/,util/,modules/core/,modules/contrib/}*.py \
    themes/{,icons/}*.json $pkgdir/usr/share/${_pkgname}
  cp -r bin $pkgdir/usr/share/${_pkgname}/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
}
