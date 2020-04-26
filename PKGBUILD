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
b2sums=('SKIP'
        'e3046a9ae478221274ac425ed7afb7bd2c6d21204f8e4e6c46256f8db45d7f4438a62027f6fff86013e3d1ba099b6cade3aff05dd49f3409ab467e438e98cdcd')

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
