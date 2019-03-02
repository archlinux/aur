# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=mapton
pkgver=0.8.0
pkgrel=4
pkgdesc="Some kind of map application"
arch=(any)
url="https://mapton.org"
license=('Apache')
depends=('java-runtime>=8' 'java-openjfx')
makedepends=('git' 'jdk8-openjdk' 'maven')

_commit=2091754f0454155d72a32d3004e4789ed5f1f3ad
source=(git+https://github.com/trixon/mapton.git#commit=$_commit
        mapton.desktop
        git+https://github.com/trixon/almond3.git#commit=3f16b553bb4dad3ecf72508e5d9e5cee17da934a
        git+https://github.com/rterp/GMapsFX.git#commit=4623d3f768e8ad78fc50ee32dd204d236e01059f)
sha256sums=('SKIP'
            '303620b07b9a48324acfa2541a1f93fe5630cca7919cd5b5b1141f0ffe7b6cd7'
            'SKIP'
            'SKIP')

export HOME=/nonexistent

prepare() {
	cd $pkgname
	ln -sf ../almond3
	ln -sf ../GMapsFX
}

build() {
	MAVENCACHE="${SRCDEST:-$srcdir}"
	export MAVENCACHE

	cd "$srcdir"/$pkgname/almond3
	mvn clean install -gs "$srcdir"/../settings.xml

	cd "$srcdir"/$pkgname/GMapsFX/GMapsFX
	mvn clean install -gs "$srcdir"/../settings.xml -Dmaven.javadoc.skip=true

	cd "$srcdir"/$pkgname
	mvn -e package -gs "$srcdir"/../settings.xml
}

package() {
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

