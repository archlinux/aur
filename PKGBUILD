# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>


#########################################################################################################
# If upgrade fails with:
#     error: failed to commit transaction (conflicting files)
#     sickrage-git: /opt/sickrage/... exists in filesystem
#
# Then remove the conflicting files manually. The following removes all of the conflicting files as root:
#     rm -r $(ls -1d /opt/sickrage/* | grep -Ev "/backup.*|/cache.*|/config.ini.*|/Log*.*|/.*\.db.*")
#
# Use at your own risk! Stop sickrage.service and backup /opt/sickrage first.
#########################################################################################################


_pkgname=sickrage
pkgname=$_pkgname-git
pkgver=8.8.4.r41.g10d0371b3
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
makedepends=('git')
depends=('python2-apscheduler'
         'python2-cheetah'
         'python2-mako'
         'python2-notify'
         'python2-tornado'
         'python2-tzlocal')
#            'deluge: supported torrent client'
#            'qbittorrent: supported torrent client'
#            'rtorrent: supported torrent client'
#            'sabnzbd: supported NZB downloader'
#            'transmission-cli: supported torrent client'
optdepends=('python2-pyopenssl: enable SSL'
            'unrar: RAR archives')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SiCKRAGETV/SickRage.git"
        'sickrage.service'
        'sickrage.sysusers'
        'sickrage.tmpfile')
md5sums=('SKIP'
         '33532fd9a661c6dd38afdabb45695980'
         '6a7db7e14e74072d29e482b06b41dfa7'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python2 setup.py build
}

#check() {
#  cd $pkgname
#  python2 setup.py test
#}

package() {
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.sysusers "$pkgdir/usr/lib/sysusers.d/sickrage.conf"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"

  # The install type is "source": .git folder is not included
  #cd $pkgname
  #python2 setup.py install --prefix=/opt/sickrage --install-lib=/opt/sickrage --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir/opt/sickrage"
  cp -rp $pkgname/* "$pkgdir/opt/sickrage"
}

