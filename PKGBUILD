# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>

pkgname=mapton
pkgver=1.1.3
pkgrel=1
pkgdesc="Some kind of map application"
arch=(any)
url="https://mapton.org"
license=('Apache')
makedepends=('git' 'jre8-openjdk' 'jdk8-openjdk' 'java8-openjfx' 'maven')

source=(git+https://github.com/trixon/mapton.git#tag=v$pkgver
        mapton.desktop
        jdkhome.patch)
sha256sums=('SKIP'
            '303620b07b9a48324acfa2541a1f93fe5630cca7919cd5b5b1141f0ffe7b6cd7'
            '16a6788545ecc091bc56057def2362db0de3cea4705d675ee769070136b40f40')

export HOME=/nonexistent

prepare() {
	cd $pkgname
	patch -Np1 -i ../jdkhome.patch
}

build() {
	# Requires JDK8
	export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

	MAVENCACHE="${SRCDEST:-$srcdir}"
	export MAVENCACHE

	cd $pkgname
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
