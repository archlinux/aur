# Maintainer: Romain Gallet <gr211 at users.noreply.github.com>
# Contributor: Romain Gallet <gr211 at users.noreply.github.com>
_packager="Romain Gallet <gr211 at users.noreply.github.com>"
pkgver=0.5
pkgname=('sabnzbd-docker' 'sabnzbd-podman')
pkgrel=1
pkgdesc='Convenience launch service for Sabnzd, Nzbhydra2 and Sonarr in docker or podman'
url="https://github.com/grumlimited/sabnzbd-docker"
arch=('any')
license=('GPL-3.0-or-later')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
backup=()
options=()
source=("file://sabnzbd-docker.service"
        "file://sabnzbd-docker-update.timer"
        "file://sabnzbd-docker-update.service"
        "file://sabnzbd-podman.service"
        "file://sabnzbd-podman-update.timer"
        "file://sabnzbd-podman-update.service"
        "file://docker-compose.yaml"
        "file://default.env"
        "file://docker.env"
        "file://render-compose.sh")
md5sums=('09d427d3b1de5bb5d14d674d18b778df'
         'c0abd821b7fa46bf65aacb53802d8f75'
         'ea97809a538b2c58e39c6828c6e412ed'
         'df3cb6453c3232926a4457711abcc63c'
         '0ad65ce3028c32f9fdd451c13b8ed2e1'
         '63d924b88b035c4a52b86e3bed931412'
         '86c471c654c795796dbef4f8f2f4bb8f'
         '7101f988ca10464d1332268f7d5126d2'
         '7ae799fcd90c612477ace9f39593d01f'
         'e897baedbae9c51c019ebc105e6b1bb9')
noextract=()

package_sabnzbd-docker() {
    install=sabnzbd-docker.install
    conflicts=('sabnzbd-podman')
    provides=('sabnzbd-podman')
    depends=('docker-compose')

    dest=${pkgdir}/opt/docker-sabnzbd
	mkdir -p ${dest}
	cp docker-compose.yaml ${dest}
	cp default.env ${dest} # for Unit service
	cp docker.env ${dest}/.env # for docker-compose

    dest=${pkgdir}/usr/lib/systemd/user/
	mkdir -p ${dest}
	cp sabnzbd-docker.service ${dest}
	cp sabnzbd-docker-update.service ${dest}
	cp sabnzbd-docker-update.timer ${dest}
}

package_sabnzbd-podman() {
    install=sabnzbd-podman.install
#     conflicts=('sabnzbd-docker')
    provides=('sabnzbd-podman')
    depends=('podman-compose' 'gettext')

    dest=${pkgdir}/opt/podman-sabnzbd
	mkdir -p ${dest}
	cp docker-compose.yaml ${dest}
	cp default.env ${dest} # for Unit service
	cp docker.env ${dest}/.env # for podman-compose
	install -m644 render-compose.sh "${dest}/render-compose.sh"

    dest=${pkgdir}/usr/lib/systemd/user/
	mkdir -p ${dest}
	cp sabnzbd-podman.service ${dest}
    cp sabnzbd-podman-update.service ${dest}
    cp sabnzbd-podman-update.timer ${dest}
}
