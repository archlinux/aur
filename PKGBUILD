# Maintainer: Julian Wolff <wolff at julianwolff dot de>
pkgname=jackman-git
pkgver=r93.e49a782
pkgrel=1
pkgdesc='Collection of scripts that help managing multiple audio interfaces with Jack'
arch=('any')
url='https://github.com/progwolff/jackman'
license=('GPL-3.0-or-later')
conflicts=(jackman)
provides=(jackman)
depends=('jack' 'alsa-utils' 'python-dbus' 'systemd' 'coreutils')
makedepends=('git')
optdepends=('zenity: system notifications'
	   'kdialog: system notifications')
source=('jackman::git+https://github.com/progwolff/jackman.git')
md5sums=('SKIP')

_gitroot="https://github.com/progwolff/jackman.git"
_gitname=jackman

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

install=.install

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  mkdir -p "$pkgdir/etc/xdg/autostart/"
  cp ./${_gitname}/50-jackman.rules "$pkgdir/usr/lib/udev/rules.d/"
  cp ./${_gitname}/jackman "$pkgdir/usr/bin/"
  cp ./${_gitname}/jackman_udev* "$pkgdir/usr/bin/"
  cp ./${_gitname}/*.service "$pkgdir/usr/lib/systemd/system/"
  for d in `cd ./${_gitname}/po; ls -1 *.po 2>/dev/null`; do
  	mkdir -p "$pkgdir/usr/share/locale/${d%.po}/LC_MESSAGES"
  	msgfmt -o "$pkgdir/usr/share/locale/${d%.po}/LC_MESSAGES/jackman.mo" ./${_gitname}/po/${d} 
  done
}

