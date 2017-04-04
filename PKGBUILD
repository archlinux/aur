# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>

_pkgname=sickrage
pkgname=$_pkgname-git
pkgver=8.8.4.r85.gb1b4f64e5
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
makedepends=('git')
depends=('python2-apscheduler'
         'python2-cheetah'
         'python2-mako'
         'python2-tornado'
         'python2-tzlocal')
#            'deluge: torrent client'
#            'qbittorrent: torrent client'
#            'rtorrent: torrent client'
#            'sabnzbd: NZB downloader'
#            'transmission-cli: torrent client'
optdepends=('python2-notify: desktop notifications'
            'python2-pyopenssl: enable SSL'
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
         'eb4e1f9ca758af1adc3c7d93ad4b264f'
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

  install -dm755 "$pkgdir"/opt/sickrage/{app,data}

  # The install type is "source": .git folder is not included
  #cd $pkgname
  #python2 setup.py install --prefix=/opt/sickrage/app --install-lib=/opt/sickrage/app --root="$pkgdir" --optimize=1
  cp -rp $pkgname/* "$pkgdir/opt/sickrage/app/"
}

