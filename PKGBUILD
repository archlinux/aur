# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=mylar3
pkgver=0.8.3
pkgrel=5
pkgdesc='Comic book download automation for usenet and torrent users'
arch=(any)
url='https://github.com/mylar3/mylar3'
license=('GPL-3.0-or-later')
depends=(
  bash
  python
  python-apscheduler
  python-beautifulsoup4
  python-cfscrape
  python-cheroot
  python-cherrypy
  python-configparser
  python-feedparser
  python-mako
  python-natsort
  python-packaging
  python-pillow
  python-portend
  python-pycryptodome
  python-pystun3
  python-pytz
  python-rarfile
  python-requests
  python-simplejson
  python-six
  python-tenacity
  python-tzlocal
  python-urllib3
  python-user_agent2
  unrar
)
optdepends=(
  'sabnzbd: usenet downloader'
  'nzbget: usenet downloader'
  'qbittorrent: torrent downloader'
  'deluge: torrent downloader'
  'rtorrent: torrent downloader'
  'vuze: torrent downloader'
  'transmission-cli: torrent downloader (CLI and daemon)'
  'transmission-gtk: torrent downloader (GTK+)'
  'transmission-qt: torrent downloader (Qt)'
  'prowlarr: automatically integrates with and syncs indexers'
)
options=(!debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  "https://patch-diff.githubusercontent.com/raw/mylar3/mylar3/pull/1739.patch"
  mylar3.service
  mylar3.tmpfiles
  mylar3.sysusers
)

sha256sums=('ffb15cfc375590c872d0a6ce5fdc48323a94bdc623688c4598006aaf8edcdaa6'
            'c750760e56d6d84a9583ea9a9bd8871f79ce5292cb21d21fd1fd0e2768989c3a'
            '5aaf0be4bf33ab8e7868c14d78603317550d8ec90298cf355116fd6f72a32886'
            'fe53997e50e9c550b4fdd26fce44101633ea88e1007554b30dfa22a592fcfdc9'
            '807d2e3acd46873645e6c47988402178fe2d0cd2005457eef1b0612d2646175d')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../1739.patch

  sed -i 's/urllib2.HTTPError,e/\(urllib2.HTTPError,e\)/' lib/utorrent/client.py
  sed -i 's/import imghdr//' mylar/opds.py
  sed -i 's/import imghdr//' mylar/importer.py
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/mylar3"
  cp -dpr --no-preserve=ownership * "${pkgdir}/usr/lib/mylar3"
  cp -dp --no-preserve=ownership .LAST_RELEASE "${pkgdir}/usr/lib/mylar3/.LAST_RELEASE"
  python -m compileall "${pkgdir}"

  cd "${srcdir}"
  install -Dm644 "mylar3.service" "${pkgdir}/usr/lib/systemd/system/mylar3.service"
  install -Dm644 "mylar3.sysusers" "${pkgdir}/usr/lib/sysusers.d/mylar3.conf"
  install -Dm644 "mylar3.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mylar3.conf"
}
