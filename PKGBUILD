# Maintainer: willemw <willemw12@gmail.com>


# If upgrade fails with:
#     error: failed to commit transaction (conflicting files)
#     sickrage-git: /opt/sickrage/... exists in filesystem
#
# Then remove the conflicting files manually. The following removes all of the conflicting files:
#     # rm $(ls -1d /opt/sickrage/* | grep -Ev "/backup.*|/cache.*|/config.ini.*|/Log.*|/.*\.db.*")
#
# Use at your own risk! Stop the service and backup /opt/sickrage first.


_pkgname=sickrage2
pkgname=$_pkgname-git
pkgver=2016.05.20.1.r6.ga70d27a
pkgrel=1
pkgdesc="Automatic torrent/nzb video library manager for TV shows"
arch=('any')
url="https://github.com/SickRage/SickRage"
license=('GPL3')
#unrar
makedepends=('git')
depends=('python2-mako' 'python2-cheetah')
#            'deluge: supported torrent client'
#            'qbittorrent: supported torrent client'
#            'rtorrent: supported torrent client'
#            'sabnzbd: supported NZB downloader'
#            'transmission-cli: supported torrent client'
optdepends=('python2-lockfile: use file cache'
            'python2-ndg-httpsclient: enable ssl'
            'python2-notify: desktop notifications'
            'python2-pyasn1: enable ssl'
            'python2-pyopenssl: enable SSL'
            'unrar: RAR archives')
provides=($_pkgname 'sickrage')
conflicts=($_pkgname 'sickrage')
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SickRage/SickRage.git"
        'sickrage.service'
        'sickrage.tmpfile')
md5sums=('SKIP'
         '6b19af092794f3d65a4651ef1a9c7e2e'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd $pkgname
#  sed -i 's/UnRAR2/unrar2/g' lib/unrar2/test_UnRAR2.py
#}
#
#check() {
#  cd $pkgname/lib/unrar2
#  PYTHONPATH="$(pwd)/..:$PYTHONPATH" python2 test_UnRAR2.py
#}

package() {
  # The install type is "source": don't include the .git folder
  install -dm755 "$pkgdir/opt/sickrage"
  cp -rp $pkgname/* "$pkgdir/opt/sickrage"
 
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"
}

