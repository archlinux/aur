# Maintainer: willemw <willemw12@gmail.com>
# Contibutor: Justin Dray <justin@dray.be>
# Contibutor: B4SH-B00STER

_pkgname=sickrage
pkgname=$_pkgname-pip
pkgver=9.0.12.r0
pkgrel=1
pkgdesc="A PVR application that downloads and manages your TV shows. Echel0n fork of sickbeard, with tvrage, torrents and anime support."
arch=('any')
url="https://github.com/SiCKRAGETV/SickRage"
license=('GPL3')
##makedepends=('python2-virtualenv')
depends=('python2-virtualenv')
#         'deluge: supported torrent client'
#         'qbittorrent: supported torrent client'
#         'rtorrent: supported torrent client'
#         'sabnzbd: supported NZB downloader'
#         'transmission-cli: supported torrent client'
optdepends=('unrar: RAR archives')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
install=$pkgname.install
source=('sickrage.service'
        'sickrage.sysusers'
        'sickrage.tmpfile')
md5sums=('eb76e8676e0a2169364cb0041b0fb6f4'
         '6a7db7e14e74072d29e482b06b41dfa7'
         'f7a12df978d649da4e77d88e03f50252')

export PIP_DEFAULT_TIMEOUT=60

pkgver() {
  #pip2 search $_pkgname | awk '$1 == "sickrage" { gsub("[()]", ""); print $2 ".r0" }'
  #curl -s https://pypi.python.org/pypi/$_pkgname/json | grep version | head -1 | awk -F: '{ print $2 }' | awk -F'"' '$0=$2 ".r0"'
  curl -s https://pypi.python.org/pypi/$_pkgname/json | awk -F'"' '$2 == "version" { print $4 ".r0" }'
}

package() {
  install -Dm644 sickrage.service "$pkgdir/usr/lib/systemd/system/sickrage.service"
  install -Dm644 sickrage.sysusers "$pkgdir/usr/lib/sysusers.d/sickrage.conf"
  install -Dm644 sickrage.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sickrage.conf"

  install -dm755 "$pkgdir"/opt/sickrage/{app,data}

  ##virtualenv2 "$pkgdir/opt/sickrage/app"
  ### Patch: add extra dependencies
  ###"$pkgdir/opt/sickrage/app/bin/pip2" install --isolated sickrage
  ##"$pkgdir/opt/sickrage/app/bin/pip2" install --isolated sickrage lxml pyopenssl python-fanart
  ##
  ##find "$pkgdir"/opt/sickrage/app/lib/python*/site-packages/sickrage -name "*.py" -exec \
  ##    sed -i "s|\('pip_path'.*\)'pip'|\1'/opt/sickrage/app/bin/pip2'|" '{}' \;
}

