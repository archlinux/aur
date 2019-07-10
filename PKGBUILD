# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>
# Contibutor: B4SH-B00STER

_pkgname=sickrage
pkgname=$_pkgname-git
pkgver=9.4.117.r0.g1db69f779
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
#url="https://git.sickrage.ca/SiCKRAGE/sickrage.git"
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
makedepends=('git' 'libxml2' 'libxslt' 'python-virtualenv')
#depends=('deluge: supported torrent client'
#         'qbittorrent: supported torrent client'
#         'rtorrent: supported torrent client'
#         'sabnzbd: supported NZB downloader'
#         'transmission-cli: supported torrent client'
optdepends=('unrar: RAR archives')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
install=$pkgname.install
#source=("$pkgname::git+https://git.sickrage.ca/SiCKRAGE/sickrage.git"
source=("$pkgname::git+https://github.com/SiCKRAGETV/SickRage.git"
        'sickrage.service'
        'sickrage.sysusers'
        'sickrage.tmpfile')
md5sums=('SKIP'
         '1df007e4b5347e400622ae931a6aa7b6'
         '6a7db7e14e74072d29e482b06b41dfa7'
         'f7a12df978d649da4e77d88e03f50252')

export PIP_DEFAULT_TIMEOUT=60

pkgver() {
  #pip search $_pkgname | awk '$1 == "'$_pkgname'" { gsub("[()]", ""); print $2 ".r0" }'

  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  virtualenv .
  #./bin/pip install --isolated -U pip setuptools
  ./bin/pip install --isolated -r requirements.txt
}

package() {
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.sysusers "$pkgdir/usr/lib/sysusers.d/sickrage.conf"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"

  install -dm755 "$pkgdir"/opt/sickrage/data
  # Note: including .git/
  cp -a $pkgname "$pkgdir/opt/sickrage/app"
}

