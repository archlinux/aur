# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=mapton
pkgver=1.1.2
pkgrel=2
pkgdesc="Some kind of map application"
arch=(any)
url="https://mapton.org"
license=('Apache')
makedepends=('git' 'jre8-openjdk' 'jdk8-openjdk' 'java8-openjfx' 'maven')

_commit=1cb5a943593498ca92544b097a60e05351430487
source=(git+https://github.com/trixon/mapton.git#commit=$_commit
        mapton.desktop)
sha256sums=('SKIP'
            '303620b07b9a48324acfa2541a1f93fe5630cca7919cd5b5b1141f0ffe7b6cd7')

export HOME=/nonexistent

build() {
	MAVENCACHE="${SRCDEST:-$srcdir}"
	export MAVENCACHE

	cd "$srcdir"/$pkgname
	mvn -e package -gs "$srcdir"/../settings.xml
}

package() {
	depends=('java-runtime>=8' 'java8-openjfx')
	cd mapton/application/target/mapton

	# Initial target directories
	install -d "$pkgdir"/opt/mapton "$pkgdir"/usr/bin

	# Majority of files, ensure file permissions are correct
	cp -r {etc,extra,mapton,platform} "$pkgdir"/opt/mapton
	rm -f "$pkgdir"/opt/mapton/bin/*.exe
	chmod -R u=rwX,go=rX "$pkgdir"/opt

	# Executables and launchers
	install -D bin/mapton "$pkgdir"/opt/mapton/bin/mapton
	ln -s /opt/mapton/bin/mapton "$pkgdir"/usr/bin/mapton
	install -D "$srcdir"/mapton.desktop "$pkgdir"/usr/share/applications/mapton.desktop
	install -Dm644 "$srcdir"/mapton/mapton.png "$pkgdir"/usr/share/pixmaps/mapton.png
}

