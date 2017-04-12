# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=open-ecard-git
pkgver=1125.6b268aba
pkgrel=1
pkgdesc='Open eCard-App (opencard) is an open source alternative of the AusweisApp'
arch=('any')
url='https://www.openecard.org'
license=("GPL3")
depends=('jre8-openjdk' 'pcsclite')
makedepends=('maven' 'jdk8-openjdk')
source=(git://github.com/ecsec/open-ecard.git
		'startscript')
sha512sums=('SKIP'
            'a6ac11d3ec6d2f7ef7746138f1b286e3ad002d22ae008b2ac430024a3ab9d0ca798c8e06214af1a47c431a95a006151a1acd8931da50bb308ed1b0cab94c583d')

pkgver() {
	cd ${pkgname/-git/}
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd "${srcdir}/open-ecard/clients/richclient"
	ln -s ../../../src/package src/
}

build() {
	cd "${srcdir}/open-ecard/clients/richclient"
	mvn clean install
}

package() {
	install -D -m755 "startscript" "${pkgdir}/usr/bin/open-ecard"
	cd "${srcdir}/open-ecard/clients/richclient/target/"
	install -D -m644 "richclient-$(ls *-bundle-cifs.jar | cut -d '-' -f2)-bundle-cifs.jar" "${pkgdir}/usr/share/java/open-ecard/open-ecard.jar"
}
