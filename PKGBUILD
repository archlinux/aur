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
        "file://render-compose.sh"
        "file://podman-compose.override.yaml")
md5sums=('423657768bc2d9479b1d4d94a071a2e8'
         'c0abd821b7fa46bf65aacb53802d8f75'
         '69190df0c3b2ee74dce0cfa9476a75d7'
         '0b59e68cdc2c05467c2824edc7517a0b'
         '0ad65ce3028c32f9fdd451c13b8ed2e1'
         'c6e2066c6293f33a0960376236b7d3be'
         '86c471c654c795796dbef4f8f2f4bb8f'
         '7101f988ca10464d1332268f7d5126d2'
         '7ae799fcd90c612477ace9f39593d01f'
         'e897baedbae9c51c019ebc105e6b1bb9'
         '8a8c5c133ead1bd60bc4d1e18596b087')
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
    conflicts=('sabnzbd-docker')
    provides=('sabnzbd-podman')
    depends=('podman-compose' 'gettext')

    dest=${pkgdir}/opt/podman-sabnzbd
	mkdir -p ${dest}
	cp docker-compose.yaml ${dest}
	cp default.env ${dest} # for Unit service
	cp docker.env ${dest}/.env # for podman-compose
	install -m644 render-compose.sh "${dest}/render-compose.sh"
	install -m644 podman-compose.override.yaml "${dest}/podman-compose.override.yaml"

    dest=${pkgdir}/usr/lib/systemd/user/
	mkdir -p ${dest}
	cp sabnzbd-podman.service ${dest}
    cp sabnzbd-podman-update.service ${dest}
    cp sabnzbd-podman-update.timer ${dest}
}
