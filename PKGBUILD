# Maintainer: Jonathon Fernyhough <jonathon_at_m2x dotdev>

pkgname=mapton
pkgver=2.1.1
pkgrel=1
pkgdesc="Some kind of map application"
arch=(any)
url="https://mapton.org"
license=('Apache')
makedepends=('git' 'jdk11-openjdk' 'java11-openjfx' 'maven')

source=(git+https://github.com/trixon/mapton.git#tag=v$pkgver
        mapton.desktop
        jdkhome.patch
        settings.xml)
b2sums=('SKIP'
        '514d31d2d2f17f53382624f390e02469e19d0a60cd44aa52db1011429b2fa313038c9c04b262b5b29393e38ce6bc7a702d5c23058a5790ad053c7e5ae74e19bd'
        '5dab7052dfe1c612eb6563178bf7ba7ba8245411c6b60428b302c4f570f552ef96a1fcf08b873e39c7e8f8195a1de0c9dee115f0434950452c4d4fe2c152e0cb'
        '703df64460b6f8868c2b2be2b3323e6db14f63a5c4b3f2d3ea0b6249c727b48893472a4baf718516df2a129ff16ac14345b0666843c8f36bfb0fd48fb2898c80')

prepare() {
	cd $pkgname
	patch -Np1 -i ../jdkhome.patch
}

build() {
	export HOME="$srcdir" # Try to prevent maven from escaping the build root
	export JAVA_HOME=/usr/lib/jvm/java-11-openjdk # Requires JDK11
	export MAVENCACHE="${SRCDEST:-$srcdir}"  # Cache maven artefacts where possible

	cd $pkgname
	mvn -e package -gs "$srcdir"/settings.xml
}

package() {
	depends=('java-runtime>=11' 'java11-openjfx')
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
