# Maintainer: willemw <willemw12@gmail.com>

_pkgname=sickrage2
pkgname=$_pkgname-git
pkgver=2018.02.17.1.r0.g5066fab23
pkgrel=1
pkgdesc="Automatic video library manager for TV shows"
arch=('any')
url="https://github.com/SickRage/SickRage"
license=('GPL3')
#'python2-vcr' 'unrar'
makedepends=('git')
depends=('python2-babel' 'python2-cheetah' 'python2-mako')
#         'deluge: supported torrent client'
#         'qbittorrent: supported torrent client'
#         'rtorrent: supported torrent client'
#         'sabnzbd: supported NZB downloader'
#         'transmission-cli: supported torrent client'
optdepends=('python2-notify: desktop notifications'
            'unrar: RAR archives')
provides=($_pkgname 'sickrage')
conflicts=($_pkgname 'sickrage')
options=('!strip')
install=$pkgname.install
source=("$pkgname::git://github.com/SickRage/SickRage.git"
        'sickrage.service'
        'sickrage.sysusers'
        'sickrage.tmpfile')
md5sums=('SKIP'
         'fe94d9719f0d3a868f62efe9f3763a2d'
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
  python2 setup.py --quiet build
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

  install -dm755 "$pkgdir"/opt/sickrage/{app,data}

  # The install type is "source": .git folder is not included
  #cd $pkgname
  #python2 setup.py install --prefix=/opt/sickrage/app --install-lib=/opt/sickrage/app --root="$pkgdir" --optimize=1
  cp -rp $pkgname/* "$pkgdir/opt/sickrage/app/"

  warning "If the upgrade fails with \"error: failed to commit transaction (conflicting files)\", then uninstall first"
}

