# Maintainer: William Giokas <1007380@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# PKGBUILD based on extra\deluge's PKGBUILD, adapted for -git version by Berseker
#Maintainer: Solomon Choina <shlomochoina @ gmail.com>
pkgname=deluge-stable-git
_gitname="deluge"
_gitbranch="1.3-stable"
pkgver=1.3.15.r19.gd62987089
pkgrel=4
pkgdesc="A bittorrent client written with python and pygtk - Git Stable branch Version"
arch=('any')
url="http://deluge-torrent.org/"
license=('GPL3')
depends=('python2'
         'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=('intltool'
             'libtorrent-rasterbar'
	           'python2-chardet'
	           'python2-pyopenssl'
	           'python2-twisted'
	           'python2-xdg')
optdepends=('python2-service-identity'
	'libtorrent-rasterbar: required for daemon'
	'pygtk: required for GTK client'
	'xdg-utils: required for GTK client'
	'python2-chardet: required for GTK client'
	'python2-xdg: required for GTK client'
	'python2-notify: optional for GTK client'
	'python2-pygame: optional for GTK client'
	'python2-libappindicator: optional for GTK client'
	'python2-mako: required for web client')
provides=('deluge')
conflicts=('deluge' 'deluge-svn' 'deluge-stable' 'deluge-git')
replaces=('deluge-svn' 'deluge-stable')
source=("git://github.com/deluge-torrent/deluge#branch=$_gitbranch"
        deluged.service
        deluge-web.service
        deluged.environment)
md5sums=('SKIP'
         'a20aa31829ba59f6153545be353a0a07'
         'c4371974414e6b9003f62a53954eefea'
         '71d556cf7ce3bb59391797827347e80c')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --always --long --tags | sed -E 's/deluge-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/$_gitname"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Quick fix to keep namcap from thinking we need Python 3
	sed -i -e '1s@python@python2@' "${pkgdir}/usr/lib/python2.7/site-packages/deluge/ui/Win32IconImagePlugin.py"
  cd "${srcdir}"

  install -Dm644 deluged.service "$pkgdir/usr/lib/systemd/system/deluged.service"
  install -Dm644 deluge-web.service "$pkgdir/usr/lib/systemd/system/deluge-web.service"
  install -Dm644 deluged.environment "$pkgdir/etc/conf.d/deluged"

  echo 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
	      install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  echo 'd /srv/deluge 0770 deluge deluge' |
	      install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
