# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=open-ecard-git
pkgver=2085.e4a1e9e7
pkgrel=1
pkgdesc='Open eCard-App (opencard) is an open source alternative of the AusweisApp'
arch=('any')
url='https://www.openecard.org'
license=("GPL3")
depends=('jre8-openjdk' 'pcsclite')
makedepends=('git' 'maven' 'jdk8-openjdk')
source=('git://github.com/ecsec/open-ecard.git'
				startscript)
sha512sums=('SKIP'
            '6c9e24e30d6f80a60c255ace794bef34a674569c9bd69837a0208c182082a7ce0c46b537c16e879b285efcb917b66407dd8a2a31701fdf9c8e9c25e6dcb87986')

pkgver() {
	cd ${pkgname/-git/}
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd open-ecard/clients/richclient
	ln -s ../../../src/package src/
}

build() {
	cd open-ecard/clients/richclient
	mvn clean install
}

package() {
	install -Dm755 "startscript" "${pkgdir}"/usr/bin/open-ecard
	cd open-ecard/clients/richclient/target/
	install -Dm644 "richclient-$(ls *-bundle-cifs.jar | cut -d '-' -f2)-bundle-cifs.jar" "${pkgdir}"/usr/share/java/open-ecard/open-ecard.jar
}
