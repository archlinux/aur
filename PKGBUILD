# Maintainer: Justin Dray <justin@dray.be>
# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="sonarr-develop"
pkgver=2.0.0.4163
pkgrel=1
pkgdesc="PVR for newsgroup users. Formerly known as NZBDrone, with added torrent support."
arch=(any)
url="http://www.sonarr.tv"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: an NZB downloader'
            'nzbget: an NZB downloader'
            'transmission: a torrent downloader'
            'deluge: a torrent downloader')
install='sonarr.install'
provides=('nzbdrone' 'nzbdrone-torrents' 'sonarr')
conflicts=('nzbdrone' 'nzbdrone-torrents' 'sonarr')
replaces=('nzbdrone' 'nzbdrone-torrents')
changelog=
source=("http://download.sonarr.tv/v2/develop/mono/NzbDrone.develop.tar.gz"
        "sonarr.sh"
        "sonarr.service"
        "sonarr.sysusers"
        "sonarr.install")
noextract=()
md5sums=('9b6a0eac833acb2faa17990ae909f2c6'
         'a7490c3f8d6c3a314b59f87f71086f1f'
         '41d8663e989a8db1fc4c6b81187a4d48'
         '9a334e656488c989309297fbb40c2520'
         '99387b40dd89f726319b67e1d1e480b5')

pkgver() {
	curl -Ss http://download.sonarr.tv/v2/develop/mono/ | awk 'match($0, "NzbDrone.develop.(2.[0-9.]*)\\.mono", ary) {print ary[1]}' | tail -n1
}

package() {
	cd "$srcdir"

	install -dm 755 "${pkgdir}/var/lib/sonarr"

	install -Dm644 "${srcdir}/sonarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/sonarr.conf"

	msg2 "Install Sonarr in /usr/lib"
	install -dm 755 "${pkgdir}/usr/lib/sonarr"
	cp -dpr --no-preserve=ownership "${srcdir}/NzbDrone/"* "${pkgdir}/usr/lib/sonarr"

	msg2 "Install executable into /usr/bin"
	install -Dm755 "${srcdir}/sonarr.sh" "${pkgdir}/usr/bin/sonarr"

	msg2 "Install sonarr.service"
	install -Dm 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
}
