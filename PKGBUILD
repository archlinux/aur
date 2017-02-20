# Maintainer: willemw <willemw12@gmail.com>


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


_pkgname=sickrage2
pkgname=$_pkgname-git
pkgver=2017.02.15.1.r0.gd95ec8242
pkgrel=1
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://github.com/SickRage/SickRage"
license=('GPL3')
#'python2-vcr' 'unrar'
makedepends=('git')
depends=('python2-mako' 'python2-cheetah' 'python2-notify')
#            'deluge: supported torrent client'
#            'qbittorrent: supported torrent client'
#            'rtorrent: supported torrent client'
#            'sabnzbd: supported NZB downloader'
#            'transmission-cli: supported torrent client'
optdepends=('unrar: RAR archives')
provides=($_pkgname 'sickrage')
conflicts=($_pkgname 'sickrage')
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SickRage/SickRage.git"
        'sickrage.service'
        'sickrage.sysusers'
        'sickrage.tmpfile')
md5sums=('SKIP'
         '8bcab15afae457968fee581bf452480b'
         '6a7db7e14e74072d29e482b06b41dfa7'
         'f7a12df978d649da4e77d88e03f50252')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd $pkgname
#  sed -i 's/UnRAR2/unrar2/g' lib/unrar2/test_UnRAR2.py
#}

build() {
  cd $pkgname
  python2 setup.py build
}

#check() {
#  cd $pkgname
#  python2 setup.py test
#
#  cd lib/unrar2
#  PYTHONPATH="$(pwd)/..:$PYTHONPATH" python2 test_UnRAR2.py
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

