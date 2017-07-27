# Maintainer: William Giokas <1007380@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# PKGBUILD based on extra\deluge's PKGBUILD, adapted for -git version by Berseker

pkgname=deluge-stable-git
_gitname="deluge"
_gitbranch="1.3-stable"
pkgver=1.3.15.r6.g6d14be18b
pkgrel=1
pkgdesc="A bittorrent client written with python and pygtk - Git Stable branch Version"
arch=('any')
url="http://deluge-torrent.org/"
license=('GPL3')
depends=('python2-xdg'
         'python2-twisted'
         'python2-pyopenssl'
         'xdg-utils'
         'python2-chardet'
         'desktop-file-utils'
         'hicolor-icon-theme'
         'python2-distribute')
makedepends=('intltool'
             'pygtk'
             'librsvg'
             'python2-mako'
             'git'
             'python2-distribute'
             'libtorrent-rasterbar')
optdepends=('libtorrent-rasterbar: deluge daemon, including local daemon'
            'python2-notify: libnotify notifications'
            'pygtk: needed for gtk ui'
            'librsvg: needed for gtk ui'
            'python2-mako: needed for web ui')
provides=('deluge')
conflicts=('deluge' 'deluge-svn' 'deluge-stable' 'deluge-git')
replaces=('deluge-svn' 'deluge-stable')
source=("git://github.com/deluge-torrent/deluge#branch=$_gitbranch"
        deluge.tmpfiles.conf
        deluged.service
        deluge-web.service
        deluged.conf)
install=deluge-stable.install
md5sums=('SKIP'
         'c50385d32a2db0ef3f46b8caadb0e988'
         '6b831c889f365f58317dc4b78c167a62'
         'b3fff6601a5971bba89fa9a85dcf9ce8'
         '75e591b738cf9f858af2de8665a3b3e7')

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
  
  cd "${srcdir}"
  install -Dm644 deluge.tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/deluge.conf"
  install -Dm644 deluged.service "$pkgdir/usr/lib/systemd/system/deluged.service"
  install -Dm644 deluge-web.service "$pkgdir/usr/lib/systemd/system/deluge-web.service"
  install -Dm644 deluged.conf "$pkgdir/etc/conf.d/deluged"

  install -d "$pkgdir/srv"
  install -d -m 664 -o 125 -g 125 "$pkgdir/srv/deluge"
}
